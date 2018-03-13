library("data.table")

## read datafile into a table
powdata <- read.table("household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")

## subset data
powdatasub <- subset(powdata,powdata$Date=="1/2/2007" | powdata$Date =="2/2/2007")
powdatasub$Date <- as.Date(powdatasub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powdatasub$Date), powdatasub$Time)
powdatasub$Datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)

#call plot function
with(powdatasub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## add legend
legend("topright", lty=1,col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()



