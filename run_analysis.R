# Coursera
# Getting and Cleaning Data
# Peer Assessment Project
#
###
#
# This assignment uses data collected from the accelerometers 
# from the Samsung Galaxy S smartphone. 
# (Data science area of wearable computing)
# A full description of the data used  is available at the: 
# 
#       http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
###
#
# The script merges the training and the test sets and returns one data set.
# It extracts only the measurements on the mean and standard deviation for 
# each measurement. Then it labels the data set with descriptive activity 
# names. Finaly, it creates a tidy data set with the average of each variable 
# for each activity and each subject.
#
###


# Read and merge the training and test sets
x.train <- read.table("train/X_train.txt")
x.test <- read.table("test/X_test.txt")
merged.x <- rbind(x.train, x.test)

y.train <- read.table("train/Y_train.txt")
y.test <- read.table("test/Y_test.txt")
merged.y <- rbind(y.train, y.test)

subject.train <- read.table("train/subject_train.txt")
subject.test <- read.table("test/subject_test.txt")
merged.subject <- rbind(subject.train, subject.test)


# Extract only the measurements on the mean and standard deviation for each 
# measurement
    features <- read.table("features.txt", header=FALSE, 
                           col.names=c("FeaturesID", "FeatureName"))
    
    # Add names to data sets
    names(merged.x) <- features$FeatureName
    names(merged.y) <- "Activity"
    names(merged.subject) <- "Subject"
    
    # Subset only the mean and stdev measurements
    sub.col <- grep(".*mean\\(\\)|.*std\\(\\)", features$FeatureName)
    merged.xsub <- merged.x[, sub.col]


# Crete one data set
merged.data <- cbind(merged.xsub, merged.y, merged.subject)
                         
                                 
# Label the activity names
    activity.lab <- read.table("activity_labels.txt", header=F, col.names=c("Activity", "ActivityName"))
    activity.lab$ActivityName <- as.factor(activity.lab$ActivityName)
    
    # Create data set with labeled activity names
    merged.data.lab <- merge(merged.data, activity.lab)
    merged.data.lab <- merged.data.lab[, -1] # Delete activity class labels
                                             # (first column)


# Create a tidy data set
    
    # Data set reshaping:
    # Average of each variable for each activity and each subject.
    id.colnames <- c("Subject", "ActivityName")
    measure.vars = setdiff(colnames(merged.data.lab), id.colnames)
    melt.data <- melt(merged.data.lab, id=id.colnames, measure.vars=measure.vars)
    data <- dcast(melt.data, ActivityName + Subject ~ variable, mean)  
    
    # Save tidy data set
    write.table(data, "tidy_data.txt")
