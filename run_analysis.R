#remove lists in global environment
rm(list=ls())

#check for directory, if not present, download and unzip data set in directory "UCI HAR Dataset"
library(utils)
if("UCI HAR Dataset"%in% dir() == FALSE){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
    download.file(fileUrl, destfile = "UCI_HAR_Dataset.zip", method = "curl") #method not necessary in Windows
    unzip("UCI_HAR_Dataset.zip")
}

#read in measures file, get names
measures <- read.table("UCI HAR Dataset/features.txt")
measures_names <- measures$V2

#read in test data
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_measures <- read.table("./UCI HAR Dataset/test/X_test.txt")

#read in train data
train_subject <- read.table("./UCI HAR Dataset/train//subject_train.txt")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_measures <- read.table("./UCI HAR Dataset/train/X_train.txt")

#add appropriate column names to each table
colnames(test_subject)<- "subject"
colnames(train_subject)<- "subject"
colnames(test_activity)<- "act"
colnames(train_activity)<- "act"
colnames(test_measures)<- measures_names
colnames(train_measures)<- measures_names

#combine test data
test_all <- cbind(test_subject, test_activity, test_measures)

#combine train data
train_all <- cbind(train_subject, train_activity, train_measures)

#combine test and train data
all_data <- rbind(test_all, train_all)

#rename activity variable with descriptive name
activity_key<- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_key)<- c("act_number", "activity")
all_data_merge <- merge(all_data, activity_key, by.x = "act", by.y = "act_number")

#subset the subject, activity, and means/std deviations, then combine
subj_act_subset <- all_data_merge[,c("subject", "activity")]
mean_subset <- all_data_merge[, grep( "mean\\(\\)" , names(all_data_merge))]
stdev_subset <- all_data_merge[, grep( "std" , names(all_data_merge))]
mean_std_data <- cbind(subj_act_subset, mean_subset, stdev_subset)

#reformat column names
names<- names(mean_std_data)
for(i in 1:length(names(mean_std_data)))
{
    names[i] <- gsub("Freq", ".frequency", names[i])
    names[i] <- gsub("fB", "frequency.b", names[i])
    names[i] <- gsub("tB", "time.b", names[i])
    names[i] <- gsub("Body", "", names[i])
    names[i] <- gsub("tA", "time.a", names[i])
    names[i] <- gsub("tG", "time.g", names[i])
    names[i] <- gsub("Acc", ".acceleration.", names[i])
    names[i] <- gsub("Gyro", ".gyrometer.", names[i])
    names[i] <- gsub("Mag", ".magnitude.", names[i])
    names[i] <- gsub("std", ".stddev", names[i])
    names[i] <- gsub("Jerk", "jerk.", names[i])
    names[i] <- gsub("X", ".X", names[i])
    names[i] <- gsub("Y", ".Y", names[i])
    names[i] <- gsub("Z", ".Z", names[i])
    names[i] <- gsub("\\-", "", names[i])
    names[i] <- gsub("\\(\\)", "", names[i])
    names[i] <- gsub("\\.\\.", ".", names[i])
}
colnames(mean_std_data)<- names

#melt data with reshape2
library(reshape2)
data_reshape <- melt(mean_std_data, id= c("subject", "activity"), measure= colnames(mean_std_data[,3:68]))
data_short <- dcast(data_reshape, subject + activity ~ variable, mean)

#write tidy data to a .txt file
write.table(data_short, file = "Samsung_tidy_data_set.txt", row.name=FALSE)
