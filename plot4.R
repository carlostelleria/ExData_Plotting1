# plot 4

# get data from file
data <- read.csv("household_power_consumption.txt", dec=".", sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings=c("?") )

# filter data to 1/2/2007 and 2/2/2007
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")


# prepare data
data3 <- data.frame(second = as.numeric(strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")), power = data2$Global_active_power, sub1 = data2$Sub_metering_1, sub2 = data2$Sub_metering_2, sub3 = data2$Sub_metering_3, volt=data2$Voltage, react=data2$Global_reactive_power)

maxv <- max(data3$second)
minv <- min(data3$second)
medv <- (minv + maxv) / 2

par(mfrow=c(2,2))

#first plot
plot(data3$second,data3$power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

#second plot
plot(data3$second,data3$volt, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

#third plot
plot(data3$second,data3$sub1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(data3$second,data3$sub2, col="red")
lines(data3$second,data3$sub3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, y.intersp=0.5, bty="n")
axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

#fourth plot
plot(data3$second,data3$react, type="l", ylab="Global reactive poser", xlab="datetime", xaxt="n")
axis(side=1, at=c(minv, medv, maxv), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, file="plot4.png")
dev.off(4)
