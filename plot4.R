library("data.table")

## read datafile into a table
powdata <- read.table("household_power_consumption.txt",header = TRUE,na.strings="?",sep=";")

## subset data
powdatasub <- subset(powdata,powdata$Date=="1/2/2007" | powdata$Date =="2/2/2007")

## format data
powdatasub$Date <- as.Date(powdatasub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powdatasub$Date), powdatasub$Time)
powdatasub$Datetime <- as.POSIXct(datetime)
png("plot4.png", width=480, height=480)

## draw 4 graphs by row
par(mfrow = c(2,2))

## call plot function
with(powdatasub, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power")
  plot(Voltage~Datetime, type="l", ylab="Voltage")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", lty=1, col=c("black", "red", "blue"),bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power")
})

dev.off()