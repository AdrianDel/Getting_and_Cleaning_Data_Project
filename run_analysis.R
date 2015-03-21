run_analysis <- function() {
    #Function to merge all data from Samsung experement and calculate the mean 
    #of all mean and std veriables split acording to subject and activity
    
    library(reshape2)
    
    #Load all tables
    features <- read.table("./UCI HAR Dataset/features.txt", sep=" ",stringsAsFactors = FALSE)
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ",stringsAsFactors = FALSE)
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep=" ")
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep=" ")
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep=" ")
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep=" ")
    
    #Replace activity numers with names
    activity_labels <- activity_labels$V2
    y_test <- sapply(y_test,function(el) activity_labels[el])
    y_train <- sapply(y_train,function(el) activity_labels[el])
    
    #Combine all tables
    data_test <- cbind(subject_test,y_test,X_test)
    data_train <- cbind(subject_train,y_train,X_train)
    data <- rbind(data_test,data_train)
    
    #Set colomn names
    colnames(data) <- c("Subject","Activity",features$V2)
    
    #Only keep colomns about neab abd std
    colkeep <- grep("(mean|std)\\(\\)",features$V2, value=TRUE)
    data <- data[c("Subject","Activity",colkeep)]
    
    #Calculate averages
    dataMelt <- melt(data, id=c("Subject","Activity"),measure.vars=colkeep)
    dataAverages <- dcast(dataMelt, Subject+Activity~variable,mean)
    
    #Write data to file
    write.table(dataAverages, file="./dataAverages.txt", row.names=FALSE)
    
}