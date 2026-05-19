#!/usr/bin/env Rscript
dir.create("outputs", showWarnings = FALSE, recursive = TRUE)

if (!requireNamespace("caret", quietly = TRUE)) {
  install.packages("caret", repos = "https://cloud.r-project.org")
}
library(caret)

data(iris)
iris <- iris[iris$Species != "setosa", ]

# Create a train split (70%) if none exists in this session
set.seed(1)
train_idx <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train <- iris[train_idx, ]

features <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
results <- data.frame(feature = character(), cutoff = numeric(), accuracy = numeric(), stringsAsFactors = FALSE)

for (f in features) {
  minv <- min(train[[f]])
  maxv <- max(train[[f]])
  vals <- seq(from = floor(minv*10)/10, to = ceiling(maxv*10)/10, by = 0.1)
  accs <- sapply(vals, function(cut) {
    pred <- ifelse(train[[f]] > cut, "virginica", "versicolor")
    mean(pred == as.character(train$Species))
  })
  idx <- which.max(accs) # first/smallest cutoff on ties because vals is increasing
  results <- rbind(results, data.frame(feature = f, cutoff = vals[idx], accuracy = accs[idx], stringsAsFactors = FALSE))
}

print(results)
best <- results[which.max(results$accuracy), ]
cat("BEST FEATURE:", best$feature, "\n")
cat("CUTOFF:", best$cutoff, "\n")
cat("ACCURACY:", best$accuracy, "\n")

write.csv(results, file = "outputs/best_feature.csv", row.names = FALSE)
saveRDS(best, file = "outputs/best_feature.rds")
