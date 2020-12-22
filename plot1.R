# Open file, format date, select data between 01/02/2007 and 02/02/2007

filename <- "household_power_consumption.txt"
x <- read.table(filename, sep=";", header=TRUE, nrows=100000, na.strings="?")
x$Date <- as.Date(x$Date,"%d/%m/%Y")
x$Date <- format(x$Date, "%d/%m/%Y")
x <- subset(x, Date=="01/02/2007" | Date == "02/02/2007")
x$Global_active_power <- as.numeric(x$Global_active_power)

# Produce the plot
hist(x$Global_active_power,
	xlab="Global Active Power (kilowatts)",
	ylab="Frequency",
	main = "Global Active Power",
	col='red')
dev.copy(png, "plot1.png")
dev.off()

