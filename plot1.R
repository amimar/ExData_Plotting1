# download 

temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileUrl, temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, stringsAsFactors=FALSE)
unlink(temp)
onetwofeb <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# plot

library(datasets)
onetwofeb$Global_active_power <- as.numeric(onetwofeb$Global_active_power)
hist(onetwofeb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#print

dev.print(device = png, filename = 'plot1.png', width = 480, height = 480) 
dev.off()










