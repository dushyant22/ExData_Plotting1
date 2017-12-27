rm(list=ls())
png(filename="plot2.png", width = 480, height = 480) 
runData <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007", select=c("Global_active_power", "Date", "Time"))
with(runData, 
     plot(as.POSIXct(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")), 
          as.numeric(runData$Global_active_power),
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))
dev.off() 
rm(list=ls())