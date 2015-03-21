#Getting_and_Cleaning_Data_Project

The script loads the following tables into memory:
* ./UCI HAR Dataset/features.txt
* ./UCI HAR Dataset/activity_labels.txt
* ./UCI HAR Dataset/test/subject_test.tx
* ./UCI HAR Dataset/test/X_test.txt
* ./UCI HAR Dataset/test/y_test.txt
* ./UCI HAR Dataset/train/subject_train.txt
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/train/y_train.txt

The activity labels are replaced with the activity name in the y_test and y_train tables. The columns of subject, x and y are combined for both the test and train data, after which the rows of the two resulting sets are merged. The 

The column names are set using the data from the features table. All columns that are not means or standard deviation are removed, and the mean of each column is calculated divided by subject and activity by melting the table followed by dcasting it.

Finally the table is written to the file dataAverages.txt in the working directory.
