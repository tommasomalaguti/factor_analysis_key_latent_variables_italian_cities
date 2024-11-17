X=read.csv("DT_3_new.csv",header=TRUE,sep=";")
str(X)
dim(X)

#Transform variables in numeric
X_numeric <- data.frame(apply(X, 2, function(x) as.numeric(gsub(",", ".", gsub("\\.", "", x)))))

#Check for missing values
any_missing <- any(is.na(X_numeric))
any_missing

########################################################################################
#SKIP
#Check for missing values
any_missing <- any(is.na(X_numeric))
any_missing

#Omit cities with missing values 
X_good <- na.omit(X_numeric)

#Re-check for missing values
any_missing <- any(is.na(X_good))
any_missing
########################################################################################

#interpolate missing data
library(zoo)
X_interpolated = na.approx(X_numeric)
summary(X_interpolated)
print(X_interpolated)

#Check again for missing values
any_missing <- any(is.na(X_interpolated))
any_missing

#Standardize
X_standard <- scale(X_interpolated)
X_standard

#Correlation matrix
corr_matrix <- cor(X_standard)
corr_matrix

#Corr matrix plot
library(tidyverse)
library(ggcorrplot)
ggcorrplot(corr_matrix, lab=FALSE)

library(lattice)
library(nFactors)
library(caret)

########################################################################################
#SKIP
#Set the correlation threshold
correlation_threshold <- 0.99
 
#Find highly correlated variable pairs
highly_correlated_pairs <- findCorrelation(corr_matrix, cutoff = correlation_threshold)
highly_correlated_pairs

#Print the corresponding variable names
correlated_variable_names <- colnames(corr_matrix)[highly_correlated_pairs]
print(correlated_variable_names)

#Identify the column indices to drop
columns_to_drop <- unique(highly_correlated_pairs)
columns_to_drop 

#Drop the highly correlated variables from the data
X_no_high_corr <- X_standard[, -columns_to_drop]

X_standard <- X_no_high_corr

#Print the remaining variables
print(colnames(X_standard))
########################################################################################

#manage highly correlated variables 
#Print the variables
print(colnames(X_standard))

#first model
X_standard <- X_standard[, -c(4, 8, 9, 10, 11, 12, 14, 15, 18, 19, 20, 21)]
#second model: we choose this model for our research
X_standard <- X_standard[, -c(4, 8, 9, 11, 12, 14, 18, 19, 20, 21)]

#print remaining variables
print(colnames(X_standard))

#Correlation matrix
corr_matrix <- cor(X_standard)
corr_matrix

#Corr matrix plot
ggcorrplot(corr_matrix, lab=TRUE)

#Check eigenvalues and plot them
ev <- eigen(cor(X_standard))
ev
nS <- nScree(x=ev$values)
nS
plotnScree(nS, legend = F)
print(ev$values)
#even if only 3 factors have eigenvalues > 1, we take also the 4th factor because it is relevant to explain the variability of unemplyment rate


library(psych)
library(GPArotation)

#First FA no rotation
M1 <- fa(X_standard, nfactors=4, rotate="none", scores="regression")
M1
fa.diagram(M1, main="X_standard")

#Second FA promax rotation
M2 <- fa(X_standard, nfactors=4, rotate="promax", scores="regression")
M2
fa.diagram(M2, main="X_standard")

#Third FA varimax rotation
M3 <- fa(X_standard, nfactors=4, rotate="varimax", scores="regression")
M3
fa.diagram(M3, main="X_standard")

#fourth rotation oblimin
fa(X_standard, nfactors=4, rotate="oblimin")

M4 <- fa(X_standard, nfactors=4, rotate="oblimin", scores="regression")
M4
fa.diagram(M4, main="X_standard")