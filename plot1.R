ds<-read.table("household_power_consumption.txt", 
               header=T, sep=";", stringsAsFactors=F)

## Subsetting the data
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")


data <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Plot 1
x<-as.numeric(data$Global_active_power)
hist(x, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()