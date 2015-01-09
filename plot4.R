# read power data
power <- read.csv("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
# convert to date 
power$Date <- as.Date(power$Date,"%d/%m/%Y")
# subsetting as data
power <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]

png("plot4.png")
par(mfrow=c(2,2))
with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))

with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,  type='l',xlab='datetime',ylab='Voltage'))

with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(power,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(power,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)

with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Global_reactive_power,type='l',xlab='datetime'))
dev.off()