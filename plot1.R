# plot 1

# get data from file
data <- read.csv("household_power_consumption.txt", dec=".", sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings=c("?") )

# filter data to 1/2/2007 and 2/2/2007
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

hist(data2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off(4)
