# HW1A_Cleaning_Data
Getting clean data assignment using Human Activity Recognition using Smartphones data set from UCI MLR

First step: Read all necessary txt files
This included the training set, training labels, test set, test labels, features, activity labels, subject train, and subject test.

Second step: make two complete data sets
I worked on the training data set first. I merged the X_train file with subject_train file (which identifies the subject who performed the activity). Then, I merged the y_train file (which identifies what activity is done by each subject). Lastly, I merged the activity.labels file (which adds the descriptive activity names for each activity number in the y_train file). The same process was followed for the testing data set.

Third step: Make one full data set
I merged the training and testing data sets. I added the descriptive variable names to the data set using the features file.

Fourth step: Mean and std measurements
I made sure all columns had unique names with valid characters. Then, I extracted all variables that included "mean" and "std" in variable name. This was done by Activity and by each Subject. A new data set was created with just these variables.
