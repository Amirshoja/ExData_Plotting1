library(dplyr)

#read the data
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the data as per the required dates before working on the dataset
data <- filter(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Drawing the plot
png("plot2.png", width = 480, height = 480)
plot(strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()