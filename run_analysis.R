column_names <- function() {
  features <- read.table('features.txt')
  as.vector(features$V2)
}

test_data <- function() {
  subject_test <- read.table("subject_test.txt")
  names(subject_test) <- c('subject')
 
  y_test <- read.table('y_test.txt')
  names(y_test) <- c('activity')
  
  x_test <- read.table('X_test.txt')
  names(x_test) <- as.vector(column_names())
  
  complete_test <- cbind(subject_test, y_test, x_test)
}

train_data <- function() {
  subject_train <- read.table("subject_train.txt")
  names(subject_train) <- c('subject')
  
  y_train <- read.table('y_train.txt')
  names(y_train) <- c('activity')
  
  x_train <- read.table('X_train.txt')
  names(x_train) <- as.vector(column_names())
  
  complete_train <- cbind(subject_train, y_train, x_train)
}

step1 <- function() {
  data <- rbind(test_data(), train_data())
}