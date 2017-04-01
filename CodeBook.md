Getting and Cleaning Data Project from Coursera
Mike Parker March 26, 2017


For this exercise the following files were use:
=====================================

- 'README.txt
- 'activity_labels.txt': Links the class labels with their activity name.

The primary variables for this project are in:
- 'train/X_train.txt': Training set that is 7352 obs. of  561 variables
- 'test/X_test.txt': Test set that is 2947 obs. of  561 variables

In the same folders is the:
   subject_train or test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
   This was bound to the combined X train and test dataset. 


The column labels are in:
- 'features.txt': List of all features.
- 'features_info.txt': Shows text information about the variables used on the feature vector. Used only as reference

fpr the X dataset only the measurements on the mean and standard deviation for each measurement were extracted.
	- Read features.txt getting all the column names
	- Used a regular expression to get all the mean and std columns.  The following formats were accepted:
		- mean(): Mean value
		- std(): Standard deviation
	- This was ignored: meanFreq(): Weighted average of the frequency components to obtain a mean frequency

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
These were combined and bound to the combined X dataset.

Output
- 'meandata.txt'
	- Summarized dataset by subject, activity, 
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


