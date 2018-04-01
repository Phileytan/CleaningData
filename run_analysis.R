getandclean <- function() { 

####  Download the files form the web
        adresseURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(adresseURL, destfile = "./Dataset.zip")
        dateDownloaded<-date()

#### Read the tables
        X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
        subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

        X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
        subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

        activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
        features<-read.table("./UCI HAR Dataset/features.txt")

#### 1- Merges the training and the test sets 
        y<-rbind(y_test,y_train)
        X<-rbind(X_test,X_train)
        subject<-rbind(subject_test,subject_train)

#### 2- Extracts only the measurements on the mean and standard deviation for each measurement.
        names(X)<-tolower(features[,2])
        selection<-grep("mean|std", features$V2) 
        Xmeanstd<- X[,selection]
        
#### 3- Uses descriptive activity names to name the activities in the data set       
        firstlevel=min(activity_labels$V1)
        lastlevel=max(activity_labels$V1)
        y$V1 <- factor(y$V1,
                            levels = c(firstlevel:lastlevel),
                            labels = c(as.character(activity_labels$V2)))
    
#### 4- Appropriately labels the data set with descriptive variable names.
        ## Add literral names (Xmeanstd already changed before for selection)
        names(subject)<-"numsubject"
        names(y)<-"activity"
        
        ## Subject is more a factor than an integer
        subject$numsubject<-as.factor(subject$numsubject)        
        
        #### tidy vairables names, without : "-" and "()" 
        names(Xmeanstd)=gsub("-","",names(Xmeanstd))
        names(Xmeanstd)=gsub("\\()","",names(Xmeanstd))

        #### Final merge in one unique table set of tidy data      
        data<-cbind(subject, y, Xmeanstd)    
        
        
#### 5- From the data set in step 4, creates a second, independent tidy data 
####    set with the average of each variable for each activity and each subject.
        meandata<-aggregate(data[ ,3:ncol(data)], by=data[ , 1:2], mean)

        write.table(meandata,file = "./meandata.txt", row.name=FALSE)
}








