### Code Book
=======

The Data
-------
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The data was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Dataset Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##### Attribute Information:
For each record in the dataset it is provided: 
-	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
-	Triaxial Angular velocity from the gyroscope. 
-	A 561-feature vector with time and frequency domain variables. 
-	Its activity label. 
-	An identifier of the subject who carried out the experiment.

-----

### Data Transformation:
The dataset retrieved from the web was cleaned and transformed using the run_analysis.R script. 
The script: 
* Merges the test and training datasets to create one data set. 
* Extracts only the mean and standard deviation variables. 
* Uses descriptive activity names to name the activities in the data set.
* Labels the data set with descriptive variable names, removes parenthesis and underscores, and converts names to lowercase.
* Creates an independent tidy data set with the average of each variable for each activity and each subject.

-----

### Variables: 
-	x_train – table contents of X_train.txt
-	x_test – table contents of X_test.txt
-	xdata – merged dataset containing x_train and x_test
-	y_train – table contents of y_train.txt
-	y_test – table contents of y_test.txt
-	ydata – merged dataset containing y_train and y_test
-	sub_train – table contents of subject_train.txt
-	sub_test – table contents of subject_test.txt
-	subdata – merged dataset containing sub_train and sub_test
-	feat – table contents of features.txt
-	mean_std – table containing mean and standard deviation values for each measurement
-	activities – table contents of activity_labels.txt
-	cleandata – clean data set containing tidy_data.txt
-	cleandata2 – second tidy dataset containing the average of each variable for each activity and each subject

#### Dataset Variables:
*	Subject
* Activities - walking, walking upstairs, walking downstairs, sitting, standing, laying
* Features - measures, means, standard deviation

-----
### Cleaned Datasets: 

##### tidy_data.txt:
tidy_data is a 10299x68 data frame containing subject IDs, activities (names), and 66 columns of measurement.

##### tidy_data2.txt:
tidy_data is a 180x68 data frame containing subject IDs, activities (names), and 66 columns of standard deviation and mean measurements.
