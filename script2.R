
#Load data
library(dplyr)
houshold_data <-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F)
names(houshold_data) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houshold_data <-houshold_data[-(1:1),]
H_Date <-as.Date(houshold_data$Date,"%d/%m/%Y")


#Create subset of data
data <-mutate(houshold_data,H_Date)
houshold_data_subset <-filter(data,H_Date>="2007-02-01"&H_Date<="2007-02-02")

#Create plot2
H_Time <-paste(houshold_data_subset$H_Date,houshold_data_subset$Time)
plot_time <-strptime(H_Time,format="%Y-%m-%d %H:%M:%S")
global_active_power <-as.numeric(houshold_data_subset$Global_active_power)
plot(plot_time,global_active_power,type="l",col="red",xlab="",ylab="Global active power(kwt)",main="")
dev.copy(png,file="plot2.png")
dev.off()