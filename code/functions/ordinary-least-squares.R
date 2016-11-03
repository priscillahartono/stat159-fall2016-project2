
scaled_credit <- read.csv('../../data/scaled-credit.csv')
train_data <- read.csv('../../data/training-set.csv')
test_data <- read.csv('../../data/testing-set.csv')



#Fit dataset
ols <- lm(Balance~Income+Limit+Rating+Cards+Age+Education
             +Gender+Student+Married+Ethnicity, 
             data=as.data.frame(scaled_credit))


summary_of_ols <- summary(ols)