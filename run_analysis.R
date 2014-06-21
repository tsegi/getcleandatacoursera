## main method to prepare tidy data.
## If running on a Mac, you may need to pass downloadMethod = "curl" to get this script to run properly
run_analysis <- function(rawData = "samsungdata.zip", downloadMethod = "auto") {

  ## load needed library
  install.packages("plyr")
  library(plyr)
  
  #### Step 1: Merges the training and the test sets to create one data set.  
  # make sure raw data is present
  prepare_raw_data(rawData, downloadMethod)  
  # read data from training and test data sets, then merge them
  data <- rbind(prepare_data_set("train"), prepare_data_set("test"))  
  # output the merged data set as the 1st data set required by the assignment
  write.table(data, "dataset1.txt")  
  #### Step 1 completes
  
  
  #### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  # grep the column names that contain "mean()" and "std()"
  filter <- grepl("mean\\(\\)|std\\(\\)",names(data))
  # preserve the "subject" and "activity" columns which are the first two columns in the data frame
  filter[1] <- TRUE
  filter[2] <- TRUE
  data2 <- data[,names(data)[filter]]
  #### Step 2 completes
  
  
  #### Step 3: Uses descriptive activity names to name the activities in the data set
  # join activity ids with activity names
  actname <- read.table("./UCI HAR Dataset/activity_labels.txt")
  names(actname) <- c("activity_id", "activity_name")
  data2 <- merge(data2, actname)
  # drop activity_id and reorder the columns
  filter <- grepl('activity|subject',names(data2))
  measureCols <- names(data2[,!filter])
  allCols <- c("subject", "activity_name", measureCols)
  data2 <- data2[,allCols]
  # sort by subject and activity_name
  data2 <- arrange(data2, subject, activity_name)
  #### Step 3 completes
  
  #### Step 4: Appropriately labels the data set with descriptive variable names. 
  # Already did so in prepare_data_set()
  #### Step 4 completes
  
  #### Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  data2melt <- melt(data2, id = c("subject", "activity_name"), measure.vars = measureCols)
  data3 <- dcast(data2melt, subject + activity_name ~ variable, mean)
  write.table(data3, "dataset2.txt")  
  #### Step 5 completes
  
}


## If the data zip is not already downloaded, download it from the web and also unzip it
prepare_raw_data <- function(rawData = "samsungdata.zip", downloadMethod = "auto") {
  if (!file.exists(rawData)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, rawData, method = downloadMethod)
  }
  unzip(rawData)
}


## read data from each data set ("train" or "test") and merge into one data frame
prepare_data_set <- function(dataset) {
  colname <- read.table("./UCI HAR Dataset/features.txt")
  x <- read.table(paste("./UCI HAR Dataset/", dataset, "/X_", dataset, ".txt", sep = ""))
  y <- read.table(paste("./UCI HAR Dataset/", dataset, "/Y_", dataset, ".txt", sep = ""))
  sub <- read.table(paste("./UCI HAR Dataset/", dataset, "/subject_", dataset, ".txt", sep = ""))
  # name the columns for easier reading
  names(x) <- colname[,2]
  names(y) <- "activity_id"
  names(sub) <- "subject"  
  cbind(sub, y, x)
}