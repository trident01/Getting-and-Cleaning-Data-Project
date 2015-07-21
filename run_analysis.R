
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

#Column-bind 3 data frames so that the columns are
#subject number, data, and activity, in this order
#This (for our purposes) is the complete training data
trainingData <- cbind(subject_train, X_train, y_train)

#Same as above but with the test data

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
testData <- cbind(subject_test, X_test, y_test)

#Combine training and test data sets
mergedData <- rbind(trainingData,testData)

#Read the names of the different features that were measured
#so we can name columns appropriately
features <- read.table("UCI HAR Dataset/features.txt")[[2]]


colnames(mergedData) <-c("Subject", as.character(features), "Response")
mergedData$Response <- factor(mergedData$Response)
levels(mergedData$Response) = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
mergedData_mean_sd <- cbind(mergedData[,(grepl("mean()", features, fixed = TRUE) | grepl("std()", features, fixed = TRUE))])

tidyData <- aggregate(mergedData_mean_sd[,2:67], list(Subject = mergedData_mean_sd$Subject, Response = mergedData_mean_sd$Response), mean)

write.table(tidyData, "tidyData.txt", row.name = FALSE)