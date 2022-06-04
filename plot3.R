library(readr)
#Read data from a text file with ";" as separators
data <- read_delim("household_power_consumption.txt", col_types = "ctnnnnnnn")

#Subset data from the dates 2007-02-01 to 2007-02-02
dt <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Merge date and time into one column "Datetime"
dt$Datetime <- paste(dt$Date, dt$Time, sep=" ")
dt$Datetime <- as.POSIXct(dt$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Open png device; create 'plot3.png' in the working directory
png(file = "plot3.png")

#Display Sub_metering data in three different colors
with(dt, plot(Datetime, Sub_metering_1, type="l", col="black", xlab = NA, ylab = "Energy sub metering"))
with(dt, lines(Datetime, Sub_metering_2, col="red"))
with(dt, lines(Datetime, Sub_metering_3, col="blue"))

#Adding a legend in the box
legend(x = "topright", legend = c(names(dt[7]), names(dt[8]), names(dt[9])), col = c("black", "red", "blue"), lty=1)

#Close the png file device
dev.off()