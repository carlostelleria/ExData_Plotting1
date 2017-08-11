# plot3 3

# get data from file
data <- read.csv("household_power_consumption.txt", dec=".", sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings=c("?") )

# filter data to 1/2/2007 and 2/2/2007
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data4 <- data.frame(second = as.numeric(strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")), sub1 = data2$Sub_metering_1, sub2 = data2$Sub_metering_2, sub3 = data2$Sub_metering_3)

plot(data4$second,data4$sub1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")

lines(data4$second,data4$sub2, col="red")
lines(data4$second,data4$sub3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

maxv <- max(data3$second)
minv <- min(data3$second)
medv <- (minv + maxv) / 2
axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, file="plot3.png")
dev.off(4)
