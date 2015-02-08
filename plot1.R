# Read data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset 2007-02-01 and 2007-02-02
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert datetime
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot
png(filename = "plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()