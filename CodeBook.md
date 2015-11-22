---
title: "Getting and Cleaning Data  Project"
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

- Step 2: Combine Training labels and Test labels by using rbind command into a single data set (yall).

- Step 3: Combine Training subjects and Test subjects by using rbind command into a single data set (subjectall).

- Step 4: Read column names from features text file and set the column names of Train data set Xall

- Step 5: Extract only the measurements on the mean and standard deviation for each measurement from the dataset Xall obtained in Step1.

- Step 6: Combine data sets Xall from Step 1 and Yall from Step 2 by using cbind command. Change the new column name to "activity"  

- Step 7: Read the activity labels from activity_labels txt file

- Step 8:  Using descriptive activity names to name the activities in the data set.

- Step 9: Combine subject data to the data set obtained in Step 8 (subXyall data set)

- Step 10: "dat" data set has all the records of subject, activity and data variables. A total of 10299 obs. of 68 variablesComplete data.

- Step 11: creating a tidy data set, "finalDataSet" by using aggregate command grouped by subject and activity.


- Step 12: Appropriately label the data set with descriptive variable names.

- Step 13: Create tidy data set as text file "tidydata.txt"

The tidydata text file contains the final tidy data (finalDataSet). 

## Information about variables of tidy data

DATA DICTIONARY - Human Activity Recognition Dataset

  		
1	subject			1
		subject who performed the activity	
		1 . . 30   . Integer identifier of the subject	
			
2	activity			1
		activity code	
		1	. WALKING
		2	. WALKING_UPSTAIRS
		3	. WALKING_DOWNSTAIRS
		4	. SITTING
		5	. STANDING
		6	. LAYING
			
3	Average of tBodyAcc-mean()-X		1	
		mean of mean value of body acceleration signal in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
4	Average of tBodyAcc-mean()-Y 		1	
		mean of mean value of body acceleration signal in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
5	Average of tBodyAcc-mean()-Z 		1	
		mean of mean value of body acceleration signal in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
6	 Average of tBodyAcc-std()-X 		1	
		mean of Standard deviation value of body acceleration signal in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
7	 Average of tBodyAcc-std()-Y 		1	
		mean of Standard deviation value of body acceleration signal in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
8	 Average of tBodyAcc-std()-Z 		1	
		mean of Standard deviation value of body acceleration signal in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
9	Average of tGravityAcc-mean()-X	1	
		mean of mean value of gravity acceleration signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
10	Average of tGravityAcc-mean()-Y 	1	
		mean of mean value of gravity acceleration signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
11	 Average of tGravityAcc-mean()-Z 	1	
		mean of mean value of gravity acceleration signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
12	 Average of tGravityAcc-std()-X 		1	
		mean of Standard deviation value of gravity acceleration signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
13	Average of tGravityAcc-std()-Y		1	
		mean of Standard deviation value of gravity acceleration signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
14	 Average of tGravityAcc-std()-Z		1	
		mean of Standard deviation value of gravity acceleration signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
15	 Average of tBodyAccJerk-mean()-X	1	
		mean of mean value of body linear acceleration Jerk signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
16	 Average of tBodyAccJerk-mean()-Y	1	
		mean of mean value of body linear acceleration Jerk signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
17	 Average of tBodyAccJerk-mean()-Z 	1	
		mean of mean value of body linear acceleration Jerk signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
18	 Average of tBodyAccJerk-std()-X 	1	
		mean of Standard deviation value of body linear acceleration Jerk signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
19	Average of tBodyAccJerk-std()-Y		1	
		mean of Standard deviation value of body linear acceleration Jerk signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
20	Average of tBodyAccJerk-std()-Z	1	
		mean of Standard deviation value of body linear acceleration Jerk signalss in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
21	Average of tBodyGyro-mean()-X		1	
		mean of mean value of body angular velocity signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
22	 Average of tBodyGyro-mean()-Y	1	
		mean of mean value of body angular velocity signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
23	 Average of tBodyGyro-mean()-Z	1	
		mean of mean value of body angular velocity signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
24	Average of tBodyGyro-std()-X  		1	
		mean of Standard deviation value of body angular velocity signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
25	Average of tBodyGyro-std()-Y 		1	
		mean of Standard deviation value of body angular velocity signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
26	 Average of tBodyGyro-std()-Z		1	
		mean of Standard deviation value of body angular velocity signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
27	 Average of tBodyGyroJerk-mean()-X	1	
		mean of mean value of body angular velocity Jerk signals  in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
28	Average of tBodyGyroJerk-mean()-Y	1	
		mean of mean value of  body angular velocity Jerk signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
29	Average of tBodyGyroJerk-mean()-Z 	1	
		mean of mean value of  body angular velocity Jerk signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
30	Average of tBodyGyroJerk-std()-X 	1	
		mean of Standard deviation value of  body angular velocity Jerk signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
31	 Average of tBodyGyroJerk-std()-Y	1	
		mean of Standard deviation value of  body angular velocity Jerk signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
32	Average of tBodyGyroJerk-std()-Z  	1	
		mean of Standard deviation value of  body angular velocity Jerk signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
33	Average of tBodyAccMag-mean() 	1	
		mean of mean value of magnitude of body linear acceleration signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
34	 Average of tBodyAccMag-std() 		1	
		mean of Standard deviation value of magnitude of body linear acceleration signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
35	 Average of tGravityAccMag-mean()	1	
		mean of mean value of magnitude of angular velocity signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
36	 Average of tGravityAccMag-std()   	1	
		mean of Standard deviation value of magnitude of angular velocity signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
37	Average of  tBodyAccJerkMag-mean() 	1	
		mean of mean value of magnitude of body linear acceleration Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
38	Average of tBodyAccJerkMag-std() 	1	
		mean of Standard deviation value of magnitude of body linear acceleration Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
39	Average of tBodyGyroMag-mean() 	1	
		mean of mean value of magnitude of body angular velocity signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
40	Average of tBodyGyroMag-std()    	1	
		mean of Standard deviation value of magnitude of body angular velocity signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
41	 Average of tBodyGyroJerkMag-mean()  	1	
		mean of mean value of magnitude of body angular velocity Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
42	 Average of tBodyGyroJerkMag-std()   	1	
		mean of Standard deviation value of magnitude of body angular velocity Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
43	 Average of fBodyAcc-mean()-X		1	
		mean of mean value of body acceleration frequency domain signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
44	 Average of fBodyAcc-mean()-Y 		1	
		mean of mean value of body acceleration frequency domain signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
45	 Average of fBodyAcc-mean()-Z	 	1	
		mean of mean value of body acceleration frequency domain signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
46	 Average of fBodyAcc-std()-X 		1	
		mean of Standard deviation value of body acceleration frequency domain signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
47	Average of fBodyAcc-std()-Y 		1	
		mean of Standard deviation value of body acceleration frequency domain signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
48	 Average of fBodyAcc-std()-Z 		1	
		mean of Standard deviation value of body acceleration frequency domain signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
49	  Average of fBodyAccJerk-mean()-X	1	
		mean of mean value of body linear acceleration Jerk frequency domain signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
50	 Average of fBodyAccJerk-mean()-Y	1	
		mean of mean value of body linear acceleration Jerk frequency domain signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
51	 Average of fBodyAccJerk-mean()-Z 	1	
		mean of mean value of body linear acceleration Jerk frequency domain signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
52	  Average of fBodyAccJerk-std()-X 	1	
		mean of Standard deviation value of body linear acceleration Jerk frequency domain  signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
53	 Average of fBodyAccJerk-std()-Y	1	
		mean of Standard deviation value of body linear acceleration Jerk frequency domain  signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
54	 Average of fBodyAccJerk-std()-Z	1	
		mean of Standard deviation value of body linear acceleration Jerk frequency domain  signalss in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
55	 Average of fBodyGyro-mean()-X	1	
		mean of mean value of body angular velocity frequency domain  signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
56	  Average of fBodyGyro-mean()-Y	1	
		mean of mean value of body angular velocity frequency domain  signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
57	  Average of fBodyGyro-mean()-Z	1	
		mean of mean value of body angular velocity signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
58	 Average of fBodyGyro-std()-X 	 	1	
		mean of Standard deviation value of body angular velocity frequency domain  signals in X direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
59	 Average of fBodyGyro-std()-Y 		1	
		mean of Standard deviation value of body angular velocity frequency domain  signals in Y direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
60	 Average of fBodyGyro-std()-Z		1	
		mean of Standard deviation value of body angular velocity frequency domain   signals in Z direction (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
61	Average of fBodyAccMag-mean() 	1	
		mean of mean value of magnitude of body linear acceleration frequency domain  signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
62	 Average of fBodyAccMag-std()	 	1	
		mean of Standard deviation value of magnitude of body linear acceleration frequency domain  signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
63	Average of fBodyBodyAccJerkMag-mean()	1	
		mean of mean value of magnitude of body linear acceleration frequency domain Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
64	Average of fBodyBodyAccJerkMag-std() 	1	
		mean of Standard deviation value of magnitude of body linear acceleration frequency domain Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) standard gravity units 'g'	
			
65	Average of fBodyBodyGyroMag-mean()	1	
		mean of mean value of magnitude of body angular velocity frequency domain signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
66	Average of fBodyBodyGyroMag-std() 	1	
		mean of Standard deviation value of magnitude of body angular velocity frequency domain signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
67	 Average of fBodyBodyGyroJerkMag-mean()	1	
		mean of mean value of magnitude of body angular velocity frequency domain Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	
			
68	Average of fBodyBodyGyroJerkMag-std()	1	
		mean of Standard deviation value of magnitude of body angular velocity frequency domain Jerk signals  (signed)	
		[-1.000 . . . 1.000] signed numeric value (decimal) radians/second	

