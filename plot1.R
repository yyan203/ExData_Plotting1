setwd("~/Desktop/CS_and_Software/Coursera_data_science/HW/4_1/exdata%2Fdata%2Fhousehold_power_consumption/initial_data")
library(tidyverse)
origin <- read_delim("household_power_consumption.txt", ";", col_names=TRUE, na=c("?", "NA"), quoted_na = TRUE,
                     col_types = "?tnnnnnnn")
origin$Date <- as.Date(origin$Date, "%d/%m/%Y")
subdata <- filter(origin, Date >= "2007-02-01" & Date <= "2007-02-02")
png(filename="plot1.png")
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()