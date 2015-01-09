# read power data
power <- read.csv("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
# convert to date 
power$Date <- as.Date(power$Date,"%d/%m/%Y")
# subsetting as data
power <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]

png("plot2.png")
with(power,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))
dev.off()