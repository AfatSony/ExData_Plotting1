library(dplyr)
library(datasets)
library(lubridate)

#load the required data from the working directory
house.data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
names(house.data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
house.data.subset <- subset(house.data,Date %in% c("1/2/2007","2/2/2007"))

house.data.subset$Date <- as.Date(house.data.subset$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(house.data.subset$Date), house.data.subset$Time)
house.data.subset$Datetime <- as.POSIXct(DateTime)
with(house.data.subset, plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))

png("plot2.png", width=480, height=480)

dev.copy(png,"plot2.png",height=480, width=480)
dev.off()
