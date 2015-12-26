#Load packages:
library(plyr)
library(dplyr)
library(utils)
library(reshape2)
#Download file to directory and unzip:
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "UCI HAR Dataset.zip")
unzip("UCI HAR Dataset.zip")

#Set directory to unzipped file and load all data to R:
setwd("./UCI HAR Dataset")
subject.train <- read.table("./train/subject_train.txt") #Train subjects 'id' numbers 
subject.test <- read.table("./test/subject_test.txt") #Test subjects 'id' numbers
train.mat <- read.table("./train/X_train.txt") #Feature data for train subjects
test.mat <- read.table("./test/X_test.txt") #Feature data for test subjects
train.labels <- read.table("./train/y_train.txt") #Activity numbers for train subjects
test.labels <- read.table("./test/y_test.txt") #Activity numbers for test subjects
features <- read.table("features.txt", colClasses = c("integer","character")) #Feature names
activity.labels <- read.table("activity_labels.txt", colClasses = c("integer","character")) 

#Merge train data and test data:
train.data <- cbind(subject.train, train.labels, train.mat)
test.data <- cbind(subject.test, test.labels, test.mat)
combined.data <- rbind(train.data,test.data) #Merged dataset for step (1)
colnames(combined.data) <- c("subject","activity", features[,2])
for(i in 1:dim(combined.data)[1]){ 
  temp <- combined.data[i,2]
  combined.data[i,2] <- activity.labels[temp,2] #Insert activity names in combined.data (as required in step 3)
} 

#Extract measurements on the mean and STD:
#To extract the measurements we check which of the features contain one of the strings: "mean" or "std"
#Then, we subset the first two columns from combined.data (which contains the subject and activity data) and the columns that .were found to be relevant.
extracted.data <-
  colnames(combined.data) %>%
  (function(x) c(1:2,grep("mean|std",x))) %>% #find column indexes about mean and std and include first two columns of combined.data (activity and subject)
  (function(x) combined.data[,x]) #Creates the data set for step (2) by subsetting columns from combined.data.

#Finally, we create an inpendent tidy data set from the latter data set, which describes the mean of each variable for each activity, subject and variable:
means.data <-
  melt(extracted.data,id.vars=c("subject","activity")) %>% #Turn the feature names into rows   
  ddply(.(subject, activity, variable), summarize, mean=mean(value)) #Create summary means 
