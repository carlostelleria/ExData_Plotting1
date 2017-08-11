# program 2

# get data from file
data <- read.csv("household_power_consumption.txt", dec=".", sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings=c("?") )

# filter data to 1/2/2007 and 2/2/2007
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data3 <- data.frame(second = as.numeric(strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")), power = data2$Global_active_power)

maxv <- max(data3$second)
minv <- min(data3$second)
medv <- (minv + maxv) / 2

plot(data3$second,data3$power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")


axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, file="plot2.png")
dev.off(4)
