CodeBook.md

This document describes details about the data used and the final data that is generated.

#Source

1.Data was downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. The details of the data is mentioned in the Readme.md which is also a part of the same Zip file.


#Processing

1. The X_test.txt, y_test.txt, subject_test.txt were combined. Using cbind() function.
2. The X_train.txt, y_train.txt, subject_train.txt were combined. Using cbind() function.
3. Then #1 & #2 were appended to create a union data set.
4. This data set was 'merged' with the help of the ID column with the features.txt so that the 'activity name' is shown instead of just the ID to make the data more meaning ful.
5. Finally the mean of the columns were calculated by grouping by 'Subjectid' & 'activity'

#Result

1. tidy.csv which is generated when r_analysis.R is run has 180 rows & 81 columns
2. Subjectid: is the disctinct id given to the person participating in the expercise.
3. activityname: is activity for which the measurements were taken.
4. Rest of the columns have the mean of the values that were provided in the original file. Steps to derive this has been explained in the 'Processing' section above.
