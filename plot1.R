

## Read the data file
data<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
str(data)
head(data$Date)


##subset the data
epc=subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
str(epc)

# First plot
png("plot1.png")
hist(epc$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
