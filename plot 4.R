library(readr)
#Read data from a text file with ";" as separators
data <- read_delim("household_power_consumption.txt", col_types = "ctnnnnnnn")

#Subset data from the dates 2007-02-01 to 2007-02-02
dt <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Merge date and time into one column "Datetime"
dt$Datetime <- paste(dt$Date, dt$Time, sep=" ")
dt$Datetime <- as.POSIXct(dt$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Open png device; create 'plot4.png' in the working directory
png(file = "plot4.png")

#Place 4 plots
par(mfcol= c(2,2))

#1st graph
with(dt, plot(Datetime, Global_active_power, type="l",xlab = NA, ylab = "Global Active Power (kilowatts)"))

#2nd graph
with(dt, plot(Datetime, Sub_metering_1, type="l", col="black", xlab = NA, ylab = "Energy sub metering"))
with(dt, lines(Datetime, Sub_metering_2, col="red"))
with(dt, lines(Datetime, Sub_metering_3, col="blue"))
legend(x = "topright", legend = c(names(dt[7]), names(dt[8]), names(dt[9])), col = c("black", "red", "blue"), lty=1)

#3rd graph
with(dt, plot(Datetime, Voltage, type="l" ))

#4th graph
with(dt, plot(Datetime, Global_reactive_power, type="l"))

#Close the png file device
dev.off()

#Reset the plotting device back to normal 
par(mfcol= c(1,1))