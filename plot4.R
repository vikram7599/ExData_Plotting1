houseData <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";" , stringsAsFactors = FALSE, dec = ".")
smallData <- houseData[houseData$Date %in% c("1/2/2007" , "2/2/2007"), ]

datetime <- strptime(paste(smallData$Date , smallData$Time , sep = " "), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

globalActivePower <- as.numeric(smallData$Global_active_power , na.rm = TRUE)

plot(datetime , globalActivePower , type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)")

voltage <- as.numeric(smallData$Voltage , na.rm = TRUE)

plot(datetime, voltage , type = 'l', xlab = "datetime", ylab = "Voltage" )


subMeter1 <- as.numeric(smallData$Sub_metering_1 , na.rm = TRUE)
subMeter2 <- as.numeric(smallData$Sub_metering_2 , na.rm = TRUE)
subMeter3 <- as.numeric(smallData$Sub_metering_3 , na.rm = TRUE)
plot(datetime , subMeter1 , type = "l", xlab = "" , ylab = "Energy sub metering")
lines(datetime , subMeter2 , type= "l" , col = "red")
lines(datetime , subMeter3 , type= "l" , col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

reactivePower <- as.numeric(smallData$Global_reactive_power , na.rm = TRUE)
plot(datetime , reactivePower , type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.copy(png , file = "plot4.png", width = 480, height = 480)
dev.off()