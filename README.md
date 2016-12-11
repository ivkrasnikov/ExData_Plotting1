# Plotting
The objective was to practice creating plots by reproducing a series of four plots, and also to practice using github by forking and cloning an existing repository.

##Data
This assignment uses data from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/), a popular repository for machine learning datasets. The "Individual household electric power consumption Data Set" was used and made available on the course web site:

* [Electric power consumption Dataset (20Mb)](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

* Description: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

The following descriptions of the 9 variables in the dataset are taken
from the [UCI web site](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

##Loading the data

```r
# Read the data from file
dt <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)

# Formate date
dt$Date <- as.Date(dt$Date,"%d/%m/%Y");

# Subset only two dates from the dataset
dt <- subset(dt, dt$Date %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y"))

# Make a datetime column
dt$DT <- as.POSIXct(paste(dt$Date, dt$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

dt$Global_active_power <- as.numeric(dt$Global_active_power)
```
##Plot 1
![alt text](https://github.com/ivkrasnikov/ExData_Plotting1/blob/master/plot1.png)

##My Plot 1

```r
boxplot(dt$Global_active_power, horizontal = TRUE, outline = FALSE)
hist(dt$Global_active_power,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
```
##Plot 2
<img src="https://github.com/ivkrasnikov/ExData_Plotting1/blob/master/plot2.png/>

##My Plot 2

```r
plot(dt$DT,dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
```

##Plot 3
<img src="https://github.com/ivkrasnikov/ExData_Plotting1/blob/master/plot3.png"/>

##My Plot 3

```r
plot(dt$DT,dt$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt$DT, dt$Sub_metering_2, col = "red")
lines(dt$DT, dt$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), lwd = c(1,1))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
```

##Plot 4
<img src="https://github.com/ivkrasnikov/ExData_Plotting1/blob/master/plot4.png"/>

##My Plot 4

```r
par(mfrow = c(2,2))
## Subplot 1
plot(dt$DT, dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## Subplot 2
plot(dt$DT, dt$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Subplot 3
plot(dt$DT, dt$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt$DT, dt$Sub_metering_2, col = "red")
lines(dt$DT, dt$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), bty = "n", cex = .5) 

# Subplot 4
plot(dt$DT,dt$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
```