#Project Description
##Study design and data processing
The description is courtesy of the UCI machine learning repository accessed here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency 
domain.

##Collection of the raw data
The description is courtesy of the features_info.txt file included with the dataset 
download.
The features selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove 
noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Notes on the raw data
The data was collected for machine learning, so the subjects were originally split into 
separate training (70%) and testing (30%) sets.  These are combined into the full data 
set by the run_analysis.R script.

#Creating tidy data file
##Guide to creating tidy data file
Run the run_analysis.R script- it will download the data directly from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, 
and process it to output a tidy data text file, "Samsung_tidy_data_set.txt".  
The tidy data contains only the mean and standard deviation of measurements collected
for each of the 30 subjects as they carried out 6 different activities.

##Cleaning of the data 
More detailed information can be found in the README.md associated with the 
run_analysis.R script. Briefly, the train and test data sets were combined, a detailed 
description of activity was added, only mean and standard deviation measures were kept, 
the measurement names were reformatted for clearer descriptions, and the data was 
reconfigured in a wide dataset that shows measures for each combination of subject (1-30)
and activity (6 total).  In the final output, there are 180 subject/activity pairs with 
66 variables that represent the mean and standard deviation of measurements.  
 
##Description of the variables in the tiny.data.txt file
Dimensions: 180 rows x 81 columns
Each row represents a subject and one of six activities they performed, followed by 
the mean or standard deviation (stddev) of each measurement taken.
 
##Variables: 
 [1] "subject": indicates which person was observed 
 		numbered 1-30                                                   
 [2] "activity"indicates the activity perfomed
 		6 possibilites: walking, walking upstairs, walking downstairs, sitting, standing,
 			laying                                                  
 [3] "time.body.acceleration.mean.X": mean of the time domain signal of body acceleration 
 		in the x-axis                            
 [4] "time.body.acceleration.mean.Y": mean of the time domain signal of body acceleration 
 		in the y-axis                            
 [5] "time.body.acceleration.mean.Z": mean of the time domain signal of body acceleration 
 		in the z-axis                            
 [6] "time.gravity.acceleration.mean.X": mean of the time domain signal of gravity 
 		acceleration in the x-axis                         
 [7] "time.gravity.acceleration.mean.Y": mean of the time domain signal of gravity 
 		acceleration in the y-axis                         
 [8] "time.gravity.acceleration.mean.Z": mean of the time domain signal of gravity 
 		acceleration in the z-axis                         
 [9] "time.body.acceleration.jerk.mean.X": mean of the body linear acceleration derived in 
 		time in the x-axis                       
[10] "time.body.acceleration.jerk.mean.Y": mean of the body linear acceleration derived in 
		time in the y-axis                       
[11] "time.body.acceleration.jerk.mean.Z": mean of the body linear acceleration derived in 
		time in the z-axis                       
[12] "time.body.gyrometer.mean.X": mean of the time domain signal of body gyrometer 
		reading in the x-axis                                
[13] "time.body.gyrometer.mean.Y": mean of the time domain signal of body gyrometer 
		reading in the y-axis                                
[14] "time.body.gyrometer.mean.Z": mean of the time domain signal of body gyrometer 
		reading in the z-axis                                
[15] "time.body.gyrometer.jerk.mean.X": mean of the body angular velocity derived in time 
		in the x-axis                           
[16] "time.body.gyrometer.jerk.mean.Y": mean of the body angular velocity derived in time 
		in the y-axis                           
[17] "time.body.gyrometer.jerk.mean.Z": mean of the body angular velocity derived in time 
		in the z-axis                           
[18] "time.body.acceleration.magnitude.mean": mean of the 3-dimensional magnitude of body 
		acceleration                    
[19] "time.gravity.acceleration.magnitude.mean": mean of the 3-dimensional magnitude of 
		gravity acceleration                 
[20] "time.body.acceleration.jerk.magnitude.mean": mean of the 3-dimensional magnitude of 
		body linear acceleration               
[21] "time.body.gyrometer.magnitude.mean": mean of the 3-dimensional magnitude of body 	
		gyrometer reading                        
[22] "time.body.gyrometer.jerk.magnitude.mean": mean of the 3-dimensional magnitude of 
		body angular velocity                   
[23] "frequency.body.acceleration.mean.X": mean of the frequency of body acceleration in 
		the x-axis                       
[24] "frequency.body.acceleration.mean.Y": mean of the frequency of body acceleration in 
		the y-axis                       
[25] "frequency.body.acceleration.mean.Z": mean of the frequency of body acceleration in 	
		the z-axis                       
[26] "frequency.body.acceleration.jerk.mean.X": mean of the frequency of body linear 
		acceleration derived in time in the x-axis                  
[27] "frequency.body.acceleration.jerk.mean.Y": mean of the frequency of body linear 
		acceleration derived in time in the y-axis                  
[28] "frequency.body.acceleration.jerk.mean.Z": mean of the frequency of body linear 
		acceleration derived in time in the z-axis                  
[29] "frequency.body.gyrometer.mean.X": mean of the frequency of body gyrometer reading in 
		the x-axis                           
[30] "frequency.body.gyrometer.mean.Y": mean of the frequency of body gyrometer reading in 
		the y-axis                           
[31] "frequency.body.gyrometer.mean.Z": mean of the frequency of body gyrometer reading in 
		the z-axis                           
[32] "frequency.body.acceleration.magnitude.mean": mean of the 3-dimensional magnitude of 
		the frequency of body acceleration               
[33] "frequency.body.acceleration.jerk.magnitude.mean": mean of the 3-dimensional 
		magnitude of the frequency of body linear acceleration          
[34] "frequency.body.gyrometer.magnitude.mean": mean of the 3-dimensional magnitude of 
		the frequency of body gyrometer reading                   
[35] "frequency.body.gyrometer.jerk.magnitude.mean": mean of the 3-dimensional magnitude 
		of the frequency of body angular velocity              
[36] "time.body.acceleration.stddev.X": standard deviation of the time domain signal of 
		acceleration in the x-axis                          
[37] "time.body.acceleration.stddev.Y": standard deviation of the time domain signal of 
		acceleration in the y-axis                          
[38] "time.body.acceleration.stddev.Z": standard deviation of the time domain signal of 
		acceleration in the z-axis                          
[39] "time.gravity.acceleration.stddev.X": standard deviation of the time domain signal of 
		gravity acceleration in the x-axis                       
[40] "time.gravity.acceleration.stddev.Y": standard deviation of the time domain signal of 
		gravity acceleration in the y-axis                       
[41] "time.gravity.acceleration.stddev.Z": standard deviation of the time domain signal of 	
		gravity acceleration in the z-axis                       
[42] "time.body.acceleration.jerk.stddev.X": standard deviation of the body linear 
		acceleration derived in time in the x-axis                     
[43] "time.body.acceleration.jerk.stddev.Y": standard deviation of the body linear 
		acceleration derived in time in the y-axis                     
[44] "time.body.acceleration.jerk.stddev.Z": standard deviation of the body linear 
		acceleration derived in time in the z-axis                     
[45] "time.body.gyrometer.stddev.X": standard deviation of the time domain signal of body 
		gyrometer reading in the x-axis                              
[46] "time.body.gyrometer.stddev.Y": standard deviation of the time domain signal of body 
		gyrometer reading in the y-axis                              
[47] "time.body.gyrometer.stddev.Z": standard deviation of the time domain signal of body 
		gyrometer reading in the z-axis                              
[48] "time.body.gyrometer.jerk.stddev.X": standard deviation of the body angular velocity 
		derived in time in the x-axis                         
[49] "time.body.gyrometer.jerk.stddev.Y": standard deviation of the body angular velocity 
		derived in time in the y-axis                         
[50] "time.body.gyrometer.jerk.stddev.Z": standard deviation of the body angular velocity 
		derived in time in the z-axis                         
[51] "time.body.acceleration.magnitude.stddev": standard deviation of the 3-dimensional 
		magnitude of body acceleration                  
[52] "time.gravity.acceleration.magnitude.stddev": standard deviation of the 3-dimensional 
		magnitude of gravity acceleration               
[53] "time.body.acceleration.jerk.magnitude.stddev": standard deviation of the 
		3-dimensional magnitude of body linear acceleration             
[54] "time.body.gyrometer.magnitude.stddev": standard deviation of the 3-dimensional 
		magnitude of body gyrometer reading                      
[55] "time.body.gyrometer.jerk.magnitude.stddev": standard deviation of the 3-dimensional 
		magnitude of body angular velocity                 
[56] "frequency.body.acceleration.stddev.X": standard deviation of the frequency of body 
		acceleration in the x-axis                     
[57] "frequency.body.acceleration.stddev.Y": standard deviation of the frequency of body 		
		acceleration in the y-axis                     
[58] "frequency.body.acceleration.stddev.Z": standard deviation of the frequency of body 
		acceleration in the z-axis                     
[59] "frequency.body.acceleration.jerk.stddev.X": standard deviation of the frequency of 
		body linear acceleration derived in time in the x-axis                
[60] "frequency.body.acceleration.jerk.stddev.Y": standard deviation of the frequency of 
		body linear acceleration derived in time in the y-axis                
[61] "frequency.body.acceleration.jerk.stddev.Z": standard deviation of the frequency of 
		body linear acceleration derived in time in the z-axis                
[62] "frequency.body.gyrometer.stddev.X": standard deviation of the frequency of body 
		gyrometer reading in the x-axis                         
[63] "frequency.body.gyrometer.stddev.Y": standard deviation of the frequency of body 
		gyrometer reading in the y-axis                         
[64] "frequency.body.gyrometer.stddev.Z": standard deviation of the frequency of body 
		gyrometer reading in the z-axis                         
[65] "frequency.body.acceleration.magnitude.stddev": standard deviation of the 
		3-dimensional magnitude of the frequency of body acceleration             
[66] "frequency.body.acceleration.jerk.magnitude.stddev": standard deviation of the 
		3-dimensional magnitude of the frequency of body linear acceleration        
[67] "frequency.body.gyrometer.magnitude.stddev": standard deviation of the 3-dimensional 
		magnitude of the frequency of body gyrometer reading                 
[68] "frequency.body.gyrometer.jerk.magnitude.stddev": mean of the 3-dimensional magnitude 
		of the frequency of body angular velocity 