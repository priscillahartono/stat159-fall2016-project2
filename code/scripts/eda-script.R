library(dplyr)
#----------------------------------------------------------------------

#Read in credit data set
credit <- read.csv('../../data/Credit.csv')
credit ['X'] <- NULL

#Quantitaitve variables
quantitative <- credit %>%
  select(Income, Limit, Rating, Cards, Age, Education, Balance)

#Qualitative variables
qualitative <- credit %>%
  select(Gender, Student, Married, Ethnicity)

#----------------------------------------------------------------------

#Summary of quantitaitve variables
summary(quantitative)

#Range of quantitative variables
apply(quantitative, 2, FUN=range)

#IQR of quantitative variables
apply(quantitative, 2, FUN=IQR)

#Standard Deviation of quantitative variables
apply(quantitative, 2, FUN=sd)

#------------------------------------
# apply: Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.
# 1: Rows 2: Column
# FUN is the function e.g. IQR, sd, mean
#------------------------------------

#----------------------------------------------------------------------

#Table of Frequencey of Qualitative Variables

summary(qualitative)

#Table of Relative Frequency of Qualitative Variables
#without Proportion
table(qualitative)
ftable(table(qualitative))
#With proportion
prop.table(table(qualitative))
prop.table(ftable(table(qualitative)))


#----------------------------------------------------------------------
#Matrix of Correlation
cor(quantitative)


#Anova's between Balance and all the other qualitative variables
aov(Balance~Gender+Student+Married+Education, credit)

