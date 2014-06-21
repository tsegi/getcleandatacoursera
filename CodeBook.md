Code Book 
=======
This is the Code Book that describes `dataset2.txt`, which is produced by the script `run_analysis.R`.

> Please refer to **README.md** for more information on how the script works.

### Source of Data
The source of data is provided at this link:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It represents experimental data collected from accelerometer and gyroscope from the Samsung Galaxy S II smartphone. 

Quoting from the raw data set's `README.txt`:
> The experiments have been carried out with **a group of 30 volunteers** within an age bracket of 19-48 years. **Each person performed six activities** (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) **wearing a smartphone (Samsung Galaxy S II) on the waist**. 

>Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


### Data Transformation
For the purpose of this assignment, we are interested in obtaining the average of each measurement collected for each activity and each subject.

To obtain a tidy data set, the following transformation steps are performed with the script `run_analysis.R`:

 1. Merge data files under `UCI HAR Dataset/test` into a single data frame:
     1. `X_test.txt`: each row represents a set of measurements taken from the accelerometers and gyroscope
     2. `y_test.txt`: each row represents the activity ID that the subject was performing while the corresponding set of measurements were taken
     3. `subject_test.txt`: each row represents the subject who was performing when the corresponding set of measurements were taken.
 2. Repeat step 1 for the data files under `UCI HAR Dataset/training`.
 3. Merge the two data frames produced above into one.
 4. Label each column of the data frame with the measurement names in `UCI HAR Dataset/features.txt`
 
 > After this step, a by-product `dataset1.txt` is produced to satisfy this assignment requirement of the assignment: "Merges the training and the test sets to *create one data set*". 
>
>`dataset1.txt` will *not* be discussed in this code book.

 5. Keep measurements with names containing "mean()" and "std()" only. Drop all other measurements.
 6. Label each row with the full activity name as found in `UCI HAR Dataset/activity_labels.txt`.
 7. Sort the data by subject and activity name.
 8. Melt the data frame and then group it again by subject and activity name to compute the desired average for each measurement.
 9. Output the tidy data set `dataset2.txt`.

### Resulting Data Set
`dataset2.txt` is a tidy, wide data set that satisfies the following principles:

 1. Each variable forms a column
 2. Each observation forms a row
 3. Each table/file stores data about one kind of observation

Since the experiments were carried out with 30 subjects, each performing 6 activities, the resulting tidy data set has 180 rows corresponding to each combination. 

The data set has 68 variables/columns. The first two denote the subject and the activity. The other 66 variables represent the average of a type of measurement for the corresponding subject and activity.

### Variables in the Data Set

Each of variables 3 to 68 represents the averages of the variable for the corresponding subject and activity. Their naming follows the following rules: 

 - "_XYZ" is used to denote 3-axial signals in the X, Y and Z directions
 - Prefix "t" denotes time domain signals
 - Prefix "f" denotes signals obtained after Fast Fourier Transform (FFT) was applied
 - "mean" denotes mean value of the signal
 - "std" denotes standard deviation of the signal

Please refer to the raw data set's `UCI HAR Dataset/features_info.txt` for details of each of the signals.
 
#### List of All Variables
 1. subject: 
 ID corresponding to the 30 subjects who participated in the experiments
 2. activity_name:
 One the the six activities:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
 3. tBodyAcc_mean_X
 4. tBodyAcc_mean_Y
 5. tBodyAcc_mean_Z
 6. tBodyAcc_std_X
 7. tBodyAcc_std_Y
 8. tBodyAcc_std_Z
 9. tGravityAcc_mean_X
 10. tGravityAcc_mean_Y
 11. tGravityAcc_mean_Z
 12. tGravityAcc_std_X
 13. tGravityAcc_std_Y
 14. tGravityAcc_std_Z
 15. tBodyAccJerk_mean_X
 16. tBodyAccJerk_mean_Y
 17. tBodyAccJerk_mean_Z
 18. tBodyAccJerk_std_X
 19. tBodyAccJerk_std_Y
 20. tBodyAccJerk_std_Z
 21. tBodyGyro_mean_X
 22. tBodyGyro_mean_Y
 23. tBodyGyro_mean_Z
 24. tBodyGyro_std_X
 25. tBodyGyro_std_Y
 26. tBodyGyro_std_Z
 27. tBodyGyroJerk_mean_X
 28. tBodyGyroJerk_mean_Y
 29. tBodyGyroJerk_mean_Z
 30. tBodyGyroJerk_std_X
 31. tBodyGyroJerk_std_Y
 32. tBodyGyroJerk_std_Z
 33. tBodyAccMag_mean
 34. tBodyAccMag_std
 35. tGravityAccMag_mean
 36. tGravityAccMag_std
 37. tBodyAccJerkMag_mean
 38. tBodyAccJerkMag_std
 39. tBodyGyroMag_mean
 40. tBodyGyroMag_std
 41. tBodyGyroJerkMag_mean
 42. tBodyGyroJerkMag_std
 43. fBodyAcc_mean_X
 44. fBodyAcc_mean_Y
 45. fBodyAcc_mean_Z
 46. fBodyAcc_std_X
 47. fBodyAcc_std_Y
 48. fBodyAcc_std_Z
 49. fBodyAccJerk_mean_X
 50. fBodyAccJerk_mean_Y
 51. fBodyAccJerk_mean_Z
 52. fBodyAccJerk_std_X
 53. fBodyAccJerk_std_Y
 54. fBodyAccJerk_std_Z
 55. fBodyGyro_mean_X
 56. fBodyGyro_mean_Y
 57. fBodyGyro_mean_Z
 58. fBodyGyro_std_X
 59. fBodyGyro_std_Y
 60. fBodyGyro_std_Z
 61. fBodyAccMag_mean
 62. fBodyAccMag_std
 63. fBodyBodyAccJerkMag_mean
 64. fBodyBodyAccJerkMag_std
 65. fBodyBodyGyroMag_mean
 66. fBodyBodyGyroMag_std
 67. fBodyBodyGyroJerkMag_mean
 68. fBodyBodyGyroJerkMag_std 