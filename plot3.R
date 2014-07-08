setwd("./ExData_Plotting1")

# Unzipping and reading data file 
unzip("exdata-data-household_power_consumption.zip")
all.power.data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings ='?')

# Subsetting on correct dates 
power.data <- droplevels(all.power.data[all.power.data$Date %in% c('1/2/2007', '2/2/2007'), ])

# Converting to POSIX
power.data$DateTime <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")

# Creating .png of plot
png(file='plot3.png')
plot(power.data$DateTime, power.data$Sub_metering_1, type='l', col='black', xlab='', ylab='Energy Sub Metering')
lines(power.data$DateTime, power.data$Sub_metering_2, col='red')
lines(power.data$DateTime, power.data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
dev.off()
