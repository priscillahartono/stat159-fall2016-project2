library(pls)

scaled_credit <- read.csv('../../data/scaled-credit.csv')
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

#PCR fitting function output models
set.seed(100)
pcr_models <- pcr(y_training~x_training, scale=TRUE, validation="CV")
#summary of PCR models
sum_pcr <- summary(pcr_models)

#"Best" fit model
pcr_best_model <- pcr_models$validation$PRESS
#smallest cross-validation occurs for component
pcr_best_model1 <- which.min(pcr_models$validation$PRESS)


#Generate visualization
#-------------------------------------
png("../../images/pcr-models-plot.png")
validationplot(pcr_models, val.type = "MSEP", main = "Cross-validation Errors for PCR")
dev.off()


#Test Set
#--------------------------------
#Get predictions for test set
pcr_predictions <- predict(pcr_models, s = pcr_best_model, newx=x_testing)

#Compute mean squared error
pcr_MSE <- mean((pcr_predictions - y_testing)^2)


#Refit PCR regression on full data set
#-----------------------------------------
full_data_pcr <- pcr(y~x, scale=FALSE, ncomp=pcr_best_model1)

#official coefficient estimates
pcr_fulldata_coef <- coef(full_data_pcr)


#Save file to RData
#-------------------
save(pcr_models, pcr_best_model1, pcr_predictions, pcr_MSE, full_data_pcr, pcr_fulldata_coef, file="../../data/principal-components-regression.RData")
