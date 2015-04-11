library(data.table)
# read in data
mydata <- fread("../data/household_power_consumption.txt", sep="auto", header=TRUE, na.strings="?", showProgress=FALSE)

# remove NA rows and extract a subset with dates in (1/2/2007, 2/2/2007)
mydata <- na.omit(mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",])

# plot a line graph with Date vs Global_active_power
# and, save the graph in png file format (default size is 480 x 480)
png(file="plot2.png")
ddt <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
plot(ddt, mydata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
