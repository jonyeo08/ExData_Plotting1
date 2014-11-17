##Read data
ds<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

## Subsetting the data
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
data <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
names(data)
Datetime<-data$Datetime
Sub_metering_1<-data$Sub_metering_1
Sub_metering_2<-data$Sub_metering_2
Sub_metering_3<-data$Sub_metering_3

plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')

##Adding a legend
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
