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
  with_activity_label <- merge(activity_labels(), selected_data, by.x = 'id', by.y = 'activity_id')
  with_activity_label <- select(with_activity_label, -id)
}

step4 <- function() {
  step3() # no-op, already done in step 1
}