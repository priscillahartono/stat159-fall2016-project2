library(glmnet)
load("../../data/training-testing-sets.RData")

x <- model.matrix(Balance ~ ., data = training_set)
y <- data.frame(credit_train)$Balance
