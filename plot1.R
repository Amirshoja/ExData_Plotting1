library(dplyr)

#read the data
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the data as per the required dates before working on the dataset
data <- filter(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Drawing the plot
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()