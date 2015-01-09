# read power data
power <- read.csv("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
# convert to date 
power$Date <- as.Date(power$Date,"%d/%m/%Y")
# subsetting as data
power <- power[power$Date == '2007-02-01' | power$Date == '2007-02-02',]


# Generate the graph
png("plot1.png")
with(power,hist(Global_active_power,main = "Global Active Power",col='red',xlab = 'Global Active Power (kilowatts)'))
dev.off()