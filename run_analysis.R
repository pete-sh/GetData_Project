# run_analysis.R
# ==============
# R script for data cleaning
# 
# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# Detail information on the data:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# This script performs the following activities:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 
# 2014-08-12, P. Suhner

# INITIALIZATION
# --------------
# clean up the workspace
rm(list = ls())

# set the base working directory
WD_BASE="C:/LocalData/__SUE/MOUNTS/64GB_SD_Card/D/_Data_Management_Strategical/Data_Science/_COURSERA_STUFF/Course_3_Getting_and_Cleaning_Data/Course_Project"
WD_INPUT="Input_Data/UCI HAR Dataset"
setwd(paste(WD_BASE, WD_INPUT, sep = "/"))

# PROCESSING
# ----------
# 1. Create one test data set from the training and test data
## read features data
tr <- read.table("train/X_train.txt")
te <- read.table("test/X_test.txt")
features <- rbind(tr, te)

## read activities data
tr <- read.table("train/y_train.txt")
te <- read.table("test/y_test.txt")
activities <- rbind(tr, te)

## read subjects
tr <- read.table("train/subject_train.txt")
te <- read.table("test/subject_test.txt")
subject <- rbind(tr, te)

## read activity labels
act_lbl <- read.table("activity_labels.txt")
names(act_lbl) <- c("num", "name")

## read feature names
feature_names <- read.table("features.txt")
names(feature_names) <- c("num", "name")

# 2. Extract the mean and std deviation data for each measurement
## throw away obsolete features (anything apart from 'mean(' and 'std(')
feature_names <- feature_names[grep("mean\\(|std\\(", feature_names$name), ]

## reduce content of in_x to the required features
features <- features[, feature_names$num]

# 3. Apply descriptive names to the activities
activities$V1 <- act_lbl[activities$V1,]$name

# 4. Apply descriptive names to the variable names
## eliminate the brackets from the column names
## and reformat names to camelCase
feature_names$name <- gsub("\\(\\)","", feature_names$name)
feature_names$name <- gsub("std","Std", feature_names$name)
feature_names$name <- gsub("mean","Mean", feature_names$name)
feature_names$name <- gsub("-","", feature_names$name)

names(features)   <- feature_names$name
names(activities) <- c("Activity")
names(subject)    <- c("Subject")

## write feature names to file - will be used in Code Book
write.table(names(features), file = paste(WD_BASE, "tidyData_feature_names.txt", sep="/"), row.name = FALSE, quote = FALSE)

## create a single data fram with tidy data
tidyData <- cbind(subject, activities, features)

## write the tidy data to a file in CSV format
write.csv(tidyData, paste(WD_BASE,"tidyData.csv",sep = "/"))

# 5. Create second, independent tidy data set with the average of each variable for each activity and each subject
aggregation_list <- list(tidyData$Subject, tidyData$Activity)

## get the number of columns for tidy data dataset
dim_tidyData <- dim(tidyData)[2]

## aggregate the data to build averages
averages <- aggregate(tidyData[, 3:dim_tidyData], aggregation_list, FUN = mean)

## provide proper names for the aggregation columns
feat_names <- c("Subject", "Activity", as.character(feature_names$name))
names(averages)  <- feat_names

## swap the first two columns (as data is ordered by Activity and Subject)
averages <- averages[, c(2,1,3:dim_tidyData)]

## write the tidy data to a file in requested format
write.table(averages, file = paste(WD_BASE, "tidyData_averages.txt",sep = "/"), row.name = FALSE)
