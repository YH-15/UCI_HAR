library(dplyr)
library(data.table)

## Read all the data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 1. Merges the training and the test sets to create one data set.
subject <- rbind(subject_test, subject_train)
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
rm(subject_test, subject_train, x_test, x_train, y_test, y_train)

## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 
criteria <- grepl("mean()|std()",features$V2)
features <- features[criteria,]
x <- x %>% select(features[,1])

## 3. Uses descriptive activity names to name the activities 
## in the data set
y <- mutate(y, V1 = labels[V1,2])

## 4. Appropriately labels the data set with descriptive variable names. 
names(x) <- features[,2]
subject <- rename(subject, Subject = V1)
y <- rename(y, Activities = V1)

## 5. From the data set in step 4, 
## creates a second, independent tidy data set with the average of each variable
## for each activity and each subject.
NewData <- cbind(subject, y, x) %>%
        group_by(Activities, Subject) %>%
        summarise_each(funs(mean))
## Create a new file to store a tidy data set 
file.create("./UCI_HAR/New_data.csv")
write.table(NewData, file="./UCI_HAR/New_data.csv", 
            row.names=TRUE, col.names = TRUE, 
            sep = ",", quote = FALSE)
 