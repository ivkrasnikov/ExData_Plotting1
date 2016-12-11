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
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)

# Plot 3
plot(dt$DT,dt$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt$DT, dt$Sub_metering_2, col = "red")
lines(dt$DT, dt$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), lwd = c(1,1))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
