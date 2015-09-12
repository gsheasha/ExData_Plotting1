

## Read the data file
data<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
str(data)
head(data$Date)


##subset the data
epc=subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
str(epc)
epc$dur1=paste(epc$Date, epc$Time)
epc$dur=strptime(epc$dur1, "%d/%m/%Y %H:%M:%S")


#Second plot
png("plot2.png")
with(epc,plot(dur,Global_active_power,type="n",xlab="",
              ylab="Global Active Power (kilowatts)"))
lines(epc$dur,epc$Global_active_power)
dev.off()
