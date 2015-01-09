# read power data
power <- read.csv("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
# convert to date 
power$Date <- as.Date(power$Date,"%d/%m/%Y")
# subsetting as data
power <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]

png("plot3.png")
with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(power,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(power,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
dev.off()