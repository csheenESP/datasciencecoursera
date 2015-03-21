# Getting and Cleaning Data Project

## Carlos Guardia

## Description

This document contains information about the variables and the transformations performed for the project in the course Getting and Cleaning Data Project

## Data used

The data used in the exercise represent data collected from the accelerometers from the Samsung Galaxy S II smartphone. 

A waist embedded accelerometer and gyroscope was used to capture at a constant rate of 50Hz smartphone use data:
* Triaxial linear acceleration from accelerometer
* estimated body acceleration
* Triaxial angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables.
* Activity label.
* An identifier of the subject who carried out the experiment.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The information is stored in the following files:

*'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The obtained dataset has been randomly partitioned into two sets, train data (70% of the volunteers selected for generating it) and test data (30%). 


## Variables used

### Input
* feat: table for features.txt file
* act_Type: table for activity_labels.txt
* subj_Train: table for subject_train.txt
* xTrain: table for x_train.txt 
* yTrain: table for y_train.txt 
* subj_Test: table for subject_test.txt
* xTest: table for x_test.txt 
* yTest: table for y_test.txt 

### Output
* train_Data
* test_Data
* total_Data
* Data_NoAct
* tidy

## Transformations

* A. Set new descriptive names for the train data
	+ act_Type: activityId=V1
	+ act_Type: activityType=V2
	+ subj_Train: subjectId=V1
	+ xTrain columns renamed as feat
	+ yTrain: activityId=V1
* B. Create the train_Data table by merging xTrain, yTrain and subj_Train data 
* C. Set new descriptive names for the train data
	+ subj_Test: subjectId=V1
	+ xTest columns renamed as feat
	+ yTest: activityId=V1 
* D. Create the test_Data set by merging xTest, yTest and Subject data 
* E. Merge the test_Data and train_Data tables into total_Data table
* F. Keep only desided Data columns cointaining subject, activity, mean and sd 
* G. Merge by activityId column total_Data table with the act_Type to name the activities
* H. Use descriptive activity names to name the activities in total_Data table
* I. Create a new table, Data_NoAct,  without the activityType column and factorized by activityId and subjectId  
* J. Create a second, independent tidy table tidy with the average of each variable for each activity and each subject.
* K. Remove the subjectId and activityId columns from tidy
* L. Write the tidy table into output file tidy.txt

## Program sections
* 1. Merge the training and the test sets to create one data set
* 2. Extract only the measurements on the mean and standard deviation for each measurement.
* 3. Use descriptive activity names to name the activities in the data set
* 4. Appropriately label the data set with descriptive activity names.
* 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
