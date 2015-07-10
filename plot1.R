# This file, plot1.R, recreates the first plot necessary for project 1 in the course Exploratory Data Analysis

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

# Initialize graphic device, plot data, close graphic device
png(file = "plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
