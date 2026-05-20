options(digits=7)
library(tidyverse)

set.seed(1986)
n <- round(2^rnorm(1000, 8, 1))
set.seed(1)
mu <- round(80 + 2*rt(1000, 5))
range(mu)
schools <- data.frame(id = paste("PS",1:1000),
                      size = n,
                      quality = mu,
                      rank = rank(-mu),
                      stringsAsFactors = FALSE)

scores <- sapply(1:nrow(schools), function(i){
  rnorm(schools$size[i], schools$quality[i], 30)
})
schools <- schools %>% mutate(score = sapply(scores, mean))

## Q1: top schools by average score
top10 <- schools %>% arrange(desc(score)) %>% slice(1:10)
top1_id <- as.numeric(sub("PS ", "", top10$id[1]))
score_10th <- top10$score[10]

cat("Q1 - top school ID (number only):\n")
cat(top1_id, "\n")
cat("Q1 - average score of 10th school:\n")
cat(score_10th, "\n\n")

## Q2: median sizes
median_overall <- median(schools$size)
median_top10 <- median(top10$size)
cat("Q2 - median school size overall:\n")
cat(median_overall, "\n")
cat("Q2 - median school size of top10 by score:\n")
cat(median_top10, "\n\n")

## Q3: bottom 10 median size
bottom10 <- schools %>% arrange(score) %>% slice(1:10)
median_bottom10 <- median(bottom10$size)
cat("Q3 - median school size of bottom10 by score:\n")
cat(median_bottom10, "\n\n")

## Q4: observation about variability
obs_q4 <- "The standard error of the score has larger variability when the school is smaller, which is why both the best and the worst schools are more likely to be small."
cat("Q4 - observation:\n")
cat(obs_q4, "\n\n")

## Q5: regularization with lambda = 25
overall <- mean(sapply(scores, mean))
lambda <- 25
reg_est <- overall + (schools$size * (schools$score - overall)) / (schools$size + lambda)
schools <- schools %>% mutate(reg25 = reg_est)
top10_reg25 <- schools %>% arrange(desc(reg25)) %>% slice(1:10)
top1_reg25_id <- as.numeric(sub("PS ", "", top10_reg25$id[1]))
reg25_10th <- top10_reg25$reg25[10]
cat("Q5 - top school ID with lambda=25:\n")
cat(top1_reg25_id, "\n")
cat("Q5 - regularized score of 10th school (lambda=25):\n")
cat(reg25_10th, "\n\n")

## Q6: find lambda from 10 to 250 minimizing RMSE
rmse_for_lambda <- function(lambda){
  est <- overall + (schools$size * (schools$score - overall)) / (schools$size + lambda)
  sqrt(mean((schools$quality - est)^2))
}
lambdas <- 10:250
rmses <- sapply(lambdas, rmse_for_lambda)
best_lambda <- lambdas[which.min(rmses)]
cat("Q6 - lambda minimizing RMSE:\n")
cat(best_lambda, "\n\n")

## Q7: rank schools with best lambda
best_lambda_val <- best_lambda
est_best <- overall + (schools$size * (schools$score - overall)) / (schools$size + best_lambda_val)
schools <- schools %>% mutate(reg_best = est_best)
top10_reg_best <- schools %>% arrange(desc(reg_best)) %>% slice(1:10)
top1_reg_best_id <- as.numeric(sub("PS ", "", top10_reg_best$id[1]))
regbest_10th <- top10_reg_best$reg_best[10]
cat("Q7 - top school ID with best lambda:\n")
cat(top1_reg_best_id, "\n")
cat("Q7 - regularized average score of 10th school with best lambda:\n")
cat(regbest_10th, "\n\n")

## Q8: shrink without subtracting overall mean
rmse_no_center <- function(lambda){
  est <- (schools$size * schools$score) / (schools$size + lambda)
  sqrt(mean((schools$quality - est)^2))
}
rmses_no_center <- sapply(lambdas, rmse_no_center)
best_lambda_no_center <- lambdas[which.min(rmses_no_center)]
cat("Q8 - lambda minimizing RMSE without centering:\n")
cat(best_lambda_no_center, "\n")

invisible(list(top1_id = top1_id, score_10th = score_10th, median_overall = median_overall,
               median_top10 = median_top10, median_bottom10 = median_bottom10,
               top1_reg25_id = top1_reg25_id, reg25_10th = reg25_10th,
               best_lambda = best_lambda, top1_reg_best_id = top1_reg_best_id,
               regbest_10th = regbest_10th, best_lambda_no_center = best_lambda_no_center))
