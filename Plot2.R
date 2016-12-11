rm(list = ls(all = TRUE)) # Clear workspace
library(data.table)

setwd("d:/Coursera/ExData_Plotting1-master")

# Read the data from file
dt <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)

# Formate date
dt$Date <- as.Date(dt$Date,"%d/%m/%Y");

# Subset only two dates from the dataset
dt <- subset(dt, dt$Date %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y"))

# Make a datetime column
dt$DT <- as.POSIXct(paste(dt$Date, dt$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

dt$Global_active_power <- as.numeric(dt$Global_active_power)

# Plot 2
plot(dt$DT,dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()