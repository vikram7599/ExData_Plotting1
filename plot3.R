houseData <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";" , stringsAsFactors = FALSE, dec = ".")
smallData <- houseData[houseData$Date %in% c("1/2/2007" , "2/2/2007"), ]

datetime <- strptime(paste(smallData$Date , smallData$Time , sep = " "), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(1,1))
subMeter1 <- as.numeric(smallData$Sub_metering_1 , na.rm = TRUE)
subMeter2 <- as.numeric(smallData$Sub_metering_2 , na.rm = TRUE)
subMeter3 <- as.numeric(smallData$Sub_metering_3 , na.rm = TRUE)
plot(datetime , subMeter1 , type = "l", xlab = "" , ylab = "Energy sub metering")
lines(datetime , subMeter2 , type= "l" , col = "red")
lines(datetime , subMeter3 , type= "l" , col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1 , lwd = 2.5,
       legend = c("Sub_Metering_1", "Sub_Metering_2" , "Sub_Metering_3"))

dev.copy(png , file = "plot3.png", width = 480, height = 480)
dev.off()