Code Book

Raw Data:  
The raw data that was processed to obtain a tidy data set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. This data set was downloaded from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description of this data set is available at:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Processing Steps:  
The raw data was put trough the following processing steps to obtain a tidy data set:  
1. Reading the raw data into R
2. Merging the training and test data sets to create one data set
3. Extracting only the measurements on the mean and standard deviation for each measurement
4. Naming the activities in the data set with the descriptive activity names
5. Labelling the data set with descriptive variable names
6. Creating a tidy data set with the average of each variable for each activity and each subject
7. Writing the tidy data set as a text file to the working directory

Tidy Data Set:  
The following variables are present in the tidy data set:  
- subject: the subject who performed the activity                                     
- activity: description of the activity
The other variables in the tidy data set can be described from the text segments that they contain:  
- "Accelerometer" or "Gyroscope" indicate signals captured by an accelerometer or a gyroscope respectively.
- "time" indicates time domain signals and "frequency" indicates frequency domain signals.
- "Body" indicates body acceleration signals and "Gravity" indicates gravity acceleration signals.
- "Jerk" indicates a jerk signal.
- "Magnitude" indicates the magnitude of a signal.
- "X", "Y", and "X" indicate the direction of the signal.
- "Mean" indicates the mean value and "Std" indicates the standard deviation.
- The appendix "_mean" indicates that each variable represents the average for each activity and each subject.
