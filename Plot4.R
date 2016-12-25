## This script plots 4 graphics for 01/02/2007 and 02/02/2007
##     plot-1 : Global active power
##     plot-2 : Voltage
##     plot-1 : sub metering 1,2 & 3
##     plot-1 : Global reactive power
## Plot is saved in plot4.png


# Read data
data<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#Filter and shape
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data<-cbind(datetime,data)

##Plot in png
png('plot4.png',width = 480, height = 480)
par(mfrow=c(2,2))

#Plot-1
with(data, plot(datetime,Global_active_power,type="l",ylab="Global active power (kilowatts)", xlab=""))

#Plot-2
with(data, plot(datetime,Voltage,type="l",ylab="Voltage"))

#Plot-3
with(data, plot(datetime,Sub_metering_1,type="l",ylab="Power sub metering", xlab=""))
with(data,lines(datetime,Sub_metering_2,col="red"))
with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", lty=c(1,1,1), bty="n", col=c("black","red","blue"), legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))

#Plot-4
with(data, plot(datetime,Global_reactive_power,type="l"))

dev.off()