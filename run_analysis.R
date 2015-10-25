library(dplyr)

column_names <- function() {
  features <- read.table('features.txt')
  c <- as.vector(features$V2)
  make.names(c, unique = TRUE)
}

activity_labels <- function() {
  raw <- read.table('activity_labels.txt')
  names(raw) <- c('id', 'activity')
  raw
}

test_data <- function() {
  subject_test <- read.table("subject_test.txt")
  names(subject_test) <- c('subject_id')
 
  y_test <- read.table('y_test.txt')
  names(y_test) <- c('activity_id')
  
  x_test <- read.table('X_test.txt')
  names(x_test) <- as.vector(column_names())
  
  complete_test <- cbind(subject_test, y_test, x_test)
}

train_data <- function() {
  subject_train <- read.table("subject_train.txt")
  names(subject_train) <- c('subject_id')
  
  y_train <- read.table('y_train.txt')
  names(y_train) <- c('activity_id')
  
  x_train <- read.table('X_train.txt')
  names(x_train) <- as.vector(column_names())
  
  complete_train <- cbind(subject_train, y_train, x_train)
}

step1 <- function() {
  data <- rbind(test_data(), train_data())
  tbl_df(data)
}

step2 <- function() {
  merged_data <- step1()
  select(merged_data, subject_id, activity_id, contains("mean"), contains("std"), -contains("meanFreq"))
}

step3 <- function() {
  selected_data <- step2()
  # use basic subsetting instead of merge
  selected_data$activity_id[selected_data$activity_id == 1] <- 'WALKING'
  selected_data$activity_id[selected_data$activity_id == 2] <- 'WALKING_UPSTAIRS'
  selected_data$activity_id[selected_data$activity_id == 3] <- 'WALKING_DOWNSTAIRS'
  selected_data$activity_id[selected_data$activity_id == 4] <- 'SITTING'
  selected_data$activity_id[selected_data$activity_id == 5] <- 'STANDING'
  selected_data$activity_id[selected_data$activity_id == 6] <- 'LAYING'
  
  selected_data
}

step4 <- function() {
  step3() # no-op, already done in step 1
}

step5 <- function() {
  mean_std_with_activity_label <- tbl_df(step4())
  mean_std_with_activity_label <- mean_std_with_activity_label %>%
    arrange(activity_id, subject_id) %>%
    group_by(activity_id, subject_id) %>%
    summarise_each(funs(mean))
}