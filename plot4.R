
rm(list=ls())
runData <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007", select=c("Global_active_power", "Global_reactive_power", "Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Voltage"))


png("plot4.png")


par(mfrow=c(2,2))

plot(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Voltage, type="l",ylab='Voltage',xlab="datetime")

plot(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="")
lines(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_2,type="l",col='red')
lines(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_3,type="l",col='blue')
legend("topright",cex =0.8,bty = 'n',lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
rm(list=ls())
