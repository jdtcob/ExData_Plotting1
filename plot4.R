# This file, plot4.R, recreates the fourth plot necessary for project 1 in the course Exploratory Data Analysis

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

# Initialize graphic device,
png(file = "plot4.png", width = 480, height = 480)

# Create multiple base plot structure (2 x 2)
par(mfrow = c(2,2))

# Plot data, first row, first column of base plot structure
plot(1:nrow(powerData),powerData$Global_active_power,'l',xaxt='n',xlab="",ylab="Global Active Power")
axis(1,at=c(1,nrow(powerData)/2,nrow(powerData)),labels=c("Thu","Fri","Sat"))

# Plot data, first row, second column of base plot structure
plot(1:nrow(powerData),powerData$Voltage,'l',xaxt='n',xlab="datetime",ylab="Voltage")
axis(1,at=c(1,nrow(powerData)/2,nrow(powerData)),labels=c("Thu","Fri","Sat"))

# Plot data, second row, first column of base plot structure
plot(1:nrow(powerData),powerData$Sub_metering_1,'l',xaxt='n',xlab="",ylab="Energy sub metering",col="black")
lines(1:nrow(powerData),powerData$Sub_metering_2,'l',col="red")   #add variable
lines(1:nrow(powerData),powerData$Sub_metering_3,'l',col="blue")  #add variable
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=c(1,nrow(powerData)/2,nrow(powerData)),labels=c("Thu","Fri","Sat"))

# Plot data, second row, second column of base plot structure
plot(1:nrow(powerData),powerData$Global_reactive_power,'l',xaxt='n',xlab="datetime",ylab="Global_reactive_power")
axis(1,at=c(1,nrow(powerData)/2,nrow(powerData)),labels=c("Thu","Fri","Sat"))

# Close graphic device
dev.off()