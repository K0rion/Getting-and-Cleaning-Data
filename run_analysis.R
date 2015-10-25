library(data.table)
library(dplyr)
library(tidyr)

getwd()

## Download the data:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./R Programming/Dataset.zip", method="curl")

setwd("~/R Programming/UCI HAR Dataset")

## Get the data: 
datapath <- file.path("~/R Programming", "UCI HAR Dataset")
files <- list.files(datapath, recursive = TRUE)
files

# Checking on folder contents:
list.files("./train")
list.files("./test")

## 1. Merging the training and the test sets to create one data set:
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
xdata <- rbind(x_train, x_test)

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
ydata <- rbind(y_train, y_test)

sub_train <- read.table("train/subject_train.txt")
sub_test <- read.table("test/subject_test.txt")
subdata <- rbind(sub_train, sub_test)

## 2. Extracting only the measurements on the mean and standard deviation for each measurement:
feat <- read.table("features.txt")
names(subdata) <- c("subject")
names(ydata) <- c("activity")
names(xdata) <- feat[ , 2]

mean_std <- grep("-mean\\(\\)|-std\\(\\)", feat[ , 2]) 
mean_stddata <- xdata[, mean_std]
names(mean_stddata) <- gsub("\\(|\\)", "", (feat[mean_std, 2]))

## 3. Using descriptive activity names to name the activities in the data set:
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
ydata[,1] = activities[ydata[ , 1], 2]
names(ydata) <- "activity"

## 4. Appropriately labelling the data set with descriptive variable names:
names(subdata) <- "subject"

cleandata <- cbind(subdata, ydata, mean_stddata)
write.table(cleandata, "tidy_data.txt")

## 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
cleandata2 <- aggregate(. ~subject + activity, cleandata, mean)
cleandata2 <- cleandata2[order(cleandata2$subject, cleandata2$activity), ]
write.table(cleandata2, file = "tidy_data2.txt", row.name=FALSE)  
