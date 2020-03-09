library(dplyr)

#read the data
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the data as per the required dates before working on the dataset
data <- filter(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Drawing the plots
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1
plot(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot 2
plot(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", )

#plot 3
plot(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Sub_metering_1, col = "black" ,type = "l", xlab = "", ylab = "Energy sub metering")
points(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Sub_metering_2, type = "l", col = "red")
points(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 19 )

#plot 4
plot(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", )

dev.off()