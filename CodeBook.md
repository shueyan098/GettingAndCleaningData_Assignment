---
title: "Getting and Cleaning Data Assignment Code Book"
author: "Eng"
date: "March 1, 2019"
output: html_document
---


## Data

The **tidy_data.txt** contains the data of human activities recognition using Smartphone. Each row represents average of measurements of sensor signals (accelerometer and gyroscope) captured for each activity done by a person. 

## Variables

* `subject`  
  ID that represents person, integer, ranges from 1 to 30.  

* `activity`  
  Activities that done by each person; WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

* `tBodyAcc_mean_X`  
* `tBodyAcc_mean_Y`  
* `tBodyAcc_mean_Z`  
* `tBodyAcc_std_X`  
* `tBodyAcc_std_Y`  
* `tBodyAcc_std_Z`  
  Average and standard deviation of time-domain body acceleration in the X, Y and Z directions.

* `tGravityAcc_mean_X`  
* `tGravityAcc_mean_Y`  
* `tGravityAcc_mean_Z`  
* `tGravityAcc_std_X`  
* `tGravityAcc_std_Y`  
* `tGravityAcc_std_Z`  
  Average and standard deviation of the time-domain gravity acceleration in the X, Y and Z directions.  

* `tBodyAccJerk_mean_X`  
* `tBodyAccJerk_mean_Y`  
* `tBodyAccJerk_mean_Z`  
* `tBodyAccJerk_std_X`  
* `tBodyAccJerk_std_Y`  
* `tBodyAccJerk_std_Z`  
  Average and standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions.
  
* `tBodyGyro_mean_X`  
* `tBodyGyro_mean_Y`  
* `tBodyGyro_mean_Z`  
* `tBodyGyro_std_X`  
* `tBodyGyro_std_Y`  
* `tBodyGyro_std_Z`  
  Average and standard deviation of the time-domain body angular velocity in the X, Y and Z directions.
  
* `tBodyGyroJerk_mean_X`  
* `tBodyGyroJerk_mean_Y`  
* `tBodyGyroJerk_mean_Z`  
* `tBodyGyroJerk_std_X`  
* `tBodyGyroJerk_std_Y`  
* `tBodyGyroJerk_std_Z`  
  Average and standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions.

* `tBodyAccMag_mean`  
* `tBodyAccMag_std`  
  Average and standard deviation of the time-domain magnitude of body acceleration.
  
* `tGravityAccMag_mean`  
* `tGravityAccMag_std`  
  Average and standard deviation of the time-domain magnitude of gravity acceleration.
  
* `tBodyAccJerkMag_mean`  
* `tBodyAccJerkMag_std`  
  Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time).

* `tBodyGyroMag_mean`  
* `tBodyGyroMag_std`  
  Average and standard deviation of the time-domain magnitude of body angular velocity.

* `tBodyGyroJerkMag_mean`  
* `tBodyGyroJerkMag_std`  
  Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time).
  
* `fBodyAcc_mean_X`  
* `fBodyAcc_mean_Y`  
* `fBodyAcc_mean_Z`  
* `fBodyAcc_std_X`  
* `fBodyAcc_std_Y`  
* `fBodyAcc_std_Z`  
  Average and standard deviation of the frequency-domain body acceleration in the X, Y and Z directions.
  
* `fBodyAccJerk_mean_X`  
* `fBodyAccJerk_mean_Y`  
* `fBodyAccJerk_mean_Z`  
* `fBodyAccJerk_std_X`  
* `fBodyAccJerk_std_Y`  
* `fBodyAccJerk_std_Z`  
  Average and standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions.

* `fBodyGyro_mean_X`  
* `fBodyGyro_mean_Y`  
* `fBodyGyro_mean_Z`  
* `fBodyGyro_std_X`  
* `fBodyGyro_std_Y`  
* `fBodyGyro_std_Z`  
  Average and standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions.
  
* `fBodyAccMag_mean`  
* `fBodyAccMag_std`  
  Average and standard deviation of the frequency-domain magnitude of body acceleration.

* `fBodyBodyAccJerkMag_mean`  
* `fBodyBodyAccJerkMag_std`  
  Average and standard deviation of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time).
  
* `fBodyBodyGyroMag_mean`  
* `fBodyBodyGyroMag_std`  
  Average and standard deviation of the frequency-domain magnitude of body angular velocity.

* `fBodyBodyGyroJerkMag_mean`  
* `fBodyBodyGyroJerkMag_std`  
  Average and standard deviation of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time).

## Transformation

The source data is extracted from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> (for more details, see <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>).  

Transformations applied to the source data are:

1.  Merging both training and test datasets into one dataset.
2.  Extracting only variables related to the measurements on mean (*mean()*) and standard deviation (*std()*). 
3.  Replacing activity IDs with activity type names.
4.  Tidy-up variable names by removing "()" and replacing "-" with "_".
5.  Calculating the average of each variable for each subject and subject and output it to a text file.

