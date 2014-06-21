README: How the Script Works
====================
This script operates in the default working directory. It comprises of 3 functions as described below.

### run_analysis
#### Usage
`run_analysis(rawData = "samsungdata.zip", downloadMethod = "auto")`

#### Arguments
*rawData*:
File name of [the zipped raw data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). Default is "samsungdata.zip".

*downloadMethod*:
Method to use to download the zipped raw data set used for this assignment. On Windows, "auto" can be used to download. It worked for me. If you are running on Mac, you can try "curl" as mentioned in the lecture for downloading files. I do not have a Mac so I could not test it out. Default is "auto".

#### Details
**This is the main function that you should call.** It will do the following few things:

 1. Install and load the `plyr` package
 2. Download the raw data set if the zipped raw data set is not already present.
 3. Unzip the raw data set to the current working directory
 4. Perform the following steps as required by the assignment:
     1. Merges the training and the test sets to create one data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
     3. Uses descriptive activity names to name the activities in the data set.
     4. Appropriately labels the data set with descriptive variable names. 
     5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 5. Output two resulting data sets:
     1. `dataset1.txt`: resulting data set after performing step 4.1 above
     2. `dataset2.txt`: resulting data after performing step 4.5 above. This is also the data set submitted.


> After running the script, you can load the data sets into R for inspection by: 
`dataset1 <- read.table("dataset1.txt")`
`dataset2 <- read.table("dataset2.txt")`

>Please refer to **CodeBook.md** for more information about the variables, the data, and transformations done to obtain `dataset2.txt`.

### prepare_raw_data
#### Usage
`prepare_raw_data(rawData = "samsungdata.zip", downloadMethod = "auto")`
#### Arguments
Same as `run_analysis`
#### Details
Supporting function that `run_analysis` will call to download the zipped raw data set, and unzip it.

**You do not need to call this.**

### prepare_data_set
#### Usage
`prepare_data_set(dataset)`
#### Arguments
*dataset*:
Value should be either "train" or "test". This denotes which data set in the raw data set should be manipulated.
#### Details
Supporting function that `run_analysis` will call to load the corresponding files from the raw data zip, and merge them into one single data frame.

**You do not need to call this.**