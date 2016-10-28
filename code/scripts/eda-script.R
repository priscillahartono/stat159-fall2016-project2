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

#Summary Statistics of Quantitative Variables

#Min, 1st Quartile, Median, Mean, 3rd Quartile, Max of quantitative variables
summary_quant <- summary(quantitative)

#Range of quantitative variables
range_quant <- apply(quantitative, 2, FUN=range)

#IQR of quantitative variables
IQR_quant <- apply(quantitative, 2, FUN=IQR)

#Standard Deviation of quantitative variables
SD_quant <- apply(quantitative, 2, FUN=sd)

#----------------------------------------------------------------------

#Summary Statistics of Qualitative Variables

#Table of Frequencey of Qualitative Variables
summary_qual <- summary(qualitative)

#Table of Relative Frequency of Qualitative Variables
#without Proportion
freq <- table(qualitative)
freq1 <- ftable(table(qualitative))
#With proportion
prop <- prop.table(table(qualitative))
prop1 <- prop.table(ftable(table(qualitative)))

#----------------------------------------------------------------------

#Matrix of Correlation
correlation_matrix <- cor(quantitative)

#Anova's between Balance and all the other qualitative variables
anova <- aov(Balance~Gender+Student+Married+Education, credit)

#----------------------------------------------------------------------

#Save the matrix correlation to binary format
save(correlation_matrix, file='../../data/correlation-matrix.RData')

#----------------------------------------------------------------------


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Generate eda-output.txt

sink("../../data/eda-output.txt")

cat("Summary Statistics of Quantitative Variables\n")
cat("\n\n")

cat("Min, 1st Quartile, Median, Mean, 3rd Quartile, Max of quantitative variables\n")
print(summary_quant)
cat("\n\n")

cat("Range of quantitative variables\n")
print(range_quant)
cat("\n\n")

cat("IQR of quantitative variables\n")
print(IQR_quant)
cat("\n\n")

cat("Standard Deviation of quantitative variables\n")
print(SD_quant)
cat("\n\n")

cat("Summary Statistics of Qualitative Variables\n")
cat("\n\n")

cat("Table of Frequencey of qualitative variables\n")
print(summary_qual)
cat("\n\n")

cat("Table of Relative Frequency of qualitative variables\n\n")
cat("without Proportion\n\n")
print(freq)
cat("\n")
print(freq1)
cat("\n\n")

cat("with Proportion\n\n")
print(prop)
cat("\n")
print(prop1)
cat("\n\n")

cat("Additional data\n")
cat("\n\n")

cat("Matrix of Correlation\n")
print(correlation_matrix)
cat("\n\n")

cat("Anova's between Balance and all the other qualitative variables\n")
print(anova)
cat("\n\n")

sink()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
