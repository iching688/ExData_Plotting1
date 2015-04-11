library(data.table)

# read in data
mydata <- fread("../data/household_power_consumption.txt", sep="auto", header=TRUE, na.strings="?", showProgress=FALSE)

# remove NA rows and extract a subset with dates in (1/2/2007, 2/2/2007)
mydata <- na.omit(mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",])


# plot a histograms with Global_active_power variable
# and, save the histograms in png file format (default size is 480 x 480)
png(file="plot1.png")
hist(as.numeric(mydata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()