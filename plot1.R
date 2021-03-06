library("data.table")

## read datafile into a table
powdata <- read.table("household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")

## subset data
powdatasub <- subset(powdata,powdata$Date=="1/2/2007" | powdata$Date =="2/2/2007")
globalpow <- as.numeric(powdatasub$Global_active_power)

## set device to png
png("plot1.png", width=480, height=480)

## create histogram
hist(globalpow, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
