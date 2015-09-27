library(dplyr)

#Please read Readme.MD to know how to get the data files.
#load activity file and rename column
activity_labels <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/activity_labels.txt")
names(activity_labels)[1]<-"activityid"
names(activity_labels)[2]<-"activityname"

#load subject file and rename column
subject_test <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/test/subject_test.txt")
names(subject_test)[1]<-"subjectid"

subject_train <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/train/subject_train.txt")
names(subject_train)[1]<-"subjectid"

#load y_test file and rename column
y_test <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/test/y_test.txt")
names(y_test)[1]<-"activityid"

y_train <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/train/y_train.txt")
names(y_train)[1]<-"activityid"


#load X_test file and rename column
X_test <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/test/X_test.txt")

X_train <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/train/X_train.txt")                     

#load features file and rename column
features <- read.table("~/Gautam/Coursera/Data Science Specialization/work_dir/UCI HAR Dataset/features.txt")
#View(features)

X_test <- rbind(X_test,X_train)

# rename column header in X_test as per values in features
names(X_test) <- features$V2[match(names(X_test),features$V2)]
colnames(X_test) <- features[1:ncol(X_test),"V2"]

subject_test <- rbind(subject_test,subject_train)
y_test <- rbind(y_test,y_train)

#paste/cbind 3 files
sub_y_X_test <- cbind(subject_test,y_test,X_test)

#merge show a warning message -- but the object is created just fine.
nnew_merge <- merge(sub_y_X_test,activity_labels, by.x="activityid", by.y="activityid",all="TRUE")

#hack to have subjectid, activityname together in the begining
justview <- cbind(nnew_merge[,c("subjectid","activityname")],nnew_merge[,grepl("mean|std", colnames(nnew_merge))])

#The final thing
tidy_data <- justview %>% group_by(subjectid,activityname) %>% summarise_each(funs(mean))

#uncomment this to view it on Rstudio
#View(tidy_data)

#CSV outbut below is much better
#write.table(tidy_data,row.name = FALSE)

write.csv(tidy_data,"tidy.csv", row.names = FALSE)


