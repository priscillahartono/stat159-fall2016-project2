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

range1 <- max(quantitative$Income) - min(quantitative$Income)
range2 <- max(quantitative$Limit) - min(quantitative$Limit)
range3 <- max(quantitative$Rating) - min(quantitative$Rating)
range4 <- max(quantitative$Cards) - min(quantitative$Cards)
range5 <- max(quantitative$Age) - min(quantitative$Age)
range6 <- max(quantitative$Education) - min(quantitative$Education)
range7 <- max(quantitative$Balance) - min(quantitative$Balance)

#IQR of quantitative variables
apply(quantitative, 2, FUN=IQR)

#Standard Deviation of quantitative variables
apply(quantitative, 2, FUN=sd)

#------------------------------------
# apply: Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.
# 1: Rows 2: Column
# FUN is the function e.g. IQR, sd, mean
#------------------------------------








