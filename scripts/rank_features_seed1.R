#!/usr/bin/env Rscript
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret", repos = "https://cloud.r-project.org")
library(caret)

data(iris)
iris <- iris[iris$Species != "setosa", ]

set.seed(1)
train_idx <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train <- iris[train_idx, ]

features <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
results <- data.frame(feature = character(), cutoff = numeric(), accuracy = numeric(), stringsAsFactors = FALSE)

for (f in features) {
  vals <- seq(from = floor(min(train[[f]]) * 10) / 10, to = ceiling(max(train[[f]]) * 10) / 10, by = 0.1)
  accs <- sapply(vals, function(cut) {
    pred <- ifelse(train[[f]] > cut, "virginica", "versicolor")
    mean(pred == as.character(train$Species))
  })
  idx <- which.max(accs)
  results <- rbind(results, data.frame(feature = f, cutoff = vals[idx], accuracy = accs[idx], stringsAsFactors = FALSE))
}

results <- results[order(-results$accuracy, results$feature), ]
print(results)
