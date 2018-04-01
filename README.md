# ----------------------------------------------------------------
# TIDY DATA - Human Activity Recognition Using Smartphones Dataset 
# ----------------------------------------------------------------

## Context 
The The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### The code file is : run_analysis.R 
The different steps performed are : 

## Download the files from the web
The web address is :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


## Reading the tables in R 
The measurements of the features of the test group are : X_test.txt
The result of the activity classification : y_test.txt
The numbers identifying the 30 subjects : subject_test.txt
The corresponding files are also read for the train set.

Labels are read from those two files : 
activity_labels.txt
features.txt

## Merging the training and the test datasets 
The 3 test files above and the 3 training files are merged. They are composed of the same variables.

## Extracting only the measurements on the mean and standard deviation for each measurement.
The features file contains the names of the measurements and is used to labelled the new X dataframe with the test and training measurements.
The variables names containing the words mean or std are selected.
        
## Using descriptive activity names to name the activities in the data set       
The table activity_labels is composed of the 6 activity labels and number from 1 to 6.
The value of the table y are replaced by those labels.
   
## Appropriately labels the data set with descriptive variable names.
Labels are added for the variable of the tables subject and y are (Xmeanstd already changed before for selection).

The variable subject is changed from integer to factor as this is not a mathematical measure but an ID identification.    
        
According to tidy data rules, the symbols "-" and "()" are removed from variable names.
     
As all the table are tidy, a final merge of subject, y, X (mean and std) is processed to get a unique final dataset.   
        
        
## From that data set, creation of a a second, independent tidy data 
## set with the average of each variable for each activity and each subject.

An agregagation on each subject, and for each subject for each activity, is processed with  the mean computation of eau measurements.       

### This final data frame is saved to the file meandata.txt



