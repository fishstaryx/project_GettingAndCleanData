===============
#Code Book 
===============
This document describes the data obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones , 
and the work that I performed to clean up these data.

## The original data
The data are collected from the accelerometers from the Samsung Galaxy S smartphone. There are 30 subjects with six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained dataset has been randomly partitioned into two sets, the training data and the test data. There are many measurements in the data like 
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* ...

## The transformatin work
In the program run_analysis.R, we follow the instructions below:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The tidy data set 
The output of the program is a tidy data set. There are 68 columns with the first two columns stand for the subject number and the activity. The following columns present the average of some measurements. The columns' names are shown below:
* Subject 
* Activity
* tBodyAcc-mean()-X_average
* tBodyAcc-mean()-Y_average
...
* fBodyBodyGyroJerkMag-std()_average

There are 180 rows stand for 30 subjects with six diferent activities respectively.
 


