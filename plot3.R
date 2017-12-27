  rm(list=ls())
  runData <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007", select=c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  png("plot3.png", width=400, height=400)
  
  plot(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_1, type="l", col="black",       xlab="", ylab="Energy sub metering")
 lines(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_2, col="red")
 lines(as.POSIXct(strptime(paste(runData$Date, runData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), runData$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
  
  dev.off()
  rm(list=ls())