## This script plots the global Active Power for 01/02/2007 and 02/02/2007
## Plot is saved in plot2.png


# Read data
data<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter and shape
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data<-cbind(datetime,data)

##Plot in png
png('plot2.png',width = 480, height = 480)

with(data, plot(datetime,Global_active_power,type="l",ylab="Global active power (kilowatts)", xlab=""))

dev.off()