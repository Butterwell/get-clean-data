get-clean-data
==============

An example of tidy data. See: http://vita.had.co.nz/papers/tidy-data.pdf

Files of note:

**README.md** : This file.

**run_analysis.R** : R program file. run_analysis need the following input files to run:  
train/X_train.txt  
train/y_train.txt  
train/subject_train.txt  
test/X_test.txt  
test/y_test.txt  
test/subject_test.txt  
activity_labels.txt  
features.txt  

These files can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
That data was origanally obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
run_analysis reads these files from the current directory and outputs the file harus.txt  
run_analysis.R reads in the training and test data and merges it, creates means of all the measurements that are means and standard deviations, uses (essentially) the same labels as the raw dataset with ".mean" added to the end.  


**harus.txt** : Output from run_analysis.R A data summary of the raw-er files above. Writen by the command:  `table.write(tidy,"harus.txt", row.names=FALSE)` Use table.read to load. See CodeBook.md for field descriptions.

**CodeBook.md** : A markdown file that contains descriptions of the columns in harus.txt

