suppressWarnings(library(sqldf))
suppressWarnings(library(dplyr))

## read X_train data into trainX 
trainX<- read.table("./UCI_HAR_Dataset/train/X_train.txt")
## read X_test data into testX
testX <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
## merge trainX and testX into a single data set and assign it to Xall
Xall <- rbind(trainX, testX)

## read y_train data into trainy 
trainy <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
## read y_test data into testy
testy <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
## merge trainy and testy into a single data set and assign it to yall
yall<- rbind(trainy, testy )


## read  subject_train and subject_test data into trainSubject and testSubject respectively
trainSubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
testSubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
## merge trainSubject and testSubject into a single data set and assign it to subjectall
subjectall <- rbind(trainSubject, testSubject)

## read column names from features text file and set the column names of Xall 
features <- read.table("./UCI_HAR_Dataset/features.txt")
names(Xall) <- features[[2]]

## Extracts only the measurements on the mean and standard deviation for each measurement from Xall
## into subXall
subXall <-subset(Xall, select = c((grepl("mean()", names(Xall), fixed = T) | (grepl("std()", names(Xall), fixed = T) ))))

## combine activity (yall) and data (subXall) using cbind 
subXyall <- cbind(yall,subXall)
names(subXyall)[1] <- "activity"
str(subXyall)

## read the activity labels from activity_labels txt file
activitylabels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", stringsAsFactors = F)
## 1 WALKING  2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING

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


## merge subject data to the above subXyall data into a new variable "dat"
dat <- cbind(subjectall,subXyall)
names(dat)[1] <- "subject"

## removing extra activitylbl column
dat <- dat[,1:68]

## data set, "dat" has all the records of subject, activity and data variables. 
## A total of 10299 obs. of 68 variables


##### create a second, independent tidy data set with the average of each
##### variable for each activity and each subject.


## creating a tidy data set, "finalDataSet" has variable means grouped by subject and activity 


finalDataSet <- aggregate(dat[,-(1:2)], list(dat$subject, dat$activity),mean)
names(finalDataSet)[1] <- "Subject"
names(finalDataSet)[2] <- "Activity"

## "finalDataSet" : A total of 180 obs. of 68 variables

namesbefore <- names(finalDataSet)

for (i in 3:length(namesbefore)) {
    namesbefore[i] <- paste("Average of", namesbefore[i])
}
names(finalDataSet) <- namesbefore

## Write fianl tidy data to text file ("tidydata.txt")
file <- "./tidydata.txt"
write.table(finalDataSet, file = file, row.names=F, col.names=T, sep ="\t", quote=F)






