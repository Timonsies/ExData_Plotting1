setwd("D:\\timons\\Documents\\R\\Coursera\\explData\\project")
#Make sure that the working directory contains the correct "household_power_consumption.txt"

#Read, subset and beautify data
powercons<-read.table("household_power_consumption.txt", sep = ";",header=TRUE,na.strings = "?" )
powercons.ss<-subset(powercons,as.Date(powercons$Date,"%d/%m/%Y")==as.Date("01-02-2007","%d-%m-%Y") | as.Date(powercons$Date,"%d/%m/%Y")==as.Date("02-02-2007","%d-%m-%Y"),select=Date:Sub_metering_3)
rm(powercons)
powercons.ss$dt<-strptime(paste(powercons.ss$Date,powercons.ss$Time),"%d/%m/%Y %H:%M:%S")

# Create plot 4
png("plot4.png")
par(mfrow=c(2,2))
plot(powercons.ss$dt,powercons.ss$Global_active_power,xlab="",ylab="Global Active Power", type="n")
lines(powercons.ss$dt,powercons.ss$Global_active_power)
plot(powercons.ss$dt,powercons.ss$Voltage,xlab="datetime",ylab="Voltage", type="n")
lines(powercons.ss$dt,powercons.ss$Voltage)
plot(powercons.ss$dt,powercons.ss$Sub_metering_1,xlab="",ylab="Energy sub metering", type="n")
lines(powercons.ss$dt,powercons.ss$Sub_metering_1)
lines(powercons.ss$dt,powercons.ss$Sub_metering_2, col="red")
lines(powercons.ss$dt,powercons.ss$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1),lwd=c(1,1,1),col=c("black","blue","red"))
plot(powercons.ss$dt,powercons.ss$Global_reactive_power,xlab="",ylab="Global_reactive_power", type="n")
lines(powercons.ss$dt,powercons.ss$Global_reactive_power)
dev.off()

