=========================================
Getting and Cleaning Data Course Project
by Yu Xin
=========================================

The main purpose of this project is to create a tidy data set with the average of each variable for each activity and each subject. 

#In the first step, we read all the data we need from the UCI HAR Dataset. Then we add the subject and activity information to the data set. Finally the training data set and the test data set are merged.
#In the second step, the feature names are given to the data set as column names.  
#In the third step, we extracts only the measurements on the mean and standard deviation for each measurement by using the grep function.
#In the fourth step, the numerical value of the activity column is replaced by the descriptive activity names.
#In the final step, we calculate the average of each variable for each activity and each subject by using the function ddply, and rename the column names.
