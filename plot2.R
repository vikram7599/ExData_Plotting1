houseData <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";" , stringsAsFactors = FALSE, dec = ".")
smallData <- houseData[houseData$Date %in% c("1/2/2007" , "2/2/2007"), ]

datetime <- strptime(paste(smallData$Date , smallData$Time , sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(smallData$Global_active_power , na.rm = TRUE)

plot(datetime , globalActivePower , type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)")

dev.copy(png , file = "plot2.png", width = 480, height = 480)
dev.off()