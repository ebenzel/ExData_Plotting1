library(tidyverse)
library(lubridate)

## Read in data and subset dates for this plotting assignment and reformat date-times
data_full <- read_delim("household_power_consumption.txt",na = "?", delim = ";")
data <- filter(data_full, Date %in% c("1/2/2007", "2/2/2007"))

data$Date <- dmy_hms(paste(data$Date,"",data$Time))
data <- select(data, -Time)

## Create plot
png("plot2.png", width = 480, height = 480)
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
