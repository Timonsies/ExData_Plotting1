setwd("D:\\timons\\Documents\\R\\Coursera\\explData\\project")
#Make sure that the working directory contains the correct "household_power_consumption.txt"

#Read, subset and beautify data
powercons<-read.table("household_power_consumption.txt", sep = ";",header=TRUE,na.strings = "?" )
powercons.ss<-subset(powercons,as.Date(powercons$Date,"%d/%m/%Y")==as.Date("01-02-2007","%d-%m-%Y") | as.Date(powercons$Date,"%d/%m/%Y")==as.Date("02-02-2007","%d-%m-%Y"),select=Date:Sub_metering_3)
rm(powercons)
powercons.ss$dt<-strptime(paste(powercons.ss$Date,powercons.ss$Time),"%d/%m/%Y %H:%M:%S")

# Create plot2
png("plot2.png")
plot(powercons.ss$dt,powercons.ss$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(powercons.ss$dt,powercons.ss$Global_active_power)
dev.off()
