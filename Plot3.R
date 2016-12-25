## This script plots the sub meterings 1,2 and 3 for 01/02/2007 and 02/02/2007
## Plot is saved in plot3.png


# Read data
unzip("household_power_consumption.zip")
data<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter and shape
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data<-cbind(datetime,data)

##Plot in png
png('plot3.png',width = 480, height = 480)

with(data, plot(datetime,Sub_metering_1,type="l",ylab="Power sub metering", xlab=""))
with(data,lines(datetime,Sub_metering_2,col="red"))
with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))

dev.off()