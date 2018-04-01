# ===============================================
# Variables description of the table meandata.txt
# ===============================================

# A / Original features  

1- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

2- Each features are normalized and bounded within [-1,1].

3- Original names : 
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Among the variables that were estimated from these signals, 2 are selected for the exercice : 
* mean: Mean value
* std: Standard deviation


# B/ Modification of original variables names
Some labels have been changed to be more tidy. The characters "()" and "-" have been removed. All the variables names are turned to lower case.
Example : tBodyAcc-mean()-X 
turn to be renamed : tbodyaccmeanx

# C/ New variable names
The variable identifying each subject is named : numsubject, as a factor from 1 to 30
The variable activity, as a factor of 6 labels listed in the table activity_labels

# D/ New computation
An agregagation on each subject, and for each subject for each activity, is processed with  the mean computation of eau measurements. 