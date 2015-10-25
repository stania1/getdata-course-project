library(dplyr)

column_names <- function() {
  features <- read.table('dataset/features.txt')
  c <- as.vector(features$V2)
  make.names(c, unique = TRUE)
}

activity_labels <- function() {
  raw <- read.table('dataset/activity_labels.txt')
  names(raw) <- c('id', 'activity')
  raw
}

test_data <- function() {
  subject_test <- read.table("dataset/test/subject_test.txt")
  names(subject_test) <- c('subject_id')
 
  y_test <- read.table('dataset/test/y_test.txt')
  names(y_test) <- c('activity_id')
  
  x_test <- read.table('dataset/test/X_test.txt')
  names(x_test) <- as.vector(column_names())
  
  complete_test <- cbind(subject_test, y_test, x_test)
}

train_data <- function() {
  subject_train <- read.table("dataset/train/subject_train.txt")
  names(subject_train) <- c('subject_id')
  
  y_train <- read.table('dataset/train/y_train.txt')
  names(y_train) <- c('activity_id')
  
  x_train <- read.table('dataset/train/X_train.txt')
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
  with_activity_labels <- merge(activity_labels(), selected_data, by.x = 'id', by.y = 'activity_id')
  
  select(with_activity_labels, -id)
}

step4 <- function() {
  step3() # no-op, already done in step 1
}

step5 <- function() {
  mean_std_with_activity_label <- tbl_df(step4())
  mean_std_with_activity_label <- mean_std_with_activity_label %>%
    arrange(activity, subject_id) %>%
    group_by(activity, subject_id) %>%
    summarise_each(funs(mean))
}

write_step5_results <- function() {
  write.table(step5(), row.names = FALSE, file = "step5.txt")
}