# download 

temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileUrl, temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, stringsAsFactors=FALSE)
unlink(temp)
onetwofeb <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# plot

library(datasets)
onetwofeb$Sub_metering_1 <- as.numeric(onetwofeb$Sub_metering_1)
onetwofeb$Sub_metering_2 <- as.numeric(onetwofeb$Sub_metering_2)
onetwofeb$Sub_metering_3 <- as.numeric(onetwofeb$Sub_metering_3)


plot(onetwofeb$Sub_metering_1~c(1:2880), type="l", xlab="", ylab = "Energy sub metering", xaxt="n", col="black")
lines(onetwofeb$Sub_metering_2~c(1:2880),col="red")
lines(onetwofeb$Sub_metering_3~c(1:2880),col="blue")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# print 

dev.print(device = png, filename = 'plot3.png', width = 480, height = 480) 
dev.off()








