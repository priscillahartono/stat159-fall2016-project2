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

#Barplots for qualitative variables

#Barchart for Gender in png
png("../../images/barchart-gender.png")
barplot(table(qualitative$Gender), main="Barchart of Gender")
dev.off

#Barchart for Student in png
png("../../images/barchart-student.png")
barplot(table(qualitative$Student), main="Barchart of Student")
dev.off

#Barchart for Married in png
png("../../images/barchart-married.png")
barplot(table(qualitative$Married), main="Barchart of Married")
dev.off

#Barchart for Ethnicity in png
png("../../images/barchart-ethnicity.png")
barplot(table(qualitative$Ethnicity), main="Barchart of Ethnicity")
dev.off



#----------------------------------------------------------------------

#Conditional Boxplots between Balance and qualitative variables

#Conditional Boxplots for Gender in png
png("../../images/conditional-boxplot-gender.png")
boxplot(Balance ~ Gender, data=credit, main="Conditional Boxplot of Gender")
dev.off

#Conditional Boxplots for Ethnicity in png
png("../../images/conditional-boxplot-ethnicity.png")
boxplot(Balance ~ Ethnicity, data=credit, main="Conditional Boxplot of Ethnicity")
dev.off

#Conditional Boxplots for Student in png
png("../../images/conditional-boxplot-student.png")
boxplot(Balance ~ Student, data=credit, main="Conditional Boxplot of Student")
dev.off

#Conditional Boxplots for Married in png
png("../../images/conditional-boxplot-married.png")
boxplot(Balance ~ Married, data=credit, main="Conditional Boxplot of Married")
dev.off


#----------------------------------------------------------------------

#Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
pairs(~Income+Limit+Rating+Cards+Age+Education+Balance, data=credit, main = 'Scatterplot Matrix')
dev.off()
