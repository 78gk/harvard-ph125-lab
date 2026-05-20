source("renv/activate.R")

library(dslabs)
library(caret)

# Q1: heights KNN F1 sweep
set.seed(1, sample.kind="Rounding")
data(heights)
idx <- createDataPartition(heights$sex, p = 0.5, list = FALSE)
train <- heights[idx, ]
test <- heights[-idx, ]

k_q1 <- seq(1, 101, 3)
f1_scores <- sapply(k_q1, function(k) {
  fit <- knn3(sex ~ height, data = train, k = k)
  pred <- predict(fit, test, type = "class")
  F_meas(data = pred, reference = test$sex)
})

max_f1 <- max(f1_scores)
best_k <- min(k_q1[f1_scores == max_f1])

cat("Q1_MAX_F1=", format(max_f1, digits = 12), "\n", sep = "")
cat("Q1_BEST_K=", best_k, "\n", sep = "")

# Q2: tissue_gene_expression KNN accuracy sweep
data("tissue_gene_expression")
set.seed(1, sample.kind="Rounding")
idx2 <- createDataPartition(tissue_gene_expression$y, p = 0.5, list = FALSE)
x_train <- tissue_gene_expression$x[idx2, ]
y_train <- tissue_gene_expression$y[idx2]
x_test <- tissue_gene_expression$x[-idx2, ]
y_test <- tissue_gene_expression$y[-idx2]

k_q2 <- seq(1, 11, 2)
acc <- sapply(k_q2, function(k) {
  pred <- knn3Train(train = x_train, test = x_test, cl = y_train, k = k)
  mean(pred == y_test)
})

for (i in seq_along(k_q2)) {
  cat("Q2_K", k_q2[i], "_ACC=", format(acc[i], digits = 12), "\n", sep = "")
}
