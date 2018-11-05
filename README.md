# Coursera Course Project - Getting and Cleaning Data

This repository contains the results of the peer-graded assignment "Getting and Cleaning Data Course Project".

## Contents of the repository

This repository contains the following files:

 - `README.md` this readme file
 - `CodeBook.md` is the code book that describes the variables, the data, and the transformations to clean up the raw data
 - `data.zip` contains the raw data
 - `run_analysis.R` is the R-script that performs several steps to convert the raw data into a tidy data set (details are specified below)
 - `tidy_data.txt` is kept out of version control, but will be created as a result of running `run_analysis.R`

## Running the analysis

The R-script `run_analysis.R` performs the following steps:

 - The file `data.zip` (containing the raw data) is unzipped
 - The features are loaded (using the `read_delim()`)
 - The training and test data sets are loaded (using the `read_fwf()`) and merged to create one data set (with `bind_rows()`)
 - The measurements on the mean and standard deviation for each measurement are extracted from the data set (using `select()` and `contains()`)
 - The subjects are loaded (using `read_csv()`) and added to the data set (with `mutate()`)
 - The activities are loaded (using `read_csv()`), joined with activity labels (using `left_join()`) and then the activity labels are added to the data set (with `mutate()`)
 - The column order is changed so that the `subject` and `activity` columns are put first (using `select()`)
 - The column names are made more descriptive (using `sub()`, `gsub()`, and `tolower()`)
 - A second, independent tidy data set is created with the average (`mean()`) of each variable for each combination of activity and subject (using `group_by()` and `summarize_all()`)
 - Lastly, the data set of the previous step is stored in a file called `tidy_data.txt` (using `write.table()`)

## Requirements

The script uses the R-packes readr, dplyr, and tidyr. It is assumed that these
are installed already on the system. If not, please run this command to install them:
`install.packages(c("readr", "dplyr", "tidyr"))`.
