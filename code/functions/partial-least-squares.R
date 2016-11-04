# install.packages('pls')
library(pls)

scaled_credit <- read.csv('../../data/scaled-credit.csv')
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

#PLSR fitting function output models
#Generate visualization
#-------------------------------------
set.seed(123)
plsr_fit <- plsr(training_set_y~training_set_x, scale=TRUE, validation="CV")
png("../../images/plsr-models-plot.png")
validationplot(plsr_models, val.type = "MSEP", main = "Cross-validation Errors for PLSR")
dev.off()

#"Best" fit model
plsr_best_model <- plsr_models$validation$PRESS
#smallest cross-validation occurs for component
plsr_best_model1 <- which.min(plsr_models$validation$PRESS)

#Test Set
#--------------------------------
#Get predictions for test set
plsr_pred <- predict(plsr_fit, s = plsr_best_model, newx=testing_set_x)

#Compute mean squared error
plsr_mean <- mean((plsr_pred - testing_set_y)^2)

#Refit PLSR regression on full data set
#-----------------------------------------
plsr_out <- plsr(scaled_credit_y~scaled_credit_x, scale=FALSE, ncomp=plsr_best_model1)

#official coefficient estimates
plsr_coef <- coef(plsr_out)

#Save file to RData
#-------------------
save(plsr_models, plsr_best_model1, plsr_pred, plsr_mean, plsr_out, plsr_coef, file="../../data/partial-least-squares-regression.RData")
