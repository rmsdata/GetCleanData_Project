---
title: "README"
output: html_document
---

The purpose of this project is to collect, work with, and clean a Human Activity Recognition Using Smartphones Dataset. The goal is to prepare tidy data that can be used for later analysis. 

## About the raw data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### The dataset includes the following files:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## About the Tidy data

The goal is to create a independent tidy data set independent tidy data set with the average of each variable for each activity and each subject.


### Steps performed to clean up the data

- Step 1: Combine Train set and Test set by using rbind command into a single data set (Xall).

```{r}
## read X_train data into trainX 
trainX<- read.table("./UCI_HAR_Dataset/train/X_train.txt")
## read X_test data into testX
testX <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
## merge trainX and testX into a single data set and assign it to Xall
Xall <- rbind(trainX, testX)

```

- Step 2: Combine Training labels and Test labels by using rbind command into a single data set (yall).

```{r}
## read y_train data into trainy 
trainy <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
## read y_test data into testy
testy <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
## merge trainy and testy into a single data set and assign it to yall
yall<- rbind(trainy, testy )
```

- Step 3: Combine Training subjects and Test subjects by using rbind command into a single data set (subjectall).

```{r}
## read  subject_train and subject_test data into trainSubject and testSubject respectively
trainSubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
testSubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
## merge trainSubject and testSubject into a single data set and assign it to subjectall
subjectall <- rbind(trainSubject, testSubject)
```

- Step 4: Read column names from features text file and set the column names of Train data set Xall

```{r}
## read column names from features text file and set the column names of Xall 
features <- read.table("./UCI_HAR_Dataset/features.txt")
names(Xall) <- features[[2]]
```

- Step 5: Extract only the measurements on the mean and standard deviation for each measurement from the dataset Xall obtained in Step1.

```{r}
## Extracts only the measurements on the mean and standard deviation for each measurement from Xall
## into subXall
subXall <-subset(Xall, select = c((grepl("mean()", names(Xall), fixed = T) | (grepl("std()", names(Xall), fixed = T) ))))
```

- Step 6: Combine data sets Xall from Step 1 and Yall from Step 2 by using cbind command. Change the new column name to "activity"  

```{r}
## combine activity (yall) and data (subXall) using cbind 
subXyall <- cbind(yall,subXall)
names(subXyall)[1] <- "activity"
str(subXyall)
```

- Step 7: Read the activity labels from activity_labels txt file

```{r}
## read the activity labels from activity_labels txt file
activitylabels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", stringsAsFactors = F)
## 1 WALKING  2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
```

- Step 8:  Using descriptive activity names to name the activities in the data set.

```{r}
## lblfunction takes a number and returns the corresponding activity label 
lblfunction <- function(i) {
    activitylabels$V2[i]
}

## create a new column, activitylbl containing descriptive activity names to name the activities
for (i in 1:nrow(subXyall)) {
    subXyall$activitylbl[i] <- lblfunction(subXyall$activity[[i]])
}

## replace numbers in activity to  descriptive names 
for (i in 1:nrow(subXyall)) {
    subXyall$activity[i] <- subXyall$activitylbl[[i]]
}

```

- Step 9: Combine subject data to the data set obtained in Step 8 (subXyall data set)

```{r}
## merge subject data to the above subXyall data into a new variable "dat"
dat <- cbind(subjectall,subXyall)
names(dat)[1] <- "subject"

## removing extra activitylbl column
dat <- dat[,1:68]

```

- Step 10: "dat" data set has all the records of subject, activity and data variables. A total of 10299 obs. of 68 variablesComplete data.

```{r}
## data set, "dat" has all the records of subject, activity and data variables. 
## A total of 10299 obs. of 68 variables

```

- Step 11: creating a tidy data set, "finalDataSet" by using aggregate command grouped by subject and activity.

```{r}
## creating a tidy data set, "finalDataSet" has variable means grouped by subject and activity 


finalDataSet <- aggregate(dat[,-(1:2)], list(dat$subject, dat$activity),mean)
names(finalDataSet)[1] <- "Subject"
names(finalDataSet)[2] <- "Activity"

## "finalDataSet" has total of 180 obs. of 68 variables

```

- Step 12: Appropriately label the data set with descriptive variable names.

```{r}
namesbefore <- names(finalDataSet)

for (i in 3:length(namesbefore)) {
    namesbefore[i] <- paste("Average of", namesbefore[i])
}
names(finalDataSet) <- namesbefore
```

- Step 13: Create tidy data set as text file "tidydata.txt"

```{r}
## Write fianl tidy data to text file ("tidydata.txt")
file <- "./tidydata.txt"
write.table(finalDataSet, file = file, row.names=F, col.names=T, sep ="\t", quote=F)

```

The tidydata text file contains the final tidy data (finalDataSet). 