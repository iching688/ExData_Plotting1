library(data.table)
# read in data
mydata <- fread("../data/household_power_consumption.txt", sep="auto", header=TRUE, na.strings="?", showProgress=FALSE)

# remove NA rows and extract a subset with dates in (1/2/2007, 2/2/2007)
mydata <- na.omit(mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",])

# plot a line graph with Date vs (Sub_metering_1, Sub_metering_2, Sub_metering_3)
# Sub_metering_1: black line; Sub_metering_2: red line; Sub_metering_3: blue line
# and, save the graph in png file format (default size is 480 x 480)
png(file="plot3.png")
ddt <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
plot(ddt, mydata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(ddt, mydata$Sub_metering_2, col="red")
lines(ddt, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()

