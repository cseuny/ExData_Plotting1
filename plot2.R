library(readr)
#Read data from a text file with ";" as separators
data <- read_delim("household_power_consumption.txt", col_types = "ctnnnnnnn")

#Subset data from the dates 2007-02-01 to 2007-02-02
dt <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Merge date and time into one column "Datetime"
dt$Datetime <- paste(dt$Date, dt$Time, sep=" ")
dt$Datetime <- as.POSIXct(dt$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Open png device; create 'plot2.png' in the working directory
png(file = "plot2.png")

#Create plot and send to a file
with(dt, plot(Datetime, Global_active_power, type="l",xlab = NA, ylab = "Global Active Power (kilowatts)"))

#Close the png file device
dev.off()