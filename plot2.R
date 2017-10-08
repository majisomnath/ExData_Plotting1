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
# Plot DateTime and Global_active_power with type as "l" (lines)
png(filename = "plot2.png", width = 480, height = 480)
with(required_data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", xlab = ""))
dev.off()
