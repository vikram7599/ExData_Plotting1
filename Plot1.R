houseData <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";" , stringsAsFactors = FALSE, dec = ".")
smallData <- houseData[houseData$Date %in% c("1/2/2007" , "2/2/2007"), ]
globalActivePower <- as.numeric(smallData$Global_active_power , na.rm = TRUE)
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png , file = "plot1.png", width = 480, height = 480)
dev.off()

