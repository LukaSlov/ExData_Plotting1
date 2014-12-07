install.packages('sqldf')
library(sqldf)

#Separator is ';'
data <- read.csv.sql('household_power_consumption.txt', sql="select * from file where Date = '1/2/2007' or Date='2/2/2007'", sep=';')

#Use datetime format
time <- paste(data$Date, data$Time)
data$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")


png("plot4.png")

par(mfrow=c(2,2))

#Chart 1
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#Chart 2
plot(data$Time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#Chart 3
plot(data$Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty=1)

#Chart 4
plot(data$Time, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
