# install.packages('glmnet')
library(glmnet)

scaled_credit <- read.csv('../../data/scaled-credit.csv')
scaled_credit['X'] <-NULL
load("../../data/training-testing-sets.RData")

scaled_credit = na.omit(scaled_credit)
training_set = na.omit(training_set)
testing_set = na.omit(testing_set)

x <- model.matrix(Balance ~ ., scaled_credit)[, -1]
y <- scaled_credit$Balance
x_training <- model.matrix(Balance ~ ., training_set)[, -1]
y_training <- training_set$Balance
x_testing <- model.matrix(Balance ~ ., testing_set)[, -1]
y_testing <- testing_set$Balance


#Train Set (10-fold cross-validation)
#-------------------------------------

#Ridge fitting function output models
set.seed(100)
grid <- 10^seq(10, -2, length = 100)
ridge_models <- cv.glmnet(data.matrix(x_training), data.matrix(y_training),
                   alpha = 0,
                   lambda = grid,
                   nfolds = 10,
                   standardize = FALSE,
                   intercept = FALSE)

#"Best" model
ridge_best_model <- ridge_models$lambda.min

#Generate visualization
png("../../images/ridge-models-plot.png")
plot(ridge_models, main = "Plot of Ridge Models")
dev.off()


#Test Set
#--------------------------------
#Get predictions for test set
ridge_predictions <- predict(ridge_models, s = ridge_best_model, newx=x_testing)

#Compute mean squared error
ridge_MSE <- mean((ridge_predictions - y_testing)^2)


#Refit ridge regression on full data set
#-----------------------------------------
full_data_ridge <- glmnet(data.matrix(x), data.matrix(y),
                    alpha = 0,
                    lambda = ridge_best_model,
                    standardize = FALSE,
                    intercept = FALSE)
ridge_fulldata_coef <- coef(full_data_ridge)


#Save file
#--------------------------
save(ridge_models, ridge_best_model, ridge_predictions, ridge_MSE, full_data_ridge, ridge_fulldata_coef, file="../../data/ridge-regression.RData")
