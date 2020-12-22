# Open file, format date, select data between 01/02/2007 and 02/02/2007
library(lubridate)
filename <- "household_power_consumption.txt"
x <- read.table(filename, sep=";", header=TRUE, nrows=100000)
x$Full_Date <- dmy_hms(paste(x$Date,x$Time))
x$Date <- dmy(x$Date)
x$Time <- hms(x$Time)
x <- subset(x, Date=="2007-02-01" | Date == "2007-02-02")
x$Global_active_power <- as.numeric(x$Global_active_power)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)

# Produce the plot
plot(x$Full_Date,
	x$Sub_metering_1,
	ylab="Energy sub metering",
	xlab="",
	type="l",
	col="black",
	lwd=2,
	lty='solid')
points(x$Full_Date,
	x$Sub_metering_2,
	ylab="Energy sub metering",
	xlab="",
	type="l",
	col="red",
	lwd=2,
	lty='solid')
points(x$Full_Date,
	x$Sub_metering_3,
	ylab="Energy sub metering",
	xlab="",
	type="l",
	col="blue",
	lwd=2,
	lty='solid')
legend("topright", legend=names(x)[7:9],col=c('black','red','blue'), lwd=2)
dev.copy(png, "plot3.png",width=600, height=600)
dev.off()

