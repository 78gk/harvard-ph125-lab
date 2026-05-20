library(tidyverse)
library(caret)

# Base code for all questions
set.seed(1996)
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()

x_subset <- x[ ,sample(p, 100)]

# Q1
cat("\n--- Q1 ---\n")
set.seed(1)
fit_q1 <- train(x_subset, y, method = "glm")
print(fit_q1$results)

# Q2
cat("\n--- Q2 ---\n")
pvals <- rep(0, ncol(x))
for (i in 1:ncol(x)) {
  pvals[i] <- t.test(x[,i][y==0], x[,i][y==1], var.equal=TRUE)$p.value
}
ind <- which(pvals <= 0.01)
cat("Number of predictors surviving cutoff:", length(ind), "\n")

# Q3
cat("\n--- Q3 ---\n")
x_subset_q3 <- x[, ind]
set.seed(1)
fit_q3 <- train(x_subset_q3, y, method = "glm")
print(fit_q3$results)

# Q4
cat("\n--- Q4 ---\n")
set.seed(1)
fit_q4 <- train(x_subset_q3, y, method = "knn", tuneGrid = data.frame(k = seq(101, 301, 25)))
print(fit_q4$results)
cat("Best k:", fit_q4$bestTune$k, "\n")
cat("Best Accuracy:", max(fit_q4$results$Accuracy), "\n")
