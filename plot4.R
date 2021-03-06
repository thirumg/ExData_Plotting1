d <- read.table('household_power_consumption.txt', sep = ";", skip = 66636, header = F, na.strings = c("?"), nrows = 2881, stringsAsFactors = F)
h <- read.table('household_power_consumption.txt', sep = ";", header = T, na.strings = c("?"), nrows = 1)
names(d) <- names(h)
d$dt <- strptime(do.call(paste, d[c(1, 2)]), "%d/%m/%Y %H:%M:%S")
png(file = "plot4.png", height = 480, width = 480) 
par(mfrow=c(2,2))

plot(d$dt, d$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(d$dt, d$Voltage, type = "l", ylab = "Voltage", xlab = "")

plot(d$dt, d$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(d$dt, d$Sub_metering_2, col = "red", usr = c(0,2,0,40))
lines(d$dt, d$Sub_metering_3, col = "blue", usr = c(0,2,0,40))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

plot(d$dt, d$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "")

dev.off()
