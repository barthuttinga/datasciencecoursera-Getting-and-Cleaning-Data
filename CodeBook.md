# CodeBook

Running `run_analysis.R` takes the raw data from `data.zip` and results in the
creation of a file called `tidy_data.txt`. The training and test data sets were
merged together to create one data set. The data was made tidy as described in
the file `README.md`. This results in a data set with the 68 features listed
below.

## Features

 - subject_id
 - activity
 - time_body_acceleration_mean_x
 - time_body_acceleration_mean_y
 - time_body_acceleration_mean_z
 - time_gravity_acceleration_mean_x
 - time_gravity_acceleration_mean_y
 - time_gravity_acceleration_mean_z
 - time_body_acceleration_jerk_mean_x
 - time_body_acceleration_jerk_mean_y
 - time_body_acceleration_jerk_mean_z
 - time_body_gyroscope_mean_x
 - time_body_gyroscope_mean_y
 - time_body_gyroscope_mean_z
 - time_body_gyroscopejerk_mean_x
 - time_body_gyroscopejerk_mean_y
 - time_body_gyroscopejerk_mean_z
 - time_body_acceleration_magnitude_mean
 - time_gravity_acceleration_magnitude_mean
 - time_body_acceleration_jerk_magnitude_mean
 - time_body_gyroscope_magnitude_mean
 - time_body_gyroscopejerk_magnitude_mean
 - frequency_body_acceleration_mean_x
 - frequency_body_acceleration_mean_y
 - frequency_body_acceleration_mean_z
 - frequency_body_acceleration_jerk_mean_x
 - frequency_body_acceleration_jerk_mean_y
 - frequency_body_acceleration_jerk_mean_z
 - frequency_body_gyroscope_mean_x
 - frequency_body_gyroscope_mean_y
 - frequency_body_gyroscope_mean_z
 - frequency_body_acceleration_magnitude_mean
 - frequency_bodybody_acceleration_jerk_magnitude_mean
 - frequency_bodybody_gyroscope_magnitude_mean
 - frequency_bodybody_gyroscopejerk_magnitude_mean
 - time_body_acceleration_standard_deviation_x
 - time_body_acceleration_standard_deviation_y
 - time_body_acceleration_standard_deviation_z
 - time_gravity_acceleration_standard_deviation_x
 - time_gravity_acceleration_standard_deviation_y
 - time_gravity_acceleration_standard_deviation_z
 - time_body_acceleration_jerk_standard_deviation_x
 - time_body_acceleration_jerk_standard_deviation_y
 - time_body_acceleration_jerk_standard_deviation_z
 - time_body_gyroscope_standard_deviation_x
 - time_body_gyroscope_standard_deviation_y
 - time_body_gyroscope_standard_deviation_z
 - time_body_gyroscopejerk_standard_deviation_x
 - time_body_gyroscopejerk_standard_deviation_y
 - time_body_gyroscopejerk_standard_deviation_z
 - time_body_acceleration_magnitude_standard_deviation
 - time_gravity_acceleration_magnitude_standard_deviation
 - time_body_acceleration_jerk_magnitude_standard_deviation
 - time_body_gyroscope_magnitude_standard_deviation
 - time_body_gyroscopejerk_magnitude_standard_deviation
 - frequency_body_acceleration_standard_deviation_x
 - frequency_body_acceleration_standard_deviation_y
 - frequency_body_acceleration_standard_deviation_z
 - frequency_body_acceleration_jerk_standard_deviation_x
 - frequency_body_acceleration_jerk_standard_deviation_y
 - frequency_body_acceleration_jerk_standard_deviation_z
 - frequency_body_gyroscope_standard_deviation_x
 - frequency_body_gyroscope_standard_deviation_y
 - frequency_body_gyroscope_standard_deviation_z
 - frequency_body_acceleration_magnitude_standard_deviation
 - frequency_bodybody_acceleration_jerk_magnitude_standard_deviation
 - frequency_bodybody_gyroscope_magnitude_standard_deviation
 - frequency_bodybody_gyroscopejerk_magnitude_standard_deviation

## Summarized data

The `tidy_data.txt` contains summarized data, not the original measurements. 
From the raw data only the measurements on the mean and standard deviation
for each measurement were extracted. Then, the data was grouped by `subject_id`
and `activity`, and for each feature the mean of the values within each group
was calculated.

## More information on the raw data

More information on the features, measurements and calculations of the raw data
can be found in the file `features_info.txt` which is included in `data.zip`.
