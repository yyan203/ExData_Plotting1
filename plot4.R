setwd("~/Desktop/CS_and_Software/Coursera_data_science/HW/4_1/exdata%2Fdata%2Fhousehold_power_consumption/initial_data")
library(tidyverse)
origin <- read_delim("household_power_consumption.txt", ";", col_names=TRUE, na=c("?", "NA"), quoted_na = TRUE,
                     col_types = "ctnnnnnnn")
origin$Date <- as.Date(origin$Date, "%d/%m/%Y")
subdata <- filter(origin, Date >= "2007-02-01" & Date <= "2007-02-02")
library(lubridate)
subdata$ntime <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2, 2), mar=c(4, 4, 2, 2))
# 1st subplot
plot(subdata$ntime, subdata$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
# 2nd subplot
plot(subdata$ntime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd subplot
with(subdata, plot(ntime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
lines(subdata$ntime, subdata$Sub_metering_1, col="black")
lines(subdata$ntime, subdata$Sub_metering_2, col="red")
lines(subdata$ntime, subdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, bty="n", cex = 0.75)
plot(subdata$ntime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
