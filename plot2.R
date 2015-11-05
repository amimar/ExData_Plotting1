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
plot(onetwofeb$Global_active_power~c(1:2880), type="l", xlab="", ylab = "Global Active Power (kilowatts)", xaxt="n")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

# print

dev.print(device = png, filename = 'plot2.png', width = 480, height = 480) 
dev.off()









