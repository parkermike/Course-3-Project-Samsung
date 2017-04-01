Getting and Cleaning Data Project from Coursera
Mike Parker March 26, 2017

Excerpts from the Coursera project instructions.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained
which follows.

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. 

For this exercise the following files were use:
=====================================

- 'README.txt
- 'activity_labels.txt': Links the class labels with their activity name.

The primary variables for this project are in:
- 'train/X_train.txt': Training set that is 7352 obs. of  561 variables
- 'test/X_test.txt': Test set that is 2947 obs. of  561 variables

The column labels are in:
- 'features.txt': List of all features.
- 'features_info.txt': Shows text information about the variables used on the feature vector. Used only as reference

Activity
- 'activity_labels.txt': Links the class labels with their activity name.  There are entries in this dataset that describe the activity.
	These are 1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
.
- 'train/y_train.txt': Training dataset, with labels with the activity codes 1-6.
- 'test/y_test.txt': Test labels. 

==========================================================================================
The project is to create one R script called run_analysis.R that does the following:
 
1) Merges the training and the test sets to create one data set.
	- Setup libraries
	- Read in the X_train and X_test datasets
	- Merge the rows together to create a full dataset of 10299 obs. of  561 variables

2) Extracts only the measurements on the mean and standard deviation for each measurement.
	- Read features.txt getting all the column names
	- Use a regular expression to get all the mean and std columns.  The following formats were accepted:
		- mean(): Mean value
		- std(): Standard deviation
	- This was ignored: meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	- Extract the mean and std resulting in the reduced data set of 66 columns
	- To make the merge easier the column names will be added now
		This is step 4) Appropriately labels the data set with descriptive variable names.
		Using the regular expression developed earlier extract correct column names

3) Uses descriptive activity names to name the activities in the data set
	- Load the y data sets from training and test that have the 1-6 activity codes
	- Merge the rows together to create a full dataset of 10299 obs. of 1 variables
	- Load the activities labels dataset to match with the consolidated y to add text to the 1 digit codes
	- Change the column names to real ones to make the work easier
	    Note by using activityid the join with the data will be easier to see
	- Bind the activities (y dataset)with the reduced x data set to preserve the order
	- Change the column name of the first column
	- While the order is preserved ad the subjects yo yjr full x data set
	- Load the y data sets from training and test that have the 1-6 activity codes
	- Merge the rows together to create a full dataset of 10299 obs. of 1 variables
	- Correct the column name of the subject column
	- Bind the subjects to the full x dataset
	- Match the activity ids with the labels
	- Drop activity id column

4) Appropriately label the data set with descriptive variable names.
	- This was done at the end of Step 2 when it was easier and made more sense to do
 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
   for each activity and each subject.
	- Turn the current data set which is wide with each of the variables into
	  a tidy dataset with a column for the subject, activity like walking, variable with
	  rows for the measurements, and then the value.
	- Complete assignment creating summarized dataset by subject, activity, 
	  variable, and the meanof each variable.
		subject activity             variable        mean
    		  <int>   <fctr>               <fctr>       <dbl>
	     1        1   LAYING    tBodyAcc-mean()-X  0.22159824
	     2        1   LAYING    tBodyAcc-mean()-Y -0.04051395
	     3        1   LAYING    tBodyAcc-mean()-Z -0.11320355
	     4        1   LAYING     tBodyAcc-std()-X -0.92805647
	     5        1   LAYING     tBodyAcc-std()-Y -0.83682741
             6        1   LAYING     tBodyAcc-std()-Z -0.82606140
	     7        1   LAYING tGravityAcc-mean()-X -0.24888180
	-Write out data file to complete assignment

