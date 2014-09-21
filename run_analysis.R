## run_analysis.R

library(dplyr)
library(tidyr)

## Read the training and test data sets
#X_train<-read.table("train/X_train.txt")
#y_train<-read.table("train/y_train.txt")
#subject_train<-read.table("train/subject_train.txt")
#X_test<-read.table("test/X_test.txt")
#y_test<-read.table("test/y_test.txt")
#subject_test<-read.table("test/subject_test.txt")

## 1. Merge the training and the test data sets
X<-rbind(X_test,X_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)

## 2. Extract the mean and standard deviation for each measurement.

##  Load the names to find the std and mean entries
features<-read.table("features.txt")[[2]]

##  Make an index for std and mean entries
keeper_indexes<-grep("(mean|std)\\(\\)",features, value=FALSE)
##  Keep just those columns
X<-X[keeper_indexes]

## 3. Make the activity names descriptive
keeper_labels<-grep("(mean|std)\\(\\)",features, value=TRUE)
keeper_labels<-gsub("\\(\\)","",keeper_labels)
names(X)<-make.names(keeper_labels)

## 4. Make variable names descriptive
##  by turning integers into factors
activities<-read.table("activity_labels.txt")
factor_levels=activities[[1]]
factor_labels=activities[[2]]
activities<-factor(y[[1]], levels=factor_levels, labels=factor_labels)

## 5. Create tidy data set with the average of each variable
##     for each activity and each subject

tidy<-aggregate(X, by=list(activities,subject[[1]]), FUN=mean, na.rm=TRUE)
names(tidy)[[1]]<-"activity"
names(tidy)[[2]]<-"subject"
# The new table is the means of the means and standard deviations
names(tidy)[3:ncol(tidy)]<-gsub("$",".mean",names(tidy)[3:ncol(tidy)])

write.table(tidy, "harus.txt", row.names=FALSE)
