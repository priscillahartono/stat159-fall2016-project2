# install.packages('glmnet')
library(glmnet)
library(methods)  

scaled_credit <- read.csv('../../data/scaled-credit.csv')
scaled_credit['X'] <- NULL
load('../../data/training-testing-sets.RData')

scaled_credit = na.omit(scaled_credit)
training_set = na.omit(training_set)
testing_set = na.omit(testing_set)

scaled_credit_x = model.matrix(Balance ~ ., scaled_credit)[, -1]
scaled_credit_y = scaled_credit$Balance
training_set_x = model.matrix(Balance ~ ., training_set)[, -1]
training_set_y = training_set$Balance
testing_set_x = model.matrix(Balance ~ ., testing_set)[, -1]
testing_set_y = testing_set$Balance

#Train Set (10-fold cross-validation)
#-------------------------------------

#Lasso fitting function output models
set.seed(123)
grid = 10^seq(10,-2, length = 100)
lasso_mod = glmnet(training_set_x, training_set_y, alpha = 1, lambda = grid)
plot(lasso_mod)

#Generate visualization
set.seed(1)
cv_lasso = cv.glmnet(training_set_x, training_set_y, alpha = 1, lambda = grid, intercept = FALSE, standardize = FALSE)
png('../../images/lasso-plot.png')
plot(cv_lasso, main = "Plot of Lasso Models")
dev.off()

#"Best" model
lasso_lam = cv_lasso$lambda.min

#Test Set
#--------------------------------
#Get predictions for test set
lasso_pred = predict(lasso_mod, s = lasso_lam, newx = testing_set_x)

#Compute mean squared error
lasso_mean = mean((lasso_pred - testing_set_y)^2)

#Refit lasso regression on full data set
#-----------------------------------------
lasso_out = glmnet(scaled_credit_x, scaled_credit_y, alpha = 1, lambda = grid)
lasso_coef = predict(lasso_out, type ="coefficients", s = lasso_lam )[2:12, ]

#Save file
#--------------------------
save(cv_lasso, lasso_lam, lasso_mean, lasso_coef, file='../../data/lasso-regression.RData')
