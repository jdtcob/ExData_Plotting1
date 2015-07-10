# This file, plot2.R, recreates the second plot necessary for project 1 in the course Exploratory Data Analysis

# Create directory, download data
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./data/PowerData.zip")

# Unzip Data
unzip(zipfile="./data/PowerData.zip",exdir="./data")

# Read in data. Via visual inspection we found the number of observations to skip
powerData<-read.table(file.path("data","household_power_consumption.txt"),header=FALSE,sep=";",skip=66637,nrow=2880)

# Read in column names for data
colLabelsDF<-read.table(file.path("data","household_power_consumption.txt"),header=FALSE,sep=";",nrow=1)

# Set column names of data
names(powerData) <- sapply(colLabelsDF,as.character)

# Initialize graphic device, plot data, alter x-axis labels, close graphic device
png(file = "plot2.png", width = 480, height = 480)
plot(1:nrow(powerData),powerData$Global_active_power,'l',xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,nrow(powerData)/2,nrow(powerData)),labels=c("Thu","Fri","Sat"))
dev.off()
