# UCI HAR Data Codebook

## Overview
The data processes here leverage the Data Human Activity Recognition Using Smartphones Dataset, V1.0, by authors at the Non Linear Complex Systems Laboratory: DITEN - Università degli Studi di Genova.

The goal of the run_analysis.R process is to take the data and transform it to take the average of the mean and std across subjects and activities.

## Methodology
Data was downloaded and unzipped from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

run_analysis.R applied the following methodology:

First, load all libraries, and load the test and training data. Then, merge the data into one set.
Set the column names for the data set based on the feature labels file, and then use the descriptive activity names to annotate the data set with the activity type. Bind all of the information together, cleaning column names where appropriate.

Extract only the measurements on the mean and standard deviation. Then, summarize the data set by averaging all columns grouped by subject and activity. Export this to a text file, tinyoutput.txt.

See comments on the R file for additional detail.

## Variable descriptions
Subject: The ID# of the person that performed the activity for each window sample. Range from 1-30

Activity: The activity that the person was doing. Includes WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

Measurements: Signal Domain is represented by 't' or 'f' for time and frequency. Acceleration type is represented by 'body' vs 'gravity'. Accelerometer vs Gyroscope functions are marked by 'Accel' and 'Gyro'. Axial measurements are given by 'X', 'Y', and 'Z'. Jerk signals are marked by 'jerk', and magnitude is marked by 'mag'.




