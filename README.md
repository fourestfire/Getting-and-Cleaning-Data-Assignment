# UCI HAR Data Codebook

## Methodology
Data was downloaded and unzipped from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

run_analysis.R applied the following methodology:

First, load all libraries, and load the test and training data. Then, merge the data into one set.
Set the column names for the data set based on the feature labels file, and then use the descriptive activity names to annotate the data set with the activity type. Bind all of the information together, cleaning column names where appropriate.

Extract only the measurements on the mean and standard deviation. Then, summarize the data set by averaging all columns grouped by subject and activity. Export this to a text file, tinyoutput.txt.

See comments on the R file for additional detail.

## Variable descriptions
| Variable | Description |
| Subject | The ID# of the person that performed the activity for each window sample. Range from 1-30 |
| Activity | The activity that the person was doing. Includes WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |



