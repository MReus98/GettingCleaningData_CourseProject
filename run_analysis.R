# This script creates a tidy data set from data collected from the accelerometers from Samsung Galaxy S smartphones

# Load package
library(dplyr)

# Specify the download URL and file name of the zip file with the data
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Check if the zip file already exists, and if not, then download the zip file
if (!file.exists(filename)){
    download.file(URL, filename)
}

# Check if the zip file is already unzipped, and if not, then unzip the zip file.
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

# Read the data into R
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("nr","feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

# Merge the training and test data sets to create one data set
x_train_test <- rbind(x_train, x_test)
y_train_test <- rbind(y_train, y_test)
subject_train_test <- rbind(subject_train, subject_test)
MergedData <- cbind(subject_train_test, y_train_test, x_train_test)

# Extract only the measurements on the mean and standard deviation for each measurement (not mean frequency or angle!)
ExtractedData <- MergedData %>% select(subject, label, contains("mean"), contains("std"), -contains("freq"), -contains("angle"))

# Use the descriptive activity names to name the activities in the data set
ExtractedData$label <- activities[ExtractedData$label, 2]

# Label the data set with descriptive variable names 
names(ExtractedData)[2] = "activity"
names(ExtractedData) <- gsub("\\.", "", names(ExtractedData))
names(ExtractedData) <- gsub("^t", "time", names(ExtractedData))
names(ExtractedData) <- gsub("^f", "frequency", names(ExtractedData))
names(ExtractedData) <- gsub("Acc", "Accelerometer", names(ExtractedData))
names(ExtractedData) <- gsub("Gyro", "Gyroscope", names(ExtractedData))
names(ExtractedData) <- gsub("Mag", "Magnitude", names(ExtractedData))
names(ExtractedData) <- gsub("mean", "Mean", names(ExtractedData))
names(ExtractedData) <- gsub("std", "Std", names(ExtractedData))
names(ExtractedData) <- gsub("BodyBody", "Body", names(ExtractedData))

# Create a tidy data set with the average of each variable for each activity and each subject
TidyData <- ExtractedData %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean=mean))

# Write the tidy data set as a text file to the working directory
write.table(TidyData, "TidyDataSet.txt", row.name=FALSE)