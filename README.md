The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called run_analysis.R does the following is stored in the repo:

- Reading the test and train data from the files.
- Merges the test and train data (X_test.txt, y_test.txt, X_train.txt and y_train.txt and subject files) into one data frame compl_data 
- Extracts all variables in the created data frame, which considers mean and stdard deviation, i.e. all variables containing "mean" and "std" in the feature names.
- Uses descriptive activity names to name the activities in the data set
- Changing activity variables from numbers to descriptive names in the data frame.
- Creating new data frame, which summarize the means of each variable for each activity and subject. 
