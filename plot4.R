library(data.table)
# read in data
mydata <- fread("../data/household_power_consumption.txt", sep="auto", header=TRUE, na.strings="?", showProgress=FALSE)

# remove NA rows and extract a subset with dates in (1/2/2007, 2/2/2007)
mydata <- na.omit(mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",])

# Plot 4 graphs as required on https://class.coursera.org/exdata-013/human_grading/view/courses/973507/assessments/3/submissions
# and, save the graph in png file format (default size is 480 x 480)
png(file="plot4.png")
par(mfrow=c(2,2))
ddt <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

# graph at top left
plot(ddt, mydata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# graph at top right
plot(ddt, mydata$Voltage, type="l", ylab="Voltage", xlab="datetime")

# graph at bottom left
plot(ddt, mydata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(ddt, mydata$Sub_metering_2, col="red")
lines(ddt, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)

# graph at bottom right
plot(ddt, mydata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()