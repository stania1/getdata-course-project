# Code Book

#### Data Source
[Raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Preparation

Extract the raw data and put them in the `dataset` directory (at the same level as `run_analysis.R`).

#### Transformations
1. Assemble training and test data set, separately. 
After this step, each record in the training data set will have:

	- activity id (from `y_test.txt` or `y_train.txt`)
	- subject id (from `subject_test.txt` or `subject_train.txt`)
	- the accelerometer measurements (from `X_test.txt` or `X_train.txt`)

	This step also labels measurements with labels from `features.txt`.

2. Merge the training and test data set.
3. Extract only mean and standard deviation for each measurement.
4. Use descriptive activity names from `activity_names.txt` to name the activities in the data set.
5. Group the data set by `subject_id` and `activity` and calculate the mean (on each measurement) for the group.


#### Variables

1. `activity`: the activity the subject was performing when measurements were taken
2. `subject_id`: identifies the subject of the measurement. The study was performed on 30 people, identified by numbers 1 to 30.
3. measurements: there are 2 variables for each signal (listed below) - mean and std (standard deviation). The mean and std have been averaged for the same activity and subject id combination.

	Signals:
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag


