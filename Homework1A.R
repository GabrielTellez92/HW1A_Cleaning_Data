# Gabriel Tellez
# Homework 1A - Getting Clean Data
# 05/31/2018

library(dplyr)

#################################################
# READ ALL NECESSARY TXT FILES
# reading X_train = training set
train.X = read.table("train/X_train.txt")
#reading y_train = training labels
train.y = read.table("train/y_train.txt")
# reading X_test = test set
test.X = read.table("test/X_test.txt")
# reading y_test = test labels
test.y = read.table("test/y_test.txt")

# reading features file
features = read.table("features.txt")
# reading activity_labels file
activity.labels = read.table("activity_labels.txt")
# reading subject who performed activity files
subject.train = read.table("train/subject_train.txt")
subject.test = read.table("test/subject_test.txt")
#################################################
#################################################
# TRAIN DATA SET
# combining subject.train with train.X
# this adds column identifying the subject who performed the activity; range 1:30
# added column V1100
train.subject = bind_cols(subject.train, train.X)
# combining train.y with train.subject
# this shows what rows correspond to what activity done by each subject; range 1:6
# added column v1101
train.number = bind_cols(train.y, train.subject)
# merge activity.labels with train.number by first column which is the activity number
# this adds the descriptive activity names for each activity number
train.label = merge(activity.labels, train.number, by = "V1")

# TEST DATA SET
# same three steps done on test data set
test.subject = bind_cols(subject.test, test.X)
test.number = bind_cols(test.y, test.subject)
test.label = merge(activity.labels, test.number, by = "V1")
#################################################
#################################################
# FULL DATA SET
# combining training and testing data to make one full data set
all.data = bind_rows(train.label, test.label)

# add descriptive variable names using features txt file
# first, add three new variable names to features file
row1 = data.frame(V1 = 1, V2 = "Activity_Number")
features = rbind(row1, features)
row2 = data.frame(V1 = 2, V2 = "Activity_Label")
features = rbind(row2, features)
row3 = data.frame(V1 = 3, V2 = "Subject_Number")
features = rbind(row3, features)

# integrate features with full data set
names(all.data) = features$V2
#################################################
#################################################
# MEAN AND STD DEV MEASUREMENTS
# making sure column names have unique names with valid characters
valid_column_names <- make.names(names=names(all.data), unique=TRUE, allow_ = TRUE)
names(all.data) <- valid_column_names
# extract measurements that include mean and std dev for each observation
mean = select(all.data, starts_with("Activity"), starts_with("Subject"), contains("mean"))
std = select(all.data, contains("std"))

# new data set with mean and std variables
tidy = bind_cols(mean, std)

# create txt file for submission
write.table(tidy, row.names = FALSE, "tidy.txt")


