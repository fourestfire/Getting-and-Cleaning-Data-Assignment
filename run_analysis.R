## data was downloaded and unzipped from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## load libraries
library(dplyr)
library(tidyr)

## load global data sets
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

## load test data sets
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

## load training data sets
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

## merges training and test data to create one data set
x <- rbind(xtest, xtrain)
y <- rbind(ytest, ytrain)
subjects <- rbind(subject_test, subject_train)
subjects <- rename(subjects, subject = V1)

## use the descriptive activity names to label the y data set
activities <- inner_join(y, activity_labels)
activities <- rename(activities, code = V1, activity = V2)

## set column names for data set based on feature labels
names(x) <- as.character(features$V2)

## bind all information together into one data set
data <- bind_cols(subjects, activities, x)

## remove invalid () character from column names
names(data) <- gsub("\\()","",names(data))

## extract only the measurements on the mean and standard deviation (also include the subject and the activity)
## this solution subsets columns through indices found using grep, then extracts further unwanted columns (angle and meanFreq)
searchfor <- c("mean", "Mean", "std","subject","activity")
columns <- unique(grep(paste(searchfor, collapse="|"), names(data)))
data <- data[,columns]
data <- select(data, -contains("meanFreq"), -contains("angle"))

## create summarized data and export to text file
summary <- data %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

write.table(summary, file = "tidyoutput.txt", row.name=FALSE)

## delete prior data sets and values to clear workspace
rm(subject_test,subject_train,xtest,xtrain,ytest,
   ytrain,features,y,activity_labels,subjects,activities,searchfor,columns,x)
