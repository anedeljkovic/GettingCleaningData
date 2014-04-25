Tidy Data
===================



The script `run_analysis.R` uses data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Full description of the data can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## run_analysis.R

* Download [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
	* Downloaded zip.file contains folder `UCI HAR Dataset`.
* Extract and set your working directory to `UCI HAR Dataset` in order to run the script.

* The script reads the raw training and the test sets (`X, y and subject`) from `test`and `train` folders and returns one data set.
* It extracts only the measurements on the mean and standard deviation for each measurement. 
* Then it labels the data set with descriptive activity names (`WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING`). See `CodeBook.md` 
* Finaly, it creates a tidy data set with the average of each variable for each activity and each subject. 
* Resulting data set is named `tidy_data.txt` and it is saved in `UCI HAR Dataset` folder.
