#Load data
library(dplyr)
houshold_data <-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F)
names(houshold_data) <-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houshold_data <-houshold_data[-(1:1),]
H_Date <-as.Date(houshold_data$Date,"%d/%m/%Y")


#Create subset of data
data <-mutate(houshold_data,H_Date)
houshold_data_subset <-filter(data,H_Date>="2007-02-01"&H_Date<="2007-02-02")

#Create plot3
H_Time <-paste(houshold_data_subset$H_Date,houshold_data_subset$Time)
plot_time <-strptime(H_Time,format="%Y-%m-%d %H:%M:%S")
global_active_power <-as.numeric(houshold_data_subset$Global_active_power)
global_reactive_power <-as.numeric(houshold_data_subset$Global_reactive_power)
voltage <-as.numeric(houshold_data_subset$Voltage)
sub_metering_1 <-as.numeric(houshold_data_subset$Sub_metering_1)
sub_metering_2 <-as.numeric(houshold_data_subset$Sub_metering_2)
sub_metering_3 <-as.numeric(houshold_data_subset$Sub_metering_3)
par(mfrow=c(2,2))
par(mar=c(3,3,3,3))
plot(plot_time,global_active_power,type="l",col="red",xlab="",ylab="Global active power",main="")
plot(plot_time,voltage,type="l",col="black",xlab="",ylab="Voltage",main="")
plot(plot_time,global_reactive_power,type="l",col="orange",xlab="",ylab="Global reactive power",main="")
plot(plot_time,sub_metering_1, type="n", ylab="Energy sub metering",xlab="")
points(plot_time,sub_metering_1, type="l", col="green")
points(plot_time,sub_metering_2, type="l", col="red")
points(plot_time,sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("green","red","blue"),lty = 1)
dev.copy(png,file="plot4.png")
dev.off()