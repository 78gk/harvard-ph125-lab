library(tidyverse)
library(lubridate)
library(dslabs)
set.seed(1)
data("movielens")

out_dir <- "c:\\projects\\Building Machine Learning Models\\harvard-ph125-lab\\outputs\\figures"
if(!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

# Ensure `year` column exists and is numeric
if(!"year" %in% names(movielens)){
  movielens <- movielens %>%
    mutate(year = str_extract(title, "\\((\\d{4})\\)") %>% str_remove_all("[()]") %>% as.numeric())
} else {
  movielens <- movielens %>% mutate(year = as.numeric(year))
}

## Q1: number of ratings per movie and boxplot by year (sqrt transform)
movie_counts <- movielens %>%
  group_by(movieId, title, year) %>%
  summarise(n = n(), .groups = "drop") %>%
  filter(!is.na(year))

# compute median per year
median_by_year <- movie_counts %>% group_by(year) %>% summarise(median_n = median(n), .groups = "drop")
year_high_med <- median_by_year %>% filter(median_n == max(median_n)) %>% pull(year)

p1 <- ggplot(movie_counts, aes(x = factor(year), y = n)) +
  geom_boxplot(outlier.size = 0.5) +
  scale_y_continuous(trans = scales::sqrt_trans(), name = "sqrt(number of ratings)") +
  xlab("Year") + theme_minimal() + theme(axis.text.x = element_text(angle=90, vjust=0.5, hjust=1))
ggsave(file.path(out_dir, "q1_boxplot_ratings_by_year.png"), p1, width = 12, height = 6)

cat("Q1 - year with highest median number of ratings:\n")
cat(year_high_med, "\n\n")

## Q2: among movies from 1993 onward, compute ratings per year (use 2018 as end year)
post1993 <- movie_counts %>% filter(year >= 1993)
post1993 <- post1993 %>% mutate(years = 2018 - year, ratings_per_year = n / ifelse(years>0, years, 1))

top25 <- post1993 %>% arrange(desc(ratings_per_year)) %>% slice(1:25)

# compute average rating for top25 movies
avg_ratings <- movielens %>% filter(movieId %in% top25$movieId) %>% group_by(movieId, title) %>% summarise(avg_rating = mean(rating), n = n(), .groups = "drop")

shaw <- avg_ratings %>% filter(str_detect(title, regex("Shawshank Redemption", ignore_case = TRUE))) %>% pull(avg_rating)
forrest_n_per_year <- post1993 %>% filter(str_detect(title, regex("Forrest Gump", ignore_case = TRUE))) %>% pull(ratings_per_year)

cat("Q2 - average rating for The Shawshank Redemption:\n")
cat(shaw, "\n")
cat("Q2 - ratings per year for Forrest Gump:\n")
cat(forrest_n_per_year, "\n\n")

## Q3: stratify post-1993 movies by ratings per year and compute avg ratings
ratings_year_table <- movielens %>%
  inner_join(post1993 %>% select(movieId, ratings_per_year), by = "movieId") %>%
  group_by(movieId, ratings_per_year) %>%
  summarise(avg_rating = mean(rating), .groups = "drop")

p3 <- ggplot(ratings_year_table, aes(x = ratings_per_year, y = avg_rating)) +
  geom_point(alpha = 0.4) + geom_smooth(method = "loess") +
  xlab("Ratings per year") + ylab("Average rating") + theme_minimal()
ggsave(file.path(out_dir, "q3_avg_rating_vs_ratings_per_year.png"), p3, width = 8, height = 5)

# Assess trend via linear model
lm_fit <- lm(avg_rating ~ ratings_per_year, data = ratings_year_table)
lm_p <- summary(lm_fit)$coefficients[2,4]
lm_beta <- coef(lm_fit)[2]

trend_desc <- if(abs(lm_beta) < 1e-6 || lm_p > 0.05) {
  "There is no relationship between how often a movie is rated and its average rating."
} else if(lm_beta > 0 & lm_p <= 0.05) {
  "The more often a movie is rated, the higher its average rating."
} else if(lm_beta < 0 & lm_p <= 0.05) {
  "The more often a movie is rated, the lower its average rating."
} else {
  "There is no relationship between how often a movie is rated and its average rating."
}

cat("Q3 - trend observed:\n")
cat(trend_desc, "\n\n")

## Q4: imputation strategy based on Q3
cat("Q4 - recommended imputation strategy:\n")
if(lm_beta > 0 & lm_p <= 0.05) {
  cat("Fill in the missing values with a lower value than the average rating across all movies.\n\n")
} else if(lm_beta < 0 & lm_p <= 0.05) {
  cat("Fill in the missing values with a higher value than the average rating across all movies.\n\n")
} else {
  cat("Fill in the missing values with the average rating across all movies.\n\n")
}

## Q5: which code correctly creates date column
cat("Q5 - correct code to create date column:\n")
cat("movielens <- mutate(movielens, date = as_datetime(timestamp))\n\n")

## Q6: average rating per week
movielens <- movielens %>% mutate(date = as_datetime(timestamp))
weekly <- movielens %>% mutate(week = round_date(date, unit = "week")) %>% group_by(week) %>% summarise(avg = mean(rating), .groups = "drop")

p6 <- ggplot(weekly, aes(x = week, y = avg)) + geom_line() + geom_smooth() + theme_minimal() + ylab("Average rating")
ggsave(file.path(out_dir, "q6_weekly_avg_rating.png"), p6, width = 10, height = 5)

# assess trend significance
time_num <- as.numeric(weekly$week)
lm_time <- lm(avg ~ time_num, data = weekly)
pv_time <- summary(lm_time)$coefficients[2,4]

time_trend_desc <- if(pv_time < 0.01) {
  "There is very strong evidence of a time effect on average rating."
} else if(pv_time < 0.05) {
  "There is some evidence of a time effect on average rating."
} else {
  "There is no evidence of a time effect on average rating (straight horizontal line)."
}

cat("Q6 - time trend:\n")
cat(time_trend_desc, "\n\n")

## Q7: model choice for day effect
cat("Q7 - appropriate model:\n")
cat("Y_{u,i} = mu + b_i + b_u + f(d_{u,i}) + e_{u,i}, with f a smooth function of d_{u,i}\n\n")

## Q8: genres categories with >1000 ratings, compute avg and se
genre_tab <- movielens %>% group_by(genres) %>% summarise(n = n(), avg = mean(rating), se = sd(rating)/sqrt(n), .groups = "drop") %>% filter(n > 1000)

g8_plot <- ggplot(genre_tab, aes(x = reorder(genres, avg), y = avg)) +
  geom_point() + geom_errorbar(aes(ymin = avg - 2*se, ymax = avg + 2*se), width = 0.2) + coord_flip() + theme_minimal() + xlab("")
ggsave(file.path(out_dir, "q8_genre_avg_se.png"), g8_plot, width = 8, height = 6)

lowest_genre <- genre_tab %>% arrange(avg) %>% slice(1) %>% pull(genres)
cat("Q8 - genre with lowest average rating:\n")
cat(lowest_genre, "\n\n")

## Q9: model choice for genre effect
cat("Q9 - appropriate model:\n")
cat("Y_{u,i} = mu + b_i + b_u + sum_{k=1}^K x_{u,i}^k beta_k + e_{u,i}, with x_{u,i}^k = 1 if g_{u,i} is genre k\n")

invisible(list(year_high_med = year_high_med, shaw = shaw, forrest_n_per_year = forrest_n_per_year,
               trend_desc = trend_desc, time_trend_desc = time_trend_desc, lowest_genre = lowest_genre))
