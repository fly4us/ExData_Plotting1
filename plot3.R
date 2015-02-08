# Read data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset 2007-02-01 and 2007-02-02
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert datetime
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot
png(filename = "plot3.png")

plot(data$DateTime, data$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
points(data$DateTime, data$Sub_metering_2, type='l', col="red")
points(data$DateTime, data$Sub_metering_3, type='l', col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)

dev.off()