

png(filename="plot1.png", width = 480, height = 480) 
hist(subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date== "1/2/2007" | Date == "2/2/2007")[,"Global_active_power"], col="red", main="Global Active Power.", xlab="Global Active Power (KiloWatts)") 
dev.off()
