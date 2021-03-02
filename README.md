# GettingCleaningData_CourseProject
This repository contains the submission of Marieke Reus for the course project of the Coursera course Getting and Cleaning Data. It contains an R script, run_analysis.R, and a codebook, CodeBook.md.

run_analysis.R performs the processing of raw data collected from the accelerometers in Samsung Galaxy S smartphones into a tidy data set. This script goes through the following steps:
1. Merging the training and the test data sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Naming the activities in the data set with desciriptive activity names.
4. Labelling the data set with descriptive variable names. 
5. Creating a second, independent tidy data set (from the data set in step 4) with the average of each variable for each activity and each subject.

CodeBook.md describes the variables in the tidy data set, the data, and the work that was performed to clean up the raw data.
