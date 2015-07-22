This project contains a script that modifies the data here: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The output is a tidy data set described below. 

## run_analysis.R
This is a script which starts with the folder from the above link and produces the data frame "tidyData". The script assumes that the "UCI HAR Dataset" folder is in your working directory. 

The script then merges the test and training data, including the quantitative observations along with subject number and activity. The activity is initially represented as a factor (1-6), and this is changed to a string describing the activity. The data frame is also given descriptive column names from the "features.txt" file. Finally, only the data considering the mean or standard deviation is considered, by searching through features with the strings "mean()" or "std()". Only direct means are considered (for example, meanFreq() would not count). 

There are 30 subjects and 6 activities, for a total of 180 different subject/activity combinations. In the final "tidyData" DataFrame, each row represents one of these subject/activity pairs, which can be seen in the first two columns of "Subject" and "Response". The other columns contain a variable name, and the value is the mean of that variable over all tests with that subject/activity pair. 

## code_book.txt

This file describes the different variables that are considered in the output file "tidyData". The file contains details about hte meaning and significance of these features. 


