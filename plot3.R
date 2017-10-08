# Call required library for subsetting and graphics
library(dplyr)
library(datasets)

# Read input data file named "household_power_consumption.txt"
consumption_data <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")

# Filter 01/02/2007 and 02/02/2007 data for plotting
required_data <- filter(consumption_data, as.Date(Date,"%d/%m/%Y") >= "2007-02-01", as.Date(Date,"%d/%m/%Y") < "2007-02-03")

# Combine Date and Time columns to get DateTime column in POSIXct format
DateTime <- strptime(paste(as.character(required_data$Date), as.character(required_data$Time), sep = " "),"%d/%m/%Y %T")
required_data <- cbind(DateTime, required_data)

# Plot a chart and save in PNG file
# Plot DateTime and Sub_metering_1/2/3 with type as "l" (lines)
# Add proper legend in the chart
png(filename = "plot3.png", width = 480, height = 480)
with(required_data, plot(DateTime, Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering"))
with(required_data, lines(DateTime, Sub_metering_2, col="red"))
with(required_data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd = c(1,1,1))
dev.off()