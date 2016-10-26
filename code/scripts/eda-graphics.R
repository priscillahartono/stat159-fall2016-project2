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

#Histograms for quantitative variables

#Histogram for Income in png
png("../../images/histogram-income.png")
hist(quantitative$Income, main="Histogram of Income", xlab="Income")
dev.off

#Histogram for Limit in png
png("../../images/histogram-limit.png")
hist(quantitative$Limit, main="Histogram of Limit", xlab="Limit")
dev.off

#Histogram for Rating in png
png("../../images/histogram-limit.png")
hist(quantitative$Rating, main="Histogram of Rating", xlab="Rating")
dev.off

#Histogram for Cards in png
png("../../images/histogram-cards.png")
hist(quantitative$Cards, main="Histogram of Cards", xlab="Cards")
dev.off

#Histogram for Age in png
png("../../images/histogram-age.png")
hist(quantitative$Age, main="Histogram of Age", xlab="Age")
dev.off

#Histogram for Education in png
png("../../images/histogram-education.png")
hist(quantitative$Education, main="Histogram of Education", xlab="Education")
dev.off

#Histogram for Balance in png
png("../../images/histogram-balance.png")
hist(quantitative$Balance, main="Histogram of Balance", xlab="Balance")
dev.off


#----------------------------------------------------------------------

#Boxplots for quantitative variables

#Boxplot for Income in png
png("../../images/boxplot-income.png")
boxplot(quantitative$Income, main="Boxplot of Income", xlab="Income")
dev.off

#Boxplot for Limit in png
png("../../images/boxplot-limit.png")
boxplot(quantitative$Limit, main="Boxplot of Limit", xlab="Limit")
dev.off

#Boxplot for Rating in png
png("../../images/boxplot-limit.png")
boxplot(quantitative$Rating, main="Boxplot of Rating", xlab="Rating")
dev.off

#Boxplot for Cards in png
png("../../images/boxplot-cards.png")
boxplot(quantitative$Cards, main="Boxplot of Cards", xlab="Cards")
dev.off

#Boxplot for Age in png
png("../../images/boxplot-age.png")
boxplot(quantitative$Age, main="Boxplot of Age", xlab="Age")
dev.off

#boxplot for Education in png
png("../../images/boxplot-education.png")
boxplot(quantitative$Education, main="boxplot of Education", xlab="Education")
dev.off

#Boxplot for Balance in png
png("../../images/boxplot-balance.png")
boxplot(quantitative$Balance, main="Boxplot of Balance", xlab="Balance")
dev.off


#----------------------------------------------------------------------
#Correlation Matrix
correlation_matrix <- cor(quantitative)


#Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
pairs(~Income+Limit+Rating+Cards+Age+Education+Balance, data=credit, main = 'Scatterplot Matrix')
dev.off()
