Tidy Data
===================



The script `run_analysis.R` uses data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Data can be downloaded from at: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
There is also a full description of the data.



reads the training and the test sets from and returns one data set.
It extracts only the measurements on the mean and standard deviation for 
each measurement. Then it labels the data set with descriptive activity 
names. Finaly, it creates a tidy data set with the average of each variable 
for each activity and each subject.
