# Getting and Cleaning Data Project from Coursera
# Mike Parker March 26, 2017

# Excerpts from the Coursera project instructions.
# The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
# The goal is to prepare tidy data that can be used for later analysis.
# Steps required to complete this follow:

################################################
# 1) Merges the training and the test sets to create one data set

# Setup libraries
library(dplyr)
library(reshape2)

#  Read in the X_train and X_test datasets
trainx <- read.table("X_train.txt")
testx <- read.table("X_test.txt")

# Merge the rows together to create a full dataset of 10299 obs. of  561 variables
fulldf <- rbind(trainx, testx)

################################################
# 2) Extracts only the measurements on the mean and standard deviation 
#    for each measurement.

# Read features.txt getting all the column names
features <- read.table("features.txt")

# Use a regular expression to get all the mean and std columns.  The folowing formats were accepted:
#  - mean(): Mean value
#  - std(): Standard deviation
#  - This was ignored: meanFreq(): Weighted average of the frequency components
#    to obtain a mean frequency
meanstdlist <- grep("(mean|std)\\(\\)",features[,2])

# Extract the mean and std resulting in the reduced data set of 66 columns
reduceddf <- fulldf[,meanstdlist]

# To make the merge easier the column names will be added now
# This is step 4) Appropriately labels the data set with descriptive variable names.
# Using the regular expression developed earlier extract correct column names
columnnames <- grep("(mean|std)\\(\\)",features[,2],value = TRUE)
colnames(reduceddf) <- columnnames

#################################################

# 3)Uses descriptive activity names to name the activities in the data set
#  - Load the y data sets from training and test that have the 1-6 activity codes
trainy <- read.table("y_train.txt")
testy <- read.table("y_test.txt")

# Merge the rows together to create a full dataset of 10299 obs. of 1 variables
fullactivities <- rbind(trainy, testy)

# Change the column names to real ones to make the work easier
# Note by using activityid the join with the data will be easier to see
#  - Load the activities labels dataset to match with the consolidated y
#    to add text to the 1 digit code
activitylabels <- read.table("activity_labels.txt")
colnames(activitylabels) <- c("activityid", "activity")

#  - Bind the activities (y dataset)with the reduced x data set to preserve the order
activitydata <- cbind(fullactivities, reduceddf)

# Change 2nd column name to activityid for the merge
colnames(activitydata)[1] <- "activityid"

# While the order is preserved ad the subjects yo yjr full x data set
#  - Load the y data sets from training and test that have the 1-6 activity codes
subjectstrain <- read.table("subject_train.txt")
subjectstest <- read.table("subject_test.txt")
# Merge the rows together to create a full dataset of 10299 obs. of 1 variables
fullsubjects <- rbind(subjectstrain, subjectstest)
# correct the column name
colnames(fullsubjects) <- "subject"
# bind the subjects to the full x dataset
activitydata <- cbind(fullsubjects, activitydata)

#  - Match the activity ids with the labels
matchedactivities <- merge(activitylabels,activitydata,by.x="activityid", by.y = "activityid")

# drop activity id column
matchedactivities$activityid <- NULL

###########################################################################
# 4) Appropriately label the data set with descriptive variable names. 
# This was done at the end of Step 2 when it was easier and made more sense to do

##################################################################
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

# Turn the current data set which is wide with each of the variables into
# a tidy dataset with a column for the subject, activity like walking, variable with
# rows for the measurements, and then the value.
tidyactivities <- melt(matchedactivities, id=c("subject","activity"),measure.vars=columnnames)

# Complete assignment creating summarized dataset by subject, activity, 
# variable, and the meanof each variable.
#   subject activity             variable        mean
#     <int>   <fctr>               <fctr>       <dbl>
#1        1   LAYING    tBodyAcc-mean()-X  0.22159824
#2        1   LAYING    tBodyAcc-mean()-Y -0.04051395
#3        1   LAYING    tBodyAcc-mean()-Z -0.11320355
#4        1   LAYING     tBodyAcc-std()-X -0.92805647
#5        1   LAYING     tBodyAcc-std()-Y -0.83682741
#6        1   LAYING     tBodyAcc-std()-Z -0.82606140
#7        1   LAYING tGravityAcc-mean()-X -0.24888180
summarizeddata <- summarise(group_by(tidyactivities,subject,activity,variable),
                            mean = mean(value, na.rm = TRUE))
# Write out data file to complete assignment
write.table(summarizeddata,file="meandata.txt",row.name=FALSE)
