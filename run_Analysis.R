rm(list=ls())
library(dplyr)
setwd('c:/carlos/cursosJH/Get&Cleandata/Ejercicios/UCI HAR Dataset/');

# 1. Merge the training and the test sets to create one data set.
# Read in the data from files
feat = read.table('./features.txt',header=FALSE)
act_Type = read.table('./activity_labels.txt',header=FALSE) 
subj_Train = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE) 
# A. Set new descriptive names for the train data
act_Type <- rename(act_Type, activityId=V1)
act_Type <- rename(act_Type, activityType=V2)  
subj_Train <- rename(subj_Train, subjectId=V1) 
yTrain <- rename(yTrain, activityId=V1) 
colnames(xTrain) = feat[,2]
# B. Create the train_Data table by merging xTrain, yTrain and subj_Train data 
train_Data = cbind(yTrain,subj_Train,xTrain)
# Read in the test data
subj_Test = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)
# C. Set new descriptive names for the train data
subj_Test <- rename(subj_Test, subjectId=V1) 
yTest <- rename(yTest, activityId=V1) 
colnames(xTest) = feat[,2]
# D. Create the test_Data set by merging xTest, yTest and Subject data 
test_Data = cbind(yTest,subj_Test,xTest)
# E. Merge the test_Data and train_Data tables into total_Data table
total_Data = rbind(train_Data,test_Data)
# Create a vector containing the column names from total_Data
cols = colnames(total_Data)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# F. Keep only desided Data columns cointaining subject, activity, mean and sd 
meas = (grepl("activity..",cols) | grepl("subject..",cols) | grepl("-mean..",cols) & !grepl("-meanFreq..",cols) & !grepl("mean..-",cols) | grepl("-std..",cols) & !grepl("-std()..-",cols))
# Subset total_Data for the selected columns
total_Data = total_Data[meas==TRUE];

# 3. Use descriptive activity names to name the activities in the data set
# G. Merge by activityId column total_Data table with the act_Type to name the activities
total_Data = merge(total_Data,act_Type,by='activityId',all.x=TRUE);
# Include the new column names 
cols = colnames(total_Data);

# 4. Appropriately label the data set with descriptive activity names.
# Rename columns names to get descriptive clean names
for (i in 1:length(cols))
{
    cols[i] = gsub("\\()","",cols[i])
    cols[i] = gsub("-std$","StDev",cols[i])
    cols[i] = gsub("-mean","Mean",cols[i])
    cols[i] = gsub("^(t)","time",cols[i])
    cols[i] = gsub("^(f)","freq",cols[i])
    cols[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",cols[i])
    cols[i] = gsub("AccMag","AccMagnit",cols[i])
    cols[i] = gsub("JerkMag","JerkMagnit",cols[i])
    cols[i] = gsub("GyroMag","GyroMagnit",cols[i])
};
# H. Use descriptive activity names to name the activities in total_Data table
colnames(total_Data) = cols;

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
# I. Create a new table, Data_NoAct,  without the activityType column and factorized by activityId and subjectId  
Data_NoAct = total_Data[,cols != 'activityType'];
# J. Create a second, independent tidy table tidy with the average of each variable for each activity and each subject.
tidy = aggregate(Data_NoAct[,names(Data_NoAct) != c('activityId','subjectId')],by=list(activityId=Data_NoAct$activityId,subjectId = Data_NoAct$subjectId),mean);
# K. Remove the subjectId and activityId columns from tidy
tidy = merge(tidy,act_Type,by='activityId',all.x=TRUE);
# L. Write the tidy table into output file tidy.txt
write.table(tidy, './tidy.txt',row.names=FALSE,sep='\t');
