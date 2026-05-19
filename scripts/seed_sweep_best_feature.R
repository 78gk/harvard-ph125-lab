#!/usr/bin/env Rscript
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret", repos = "https://cloud.r-project.org")
library(caret)
data(iris)
iris <- iris[iris$Species != "setosa", ]

features <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
results_all <- data.frame(seed = integer(), feature = character(), cutoff = numeric(), accuracy = numeric(), stringsAsFactors = FALSE)

for (s in 1:10) {
  set.seed(s)
  train_idx <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
  train <- iris[train_idx, ]
  best_for_seed <- NULL
  best_acc <- -Inf
  best_cut <- NA
  best_feat <- NA
  for (f in features) {
    vals <- seq(from = floor(min(train[[f]])*10)/10, to = ceiling(max(train[[f]])*10)/10, by = 0.1)
    accs <- sapply(vals, function(cut) {
      pred <- ifelse(train[[f]] > cut, "virginica", "versicolor")
      mean(pred == as.character(train$Species))
    })
    idx <- which.max(accs)
    if (accs[idx] > best_acc) {
      best_acc <- accs[idx]
      best_cut <- vals[idx]
      best_feat <- f
    }
  }
  results_all <- rbind(results_all, data.frame(seed = s, feature = best_feat, cutoff = best_cut, accuracy = best_acc, stringsAsFactors = FALSE))
}

print(results_all)
tab <- as.data.frame(table(results_all$feature))
tab <- tab[order(-tab$Freq), ]
print(tab)
write.csv(results_all, file = "outputs/seed_sweep_best_feature.csv", row.names = FALSE)
