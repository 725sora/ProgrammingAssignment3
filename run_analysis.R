run_analysis <- function() {

library(stringr) 
library(plyr)
library(data.table)
  
# read training data
read.table("train/X_train.txt", header=FALSE) -> train_data_X
read.table("train/y_train.txt", header=FALSE) -> train_data_activity
read.table("train/subject_train.txt", header=FALSE) -> train_data_subject

# combining to one train_data_frame
train_data <- cbind(train_data_X, train_data_subject, train_data_activity)

# read test data
read.table("test/X_test.txt", header=FALSE) -> test_data_X
read.table("test/y_test.txt", header=FALSE) -> test_data_activity
read.table("test/subject_test.txt", header=FALSE) -> test_data_subject

# combining to one test_data_frame

test_data <- cbind(test_data_X, test_data_subject, test_data_activity)

# combining train and test data to one data frame

compl_data <- rbind(train_data, test_data)

# set header
features <- read.table("features.txt", header=FALSE)
col_names <- as.vector(features[,2])
col_names <- c(col_names, "subject", "activity")
names(compl_data) <- col_names  

# extract mean and std data
# choosing all columns, which contain "mean" or "std" in its names
mean_col <- str_detect(col_names, "mean")
std_col <- str_detect(col_names, "std")
mean_std_data <- compl_data[mean_col | std_col]

# change to descriptive activity types

activity <- compl_data[,563]
mean_std_data <- cbind(mean_std_data, activity)
act_types <- read.table("activity_labels.txt")
mean_std_data$activity <- 
  mapvalues(mean_std_data$activity, from=as.vector(act_types[,1]), 
            to=as.vector(act_types[,2]))

# create 2nd data frame with means for each activity type
meldata <- melt(mean_std_data, id="activity")
dcast(meldata, activity ~ variable, mean)


}