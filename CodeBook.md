Data Cleaning Example (Project work on Coursera Course "Getting and Cleaning Data"
==================================================================================

## Starting point and original data

The project task is to clean a set of data which comes from movement signals recorded by smartphones.
Accelerometer and gyroscope 3-axial signals were pre-processed to form a vector of 561 features. 
Detailed information about the original data can be found here:


- [data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Data Processing

### Correlation of raw input data

The input data comes from various file based sources which need to be correlated into one data frame according to the descriptions available with the original data.

As requested by the project definition, this data is filtered on measurements which relate to mean and standard deviation features (visible by the respective column labels in the original data, which contain either "mean()" or "std()" in their names).

Out of the 561 original features, 79 remain in the target data set, which is then extended with information about the subject and the type of activity.

Descriptive column names are applied to the tidy data. Details about the format and contents of the data frame can be found in the respective section of this document.

This data frame is written to file "tidyData.csv" in case it is required for further processing.


### Averaging of tidy data

A second data frame of the identical format is created, but containing the averages of all features, based on the subject and the type of activity.



## Tidy Data Format

The output format of the tidy data - both, the full and the averaged data sets - is identical with the following columns:

### Grouping/assignment columns

The following columns specify assignment of data to subjects and types of activity:

Activity | Type of activity (movement) of the subject
Subject | Numeric ID of the subject (individual carrying the device)

### Device recorded data columns

The feature columns of recorded movement data use a self-explanatory column header in camelCase, using the following format:

[a][Bbbb][C], where


|:Feature    |:Description                                                                                    |
| ---------- | ---------------------------------------------------------------------------------------------- |
| `[a]` | is either "f" for frequency domain data or "t" for time domain data |
| `[BbbBbbb]` |is a description of the actual type of data signal (e.g. "BodyGyro", "BodyAcc", "GravityAcc", etc.) |
| `[C]` | if applicable, depicts the axis of the signal ("X", "Y", or "Z" respectively)|

The full list of feature names is as follows:

tBodyAccMeanX

tBodyAccMeanY

tBodyAccMeanZ

tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagMean
fBodyAccMagStd
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd
