library(dplyr)
## Reading the dataset from file
test = read.table("UCI HAR Dataset/test/X_test.txt")
testlabels = read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest = read.table("UCI HAR Dataset/test/subject_test.txt")


train = read.table("UCI HAR Dataset/train/X_train.txt")
trainlabels = read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain = read.table("UCI HAR Dataset/train/subject_train.txt")

## Combining the dataset

dataset = rbind(cbind(subjecttest, testlabels, test),cbind(subjecttrain, trainlabels, train))


## Renaming the activities

for(i in 1:dim(dataset)[1]){
  if (dataset[i,2] == 1){
    dataset[i,2] = "WALKING"
  }
  else if (dataset[i,2] == 2){
    dataset[i,2] = "WALKING_UPSTAIRS"
  }
  else if (dataset[i,2] == 3){
    dataset[i,2] = "WALKING_DOWNSTAIRS"
  }
  else if (dataset[i,2] == 4){
    dataset[i,2] = "SITTING"
  }
  else if (dataset[i,2] == 5){
    dataset[i,2] = "STANDING"
  }
  else if (dataset[i,2] == 6){
    dataset[i,2] = "LAYING"
  }
}




## Creating the column names
cnames = read.table("UCI HAR Dataset/features.txt")
cnames = rbind(cbind(1,"Subjects"), cbind(2, "Labels"), cnames)


for(i in 2:dim(cnames)[1]){
  cnames[i,1] = i
}
colnames(dataset) = cnames[,2]


## Subsetting the required columns
m = grep("\\mean()", cnames[,2])
s = grep("std()", cnames[,2])

sub1 = dataset[,m]
sub2 = dataset[,s]

## Creating the final dataset
finaldataset = cbind(dataset[,1:2],sub1, sub2)
finaldataset = na.omit(finaldataset)
n = names(finaldataset)


## Creating a tidy dataset with the averages grouped by subjects and labels
tidydataset <- finaldataset %>% group_by(Subjects, Labels) %>% 
  summarise(across(n[3:81], mean))
tidydataset



write.table(tidydataset, file="tidydataset.txt", row.name=FALSE)
