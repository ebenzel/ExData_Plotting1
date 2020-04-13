library(tidyverse)
library(lubridate)

## Read in data and subset dates for this plotting assignment and reformat date-times
data_full <- read_delim("household_power_consumption.txt",na = "?", delim = ";")
data <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007"))

data$Date <- dmy_hms(paste(data$Date,"",data$Time))
data <- select(data, -Time)

## Create plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", )
points(data$Date, data$Sub_metering_2, col = "Red", type = "l")
points(data$Date, data$Sub_metering_3, col = "Blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lwd = 1, bty = "n")
with(data,plot(Date, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()

