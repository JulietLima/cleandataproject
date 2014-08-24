# Human Activity Recognition Using Smartphones Data Set 

## Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

Smartlab - Non Linear Complex Systems Laboratory 

DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 

activityrecognition '@' smartlab.ws 

www.smartlab.ws 

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Variables

1. subject
    * Subject identifier
    * Codes: 1 - 30
2. activity
    * Activity identifier
    * Codes:
        * WALKING
        * WALKING_UPSTAIRS
        * WALKING_DOWNSTAIRS
        * SITTING
        * STANDING
        * LAYING
3. tBodyAccmeanX, tBodyAccmeanY, ..., fBodyBodyGyroJerkMagstd
    * Measurements from accelerometer and gyroscope
    * Measurement names that begin with "t" are raw signals
    * Measurement names that begin with "f" indicate that a Fast Fourier Transform (FFT) was applied
    * An "X", "Y" or "Z" at the end of the variable name denotes measurement in the respective axis
    * Variable names with "mean" at the end are averages of the corresponding measurements
    * Variable names with "std" at the end are standard deviations of the corresponding measurements
    * For each subject and activity, the value of a measurement in the tidy dataset is the average of all values of that measurement for that subject and activity.