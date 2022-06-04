library(readr)
#Read data from a text file with ";" as separators
data <- read_delim("household_power_consumption.txt", col_types = "ctnnnnnnn")

#Subset data from the dates 2007-02-01 to 2007-02-02
dt <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Convert Date variable to Date class 
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

#Open png device; create 'plot1.png' in the working directory
png(file = "plot1.png")

#Create plot and send to a file
with(dt, hist(Global_active_power,main="", xlab="Global Active Power (kilowatts)"))

#Annotate plot
title(main = "Global Active Power")

#Close the png file device
dev.off()
