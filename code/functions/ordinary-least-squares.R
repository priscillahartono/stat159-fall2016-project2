
scaled_credit <- read.csv('../../data/scaled-credit.csv')

#check for NA values
scaled_credit = na.omit(scaled_credit)
scaled_credit = data.frame(scaled_credit)

#Examining fit of dataset
#----------------------------------
ols<-lm(Balance ~ . , 
        data=scaled_credit)

summary_ols <- summary(ols)

#Mean Squared Error
mse_ols <- mean(summary_ols$residuals^2)

#Coefficient of OLS
coef_ols <- coef(ols)


#Objects Saved in ols-regression.RData
#----------------------------------

save(ols, summary_ols, mse_ols, coef_ols, file = "../../data/ols-regression.RData")

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


cat("\n\n")

cat("Coefficients of OLS\n")
print(coef_ols)
sink()

