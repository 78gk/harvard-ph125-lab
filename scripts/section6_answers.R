library(caret)
library(dslabs)
library(tidyverse)
set.seed(1)
data("mnist_27")

models <- c("glm", "lda", "naive_bayes", "knn", "gamLoess", "qda", "rf")

fits <- lapply(models, function(model){
  message("Training: ", model)
  train(y ~ ., method = model, data = mnist_27$train)
})
names(fits) <- models

# Q2: predictions matrix
preds <- sapply(fits, function(fit) predict(fit, newdata = mnist_27$test))

cat("Q2 - dimensions of prediction matrix:\n")
cat("Rows:", nrow(preds), "\n")
cat("Cols:", ncol(preds), "\n\n")

# Q3: accuracy per model on test set
test_y <- mnist_27$test$y
accs <- colMeans(preds == test_y)
cat("Q3 - mean accuracy across models:\n")
cat(mean(accs), "\n\n")

# Q4: ensemble by majority vote (>50% predict 7 -> 7 else 2)
vote7 <- rowSums(preds == "7")
ens_pred <- ifelse(vote7 > (ncol(preds)/2), "7", "2")
ens_acc <- mean(ens_pred == test_y)
cat("Q4 - ensemble accuracy (majority >50%):\n")
cat(ens_acc, "\n\n")

# Q5: how many individual methods do better than the ensemble
better_idx <- which(accs > ens_acc)
cat("Q5 - number of individual methods better than ensemble:\n")
cat(length(better_idx), "\n")
cat("Methods better than ensemble:\n")
if(length(better_idx)>0) cat(names(accs)[better_idx], sep = ", ", "\n\n") else cat("None\n\n")

# Q6: obtain minimum accuracy estimates from training set cross-validation
# For each fit, use min(fit$results$Accuracy)
train_acc_estimates <- sapply(fits, function(fit){
  if(!is.null(fit$results$Accuracy)){
    min(fit$results$Accuracy, na.rm = TRUE)
  } else NA
})
cat("Q6 - mean of training set accuracy estimates (min of fit$results$Accuracy):\n")
cat(mean(train_acc_estimates), "\n\n")

# Q7: ensemble using only methods with min training accuracy >= 0.8
use_models <- names(train_acc_estimates)[which(train_acc_estimates >= 0.8)]
cat("Q7 - models used (min training acc >= 0.8):\n")
cat(paste(use_models, collapse = ", "), "\n")

if(length(use_models) == 0){
  cat("No models meet the threshold; ensemble accuracy = NA\n")
} else {
  preds_subset <- preds[, use_models, drop = FALSE]
  # vote 7 if 50% or more of those models predict 7
  vote7_sub <- rowSums(preds_subset == "7")
  thresh <- ncol(preds_subset)/2
  ens2_pred <- ifelse(vote7_sub >= thresh, "7", "2")
  ens2_acc <- mean(ens2_pred == test_y)
  cat("Q7 - ensemble accuracy (using selected models):\n")
  cat(ens2_acc, "\n")
}

invisible(list(models = models, fits = fits, preds = preds, accs = accs,
               ensemble_acc = ens_acc, train_acc_estimates = train_acc_estimates))
