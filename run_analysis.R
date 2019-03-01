#1. Downloading and unzipping dataset

if(!file.exists("./data")){dir.create("./data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/assignmentdata.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/assignmentdata.zip",exdir="./data")


#2. Merging the training and the test sets to create one data set:

#2.1 reading files

# Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#2.2 Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#2.3 Merging all data in one set:
mrg_train <- cbind(subject_train, y_train, x_train)
mrg_test <- cbind(subject_test, y_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

# remove individual data tables to save memory 
rm(x_train, y_train, subject_train,  
   x_test, y_test, subject_test) 


#3. Extracting only the measurements on the mean and standard deviation for each measurement

#3.1 Reading column names:
colNames <- colnames(setAllInOne)

#3.2 Create vector for defining ID, mean and standard deviation
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean\\(\\)" , colNames) | 
                   grepl("std\\(\\)" , colNames) 
                )

# ... and keep data in these columns only 
humanActivity <- setAllInOne[, mean_and_std] 


#4. Using descriptive activity names to name the activities in the data set:
humanActivityNames <- merge(humanActivity, activityLabels,
                              by='activityId',
                              all.x=TRUE)


#5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

#5.1 Making second tidy data set
library(dplyr)
secTidySet <- humanActivityNames %>%
              mutate(activityId = NULL) %>%
              group_by(subjectId, activityType) %>%
              summarise_all(mean)

#tidy column names
names(secTidySet)

colnames(secTidySet)[1] <- "subject"
colnames(secTidySet)[2] <- "activity"
colnames(secTidySet)[-2:-1] <- gsub("-","_", gsub("\\(\\)", "", colnames(secTidySet)[-2:-1]) )

#5.2 Writing second tidy data set in txt file
write.table(secTidySet, "tidy_data.txt", row.names = FALSE, quote = FALSE) 




