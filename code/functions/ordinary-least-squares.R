
scaled_credit <- read.csv('../../data/scaled-credit.csv')
train_data <- read.csv('../../data/training-set.csv')
test_data <- read.csv('../../data/testing-set.csv')


#OLS is a method to estimate the unknown parameters in a linear regression model
#with a goal of minimizing the sum of the squares of the differences between the observed responses and the predicted by a linear function of a set


#Examining fit of dataset
#----------------------------------
ols<-lm(Balance ~ . , 
        data=scaled_credit)

summary_ols <- summary(ols)

#Mean Squared Error
mse_ols <- mean(summary_ols$residuals^2)



#Objects Saved in ols-regression.RData
#----------------------------------

save(ols, summary_ols, mse_ols, file = "../../data/ols-regression.RData")

#Generate ols-regression.txt
#----------------------------------
sink("../../data/ols-regression-output.txt")

cat("Ordinary Least Square\n")
print(ols)

cat("\n\n")

cat("Summary Statistics of OLS\n")
print(summary_ols)

cat("\n\n")

cat("Mean Squared Error (OLS)\n")
print(mse_ols)
sink()

