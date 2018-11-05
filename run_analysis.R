library(readr)
library(dplyr)
library(tidyr)

# Unzip data file
unzip("data.zip")

# Load features
features <- read_delim("UCI HAR Dataset/features.txt", delim = " ", col_names = c("feature_id", "feature_name"), col_types = "ic")
num_features <- nrow(features)

# Load training set and test set
col_positions = fwf_widths(rep(16, num_features), col_names = features$feature_name)
col_types <- paste(rep("n", num_features), collapse = "")
train <- read_fwf("UCI HAR Dataset/train/X_train.txt", col_positions = col_positions, col_types = col_types)
test <- read_fwf("UCI HAR Dataset/test/X_test.txt", col_positions = col_positions, col_types = col_types)

# Merge the training and the test sets to create one data set
data <- bind_rows(train, test)

# Extract only the measurements on the mean and standard deviation for each measurement
data <- data %>%
    select(contains("mean()"), contains("std()"))

# Load subjects
subject_train <- read_csv("UCI HAR Dataset/train/subject_train.txt", col_names = "subject_id", col_types = "i")
subject_test <- read_csv("UCI HAR Dataset/test/subject_test.txt", col_names = "subject_id", col_types = "i")
subjects <- bind_rows(subject_train, subject_test)
data <- data %>%
    mutate(subject_id = subjects$subject_id)

# Load activities
activity_train <- read_csv("UCI HAR Dataset/train/y_train.txt", col_names = "activity_id", col_types = "i")
activity_test <- read_csv("UCI HAR Dataset/test/y_test.txt", col_names = "activity_id", col_types = "i")
activities <- bind_rows(activity_train, activity_test)

# Use descriptive activity names to name the activities in the data set
activity_labels <- read_delim("UCI HAR Dataset/activity_labels.txt", delim = " ", col_names = c("activity_id", "activity_name"), col_types = "ic")
activities <- activities %>%
    left_join(activity_labels, by = "activity_id")
data <- data %>%
    mutate(activity = as.factor(activities$activity_name))

# Put subject and activity columns first
data <- data %>%
    select("subject_id", "activity", everything())

# Appropriately label the data set with descriptive variable names
names <- names(data)
names <- sub("^t", "time_", names)
names <- sub("^f", "frequency_", names)
names <- gsub("-", "_", names)
names <- sub("BodyAcc", "body_acceleration_", names)
names <- sub("GravityAcc", "gravity_acceleration_", names)
names <- gsub("Acc", "_accelerometer", names)
names <- gsub("Gyro", "_gyroscope", names)
names <- gsub("Mag", "_magnitude", names)
names <- sub("std", "standard_deviation", names)
names <- tolower(names)
names <- gsub("[^_0-9A-Za-z]", "", names)
names <- gsub("_+", "_", names)
names(data) <- names

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
data2 <- data %>%
    group_by(subject_id, activity) %>%
    summarize_all(mean)

# Store the tidy data set
write.table(data2, file = "tidy_data.txt", row.names = FALSE)
