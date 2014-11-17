## Reading Data
ds<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

## Subsetting the data
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
data <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4

names(data)
Datetime<-data$Datetime
Sub_metering_1<-data$Sub_metering_1
Sub_metering_2<-data$Sub_metering_2
Sub_metering_3<-data$Sub_metering_3
Voltage<-data$Voltage
Global_reactive_power<-data$Global_reactive_power
Global_active_power<-data$Global_active_power
Global_intensity<-data$Global_intensity
  

par(mfrow=c(2,2), mar=c(4,4,2,.5), oma=c(0,0,0,0))
  
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Rective_Power ",xlab="datetime")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
