# Getting and Cleaning Data - Course Project

#### The Course
This is done as part of the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course on Coursera, conducted by the Johns Hopkins University.

#### Data Source
[UCI Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Direct link to the data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### About The Solution
Data processing is done by `run_analysis.R`. The script assumes that the data set is in the `dataset` directory relative to itself.

The script is divided to 5 main parts (`step1()` to `step5()`), according to the steps listed as guidelines for the project:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

However, in my implementation, I did not strictly stick to the above order. For example, the `step4()` function is actually a no-op because it has been performed before.

More detailed explanation on steps involved in data processing and the variables can be found in the [code book](https://github.com/stania1/getdata-course-project/blob/master/CodeBook.md).
