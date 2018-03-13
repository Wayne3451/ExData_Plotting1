library("data.table")

## read datafile into a table
powdata <- read.table("household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")

## subset data
powdatasub <- subset(powdata,powdata$Date=="1/2/2007" | powdata$Date =="2/2/2007")
globalpow <- as.numeric(powdatasub$Global_active_power)
datetime <- strptime(paste(powdatasub$Date,powdatasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## set device to png
png("plot2.png", width=480, height=480)

#call plot function
plot(datetime, globalpow, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
