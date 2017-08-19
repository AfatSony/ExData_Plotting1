library(dplyr)
library(datasets)
library(lubridate)

#load the required data from the working directory
house.data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
names(house.data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
house.data.subset <- subset(house.data,Date %in% c("1/2/2007","2/2/2007"))
house.data.subset$Date <- as.Date(house.data.subset$Date, format="%d/%m/%Y")

#plot histogram
hist(as.numeric(as.character(house.data.subset$Global_active_power)), main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#use of graphic device to produce an image
png("plot1.png", width=480, height=480)

dev.copy(png,'plot1.png',height=480, width=480)
#close graphic device
dev.off()



