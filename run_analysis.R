setwd("~/Documents/Data Science/Getting Cleaning Data/UCI HAR Dataset/")

## Read in Everything ##

features <- read.table("features.txt")

test <- read.table("./test/X_test.txt")
testsubject <- read.table("./test/subject_test.txt")
testy <- read.table("./test/y_test.txt")

train <- read.table("./train/X_train.txt")
trainsubject <- read.table("train/subject_train.txt")
trainy <- read.table("train/y_train.txt")

## Descriptive Variable Names (Step 4)
names(test) <- make.names(features$V2)
names(train) <- make.names(features$V2)

## Merge files (Step 1)

# Merge Test
test$activities <- testy$V1
test$subject <-testsubject$V1
# Merge Train
train$activities <- trainy$V1
train$subject <- trainsubject$V1
# Merge Test and Train
combined <- rbind(test,train)
# Further clean up the names and remove dots
names(combined) <- gsub("[.]", "", names(combined))

## Measurements (Step 2)
# Here I use grep to obtain list of column names with mean and std in them
# 562 and 563 are the subject and activities columns
namelist <- c(grep("mean",names(combined)), grep("std",names(combined)), 562, 563)
combined <- combined[,namelist]

## Descriptive names for activities (Step 3)
library(car)
combined$activities <- recode(combined$activities, "1='WALKING';
                              2='WALKING_UPSTAIRS';
                              3='WALKING_DOWNSTAIRS';
                              4='SITTING';5='STANDING';6='LAYING'")

## Create 2nd dataset
# Need to create a column storing unique identifier for each activities-subject
combinedtemp <- cbind(combined, paste(combined$activities, combined$subject))

# Initialize new data frame
combinednew <- data.frame(numeric(length=length(table(combinedtemp[,82]))))
# Loop across the 79 measurements
for (i in 1:79) {
    temp <- tapply(combinedtemp[,i],combinedtemp[,82], mean)
    combinednew <- cbind(combinednew, temp)
}
combinednew[1]<-NULL
names(combinednew) <- names(combined)[1:79] # Variable names
# Here I extract from the row names the activity and subject codes
combinednew$id <- row.names(combinednew)
row.names(combinednew) <- NULL
combinednew$activity <- substring(combinednew$id, 0, nchar(combinednew$id)-2)
combinednew$subject <- substring(combinednew$id, nchar(combinednew$id)-1)
combinednew$subject <- as.numeric(combinednew$subject)

# Note: Step 4 is completed earlier in the script
## Output 2nd dataset (Step 5)
write.table(combinednew, file="tidy.txt", row.names=FALSE)