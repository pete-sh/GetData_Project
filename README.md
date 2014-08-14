## Getting and Cleaning Data Project - ReadMe

### Overview of the task

This repository contains results for the project work of the "Getting and Cleaning Data" Coursera course, 
consisting of an R script and the code book for the data.

The aim of the project is to read and process input data in order to create a tidied data set according to the requirements description. The actual task is defined as follows:

1. Merge the training and the test sets to create one data set  
2. Extract only the measurements on the mean and standard deviation for each measurement  
3. Use descriptive activity names to name the activities in the data set  
4. Appropriately label the data set with descriptive variable names  
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject  

The raw input data and its description can be found here:  

- [data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 


## Data processing

### Preconditions
The script expects the data to be already available on the local disk.  
To adapt the source path to your own configuration, please set the variables "WD_BASE" and "WD_INPUT" accordingly.



### Processing steps
 1. The workspace is cleaned to free up space
 2. The path to the source directory is set
 3. The various source files are read
    - Test and Train data for features, activities, and subjects are combined
    - Activity labels and feature names are read
 4. For the feature names, all irrelevant columns are filtered out
 5. Based on the data frame containing the feature names, the obsolete features are also filtered out
 6. The feature names are processed to adhere to R naming standards (using camelCase notation)
 7. The feature names are written to file "tidyData_feature_names.txt" to help creating the code book
 8. The feature names are applied to the features data frame
 9. This tidy data is written to a file in CSV format under the name "tidyData.csv" to allow further processing
 10. The tidy data is aggregated along Subject and Activity columns into a new data frame
 11. After the aggregation, proper column names are applied to the new data frame
 12. The first two columns of the target data frame are swapped to align the column sequence with the sort order
 13. The target file is written to disk under the name "tidyData_averages.txt"

