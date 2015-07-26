#README.md

The run_analysis.R script is used to tidy the Samsung data set available from 
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
The raw data represents data collected from accelerometers from the Samsung Galaxy S 
smartphone while subjects carried out designated activities. The output from the 
run_analysis.R script is a tidy data set that shows the mean or standard deviation of 
each measurement broken down by subject and activity.

More information on the raw data is available at: 
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

##Script dependencies  
run_analysis.R loads the following R packages:  
	*utils  
	*reshape2  
If these are not yet installed, you can access them using the install.packages() command.

##Running the script  
Copy the script file to your working directory.  If the Samsung dataset has already been 
downloaded, you can move its directory into your working directory.  The script will look 
for the directory and download it if not found, so this isn't critical.  To run the script
type the following in the console:

source("run_analysis.R")

Output is a text file named "Samsung_tidy_data_set.txt".

##Script workflow  
A general outline of steps taken in tidying the data set is as follows:
	*remove any lists in the global environment  
	*check for the "UCI HAR Dataset" directory; if absent, download the dataset  
	*uses read.table to read in the:  
		+measures, names of measures  
		+test data  
		+train data  
	*add column names to all tables  
	*combine the test data so each row has the subject, activity, and measures  
	*combine the train data so each row has the subject, activity, and measures  
	*combine the test and train data into one table  
	*use the activity key to get character descriptions of activities  
	*subset the columns to include  
		+subject  
		+activity  
		+columns that contain mean or standard deviation of measurements  
	*reformat column names to more meaningful descriptions  
		+use descriptive names rather than abbreviations  
		+add periods between parameters  
		+remove the bodyBody typo (not included in the features_info list)  
	*melt data and dcast as a wide dataset, averaging all measures for the same 
		subject/activity combination  
	*write data table to a .txt file named "Samsung_tidy_data_set.txt"  

Each row represents one subject/activity combination followed by the mean values of all 
measurement variables (each variable is a mean or standard deviation).