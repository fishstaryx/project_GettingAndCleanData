#by yuxin

library(plyr)

# Step 1 - Read the data from the train and test folders and combine them.

TrainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
TrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
TrainSubject <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
TrainData <- cbind(TrainSubject, TrainActivity, TrainSet)

TestSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
TestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
TestSubject <-  read.table("./UCI HAR Dataset/test/subject_test.txt")
TestData <- cbind(TestSubject, TestActivity, TestSet)

DataSet <- rbind(TrainData, TestData)


# Step 2 - labels the data set with descriptive variable names.

featurename <- read.table("./UCI HAR Dataset/features.txt")
names(DataSet) <- c("Subject", "Activity", as.vector(featurename$V2))


# Step 3 - Extracts only the measurements on the mean and standard deviation for each measurement.

DataSubset <- DataSet[,c(1,2,grep("mean\\(\\)|std\\(\\)", featurename$V2)+2)]


# Step 4 - Uses descriptive activity names to name the activities in the data set

activitylabel<- read.table("./UCI HAR Dataset/activity_labels.txt")
activitylabel <- as.vector(activitylabel[,2])
for(i in 1:nrow(DataSubset)){ 
        num = as.numeric(DataSubset[i,2])
        DataSubset[i,2] = activitylabel[num] 
}


# Step 5 - create a tidy data set  with the average of each variable for each activity and each subjec
numcol <- ncol(DataSubset)
TidyData <- ddply(DataSubset,.(Subject, Activity), function(x) colMeans(x[,3:numcol]))
names(TidyData)[3:numcol] <- paste(names(TidyData)[3:numcol],"_average",sep="")

write.table(TidyData,file="./tidydata.txt", row.name=FALSE)

