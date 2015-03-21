# datasciencecoursera
Data Science Coursera exercise :  Getting and Cleaning Data Project

## Carlos Guardia

## Description

This document contains information about the variables and the transformations performed for the project in the course Getting and Cleaning Data Project

## Data used

The data used in the exercise represent data collected from the accelerometers from the Samsung Galaxy S II smartphone. 

A waist embedded accelerometer and gyroscope was used to capture at a constant rate of 50Hz smartphone use data:
* Triaxial linear acceleration from accelerometer
* estimated body acceleration
* Triaxial angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables.
* Activity label.
* An identifier of the subject who carried out the experiment.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The information is stored in the following files:

*'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.
