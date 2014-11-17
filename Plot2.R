ds<-read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

## Subsetting the data
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
data <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()