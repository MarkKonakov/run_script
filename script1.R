# Create working directory
dir.create("./course_project_1")

# Set working directory
setwd("./course_project_1")

#Download zip file
url <-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile="./household_power_consumption.zip",method="curl")

#Unzip
unzip("household_power_consumption.zip",exdir="./")

#Load data
library(dplyr)
houshold_data <-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F)
names(houshold_data) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houshold_data <-houshold_data[-(1:1),]

#Create subset of data
H_Date <-as.Date(houshold_data$Date,"%d/%m/%Y")
data <-mutate(houshold_data,H_Date)
houshold_data_subset <-filter(data,H_Date>="2007-02-01"&H_Date<="2007-02-02")

#Create histogram
global_active_power <-as.numeric(houshold_data_subset$Global_active_power)
hist(global_active_power,xlab="Global active power(kwt)",col="blue",main="Global active power")

#Create plot1
dev.copy(png,file="plot1.png")
dev.off()





