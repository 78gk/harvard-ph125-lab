#!/usr/bin/env Rscript
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret", repos = "https://cloud.r-project.org")
library(caret)

data(iris)
iris <- iris[iris$Species != "setosa", ]

set.seed(1)
train_idx <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train <- iris[train_idx, ]
test <- iris[-train_idx, ]

feature <- "Petal.Width"
cutoff <- 1.6

pred <- ifelse(test[[feature]] > cutoff, "virginica", "versicolor")
acc <- mean(pred == as.character(test$Species))

cat(sprintf("feature=%s\ncutoff=%.1f\ntest_accuracy=%.6f\n", feature, cutoff, acc))
