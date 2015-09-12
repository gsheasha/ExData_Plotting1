

## Read the data file
data<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
str(data)
head(data$Date)


##subset the data
epc=subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
str(epc)
epc$dur1=paste(epc$Date, epc$Time)
epc$dur=strptime(epc$dur1, "%d/%m/%Y %H:%M:%S")


#Third plot
png("plot3.png")
with(epc,plot(dur,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
lines(epc$dur,epc$Sub_metering_1)
lines(epc$dur,epc$Sub_metering_2,col="red")
lines(epc$dur,epc$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
