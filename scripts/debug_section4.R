source("renv/activate.R")
library(dslabs)
library(caret)

data(heights)
set.seed(1, sample.kind="Rounding")
idx <- createDataPartition(heights$sex, p = 0.5, list = FALSE)
train <- heights[idx, ]
test <- heights[-idx, ]

k_q1 <- seq(1, 101, 3)
f1_scores <- sapply(k_q1, function(k) {
  fit <- knn3(sex ~ height, data = train, k = k)
  pred <- predict(fit, test, type = "class")
  F_meas(data = pred, reference = test$sex)
})

res1 <- data.frame(k=k_q1, f1=f1_scores)
print("Q1 Max F1 ties:")
print(res1[res1$f1 == max(res1$f1), ])

# Now for Q2.
# "Next we will use the same gene expression example used in the Comprehension Check: Distance exercises."
# "First, set the seed to 1 and split the data into training and test sets with p = 0.5."
# WAIT. In the prompt it says: k = seq(1, 11, 2)
data("tissue_gene_expression")
set.seed(1, sample.kind="Rounding")
idx2 <- createDataPartition(tissue_gene_expression$y, p = 0.5, list = FALSE)
x_train <- tissue_gene_expression$x[idx2, ]
y_train <- tissue_gene_expression$y[idx2]
x_test <- tissue_gene_expression$x[-idx2, ]
y_test <- tissue_gene_expression$y[-idx2]

k_q2 <- seq(1, 11, 2)
acc2_rounding <- sapply(k_q2, function(k) {
  # Note: "using sapply() or map_df()"
  # if using knn(), but let's use knn3() from caret as before
  fit <- knn3(x_train, y_train, k = k)
  pred <- predict(fit, x_test, type="class")
  mean(pred == y_test)
})

print("Q2 with Rounding:")
print(data.frame(k=k_q2, acc=acc2_rounding))

# What if Q2 doesn't use sample.kind="Rounding"?
set.seed(1)
idx3 <- createDataPartition(tissue_gene_expression$y, p = 0.5, list = FALSE)
x_train3 <- tissue_gene_expression$x[idx3, ]
y_train3 <- tissue_gene_expression$y[idx3]
x_test3 <- tissue_gene_expression$x[-idx3, ]
y_test3 <- tissue_gene_expression$y[-idx3]

acc2_normal <- sapply(k_q2, function(k) {
  fit <- knn3(x_train3, y_train3, k = k)
  pred <- predict(fit, x_test3, type="class")
  mean(pred == y_test3)
})

print("Q2 with standard seed (R 3.6+):")
print(data.frame(k=k_q2, acc=acc2_normal))

