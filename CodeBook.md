# "Code Book"

date: "December 26, 2015"


In this file we explain how the script *run_analysis.R* works. We also describe the data used by *run_analysis.R*.

## The data set

The data comes from an experiment where 30 subjects within the ages 19-48 were asked to perform six physical activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a Samsung Galaxy S smartphone on their waist. Using its built-in accelerometer and gyroscope, the smartphone recorded data on the 3-axial linear acceleration and 3-axial angular velocity of each subject while performing the different activities. The experiment was video recorded in order to manually lablel the activitiy data. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The file  *UCI HAR Dataset* contains all the data as described above. The file also contains a README document which describes the contents of the *UCI HAR Dataset* file and a document called *features_info* which describes the data which was recorded by the smartphone (the features). The complete list of the features names can be found in *features.txt*.

A full description of the data can be found at [the website where the data was obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

A link for the data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

## The script

**NOTE:** In order to run the script, please make sure you have the following packages installed: plyr, dplyr, utils, reshape2. 

The script run_analysis.R does the following:

1. The packages used in the scripts are loaded.
2. The data is downloaded to the directory and the unzipped to the directory.
3. The directory is set to the file *UCI HAR Dataset* and the data is loaded into R. The following object are created:

  + subject.train - Train subjects 'id' numbers 
  + subject.test - Test subjects 'id' numbers
  + train.mat - Feature data for train subjects 
  + test.mat - Feature data for test subjects 
  + train.labels - Activity numbers for train subjects 
  + test.labels - Activity numbers for test subjects 
  + features - Feature names 
  + activity.labels - Labels for the different activities 

4. Next, the data is merged. First, we separately merge the subject 'id', activity numbers and the measured data for the test subjects and the train subjects. We then conbine the test data and the train data into one data set called *combined.data*. Finally, we switch the activity nubers to the acitivity labels.
5. A new data set called *extracted.data* is created. This data set contains the subject 'id's, the activities and all features which are on the mean or standard devision of the other features. This is done by selecting the features which either have the string 'mean' or 'std' in them.
6. Finally another inpendent tidy data set, called *means.data* is created from the latter data set, which describes the mean of each variable for each activity, subject and variable.
