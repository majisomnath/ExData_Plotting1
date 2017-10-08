# Call required library for subsetting and graphics
library(dplyr)
library(datasets)

# Read input data file named "household_power_consumption.txt"
consumption_data <- read.table("./household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")

# Filter 01/02/2007 and 02/02/2007 data for plotting
required_data <- filter(consumption_data, as.Date(Date,"%d/%m/%Y") >= "2007-02-01", as.Date(Date,"%d/%m/%Y") < "2007-02-03")

# Plot a histogram and save in PNG file
# Plot Global_active_power column histogram here
png(filename = "plot1.png", width = 480, height = 480)
hist(required_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()
