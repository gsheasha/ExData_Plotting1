

## Read the data file
data<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
str(data)
head(data$Date)


##subset the data
epc=subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
str(epc)
epc$dur1=paste(epc$Date, epc$Time)
epc$dur=strptime(epc$dur1, "%d/%m/%Y %H:%M:%S")


#Forth plot
png("plot4.png")
par(mfrow=c(2,2),mar = c(4, 2, 1, 1), oma = c(0, 0, 2, 0))

with(epc,plot(dur,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
lines(epc$dur,epc$Global_active_power)

with(epc,plot(dur,Voltage,type="n",ylab="Voltage",xlab="datetime"))
lines(epc$dur,epc$Voltage)

with(epc,plot(dur,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
lines(epc$dur,epc$Sub_metering_1)
lines(epc$dur,epc$Sub_metering_2,col="red")
lines(epc$dur,epc$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


with(epc,plot(dur,Global_reactive_power,type="n",xlab="datetime"))
lines(epc$dur,epc$Global_reactive_power)

dev.off()
