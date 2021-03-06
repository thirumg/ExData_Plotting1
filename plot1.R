d <- read.table('household_power_consumption.txt', sep = ";", skip = 66636, header = F, na.strings = c("?"), nrows = 2881)
h <- read.table('household_power_consumption.txt', sep = ";", header = T, na.strings = c("?"), nrows = 1)
names(d) <- names(h)
png(file = "plot1.png", height = 480, width = 480) 
hist(d$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
