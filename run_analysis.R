setwd("~/Documents/Data Science/Getting Cleaning Data/UCI HAR Dataset/")

## Read in Everything ##

features <- read.table("features.txt")

test <- read.table("./test/X_test.txt")
testsubject <- read.table("./test/subject_test.txt")
testy <- read.table("./test/y_test.txt")

train <- read.table("./train/X_train.txt")
trainsubject <- read.table("train/subject_train.txt")
trainy <- read.table("train/y_train.txt")

## Add names
names(test) <- features$V2
names(train) <- features$V2

## Merge files

# Merge Test
test$y <- testy$V1
test$subject <-testsubject$V1
# Merge Train
train$y <- trainy$V1
train$subject <- trainsubject$V1
# Merge Test and Train
combined <- rbind(test,train)

## Measurements
