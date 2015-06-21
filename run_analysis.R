#get the test data, and cbind with subject and labels
setwd("~/Documents/UCI HAR Dataset/test")
getwd()
Testsubject <- read.table("subject_test.txt")
Testlabels <- read.table("y_test.txt")
TestX <- read.table("X_test.txt")
dim(Testsubject)
dim(TestX)
Test <- cbind(Testsubject, Testlabels, TestX)
dim(Test)

#get training data, and cbind with subject and labels
setwd("~/Documents/UCI HAR Dataset/train")
getwd()
Trainsubject <- read.table("subject_train.txt")
Trainlabels <- read.table("y_train.txt")
TrainX <- read.table("X_train.txt")
dim(Trainsubject)
dim(TrainX)
Train <- cbind(Trainsubject,Trainlabels,TrainX)
dim(Train)

#merge training data and test data
dat <- rbind(Test, Train)
dim(dat)

#extract measuements on mean and std
setwd("~/Documents/UCI HAR Dataset")
features <- read.table("features.txt")
features <- features[,2]
features <- as.character(features)
colnames(dat)[-c(1,2)] <- features
names(dat)

dim(dat[,grep("std\\(\\)|mean\\(\\)",names(dat))])
data<-cbind(dat[,c(1,2)],dat[,grep("std\\(\\)|mean\\(\\)",names(dat))])
dim(data)
colnames(data)[c(1,2)] <- c("Subject","Labels")


#name the activities with descriptive activity names

data$Labels <-replace(data$Labels, data$Labels==1, "Walking")
data$Labels <-replace(data$Labels, data$Labels==2, "Walking_upstairs")
data$Labels <-replace(data$Labels, data$Labels==3, "Walking_downstairs")
data$Labels <-replace(data$Labels, data$Labels==4, "Sitting")
data$Labels <-replace(data$Labels, data$Labels==5, "Standing")
data$Labels <-replace(data$Labels, data$Labels==6, "Laying")
data$Labels


#name variables
names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("-", "", names(data))
names(data) <- gsub("std", "Std", names(data))



#Independent dataset
library(reshape)
Molten <- melt(data, id.vars=c("Subject", "Labels"))
Data <- cast(Labels+variable~Subject, data=Molten, fun=mean)
head(Data)
dim(Data)

write.table(Data, "./Independent Data with Means",row.name=FALSE)
write.table(dat,"./Merged Data", row.name=FALSE)
write.table(data,"./Merged Data with Measurements on Mean and Std",row.name=FALSE)
