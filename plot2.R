install.packages('sqldf')
library(sqldf)

#Separator is ';'
data <- read.csv.sql('household_power_consumption.txt', sql="select * from file where Date = '1/2/2007' or Date='2/2/2007'", sep=';')

time <- paste(data$Date, data$Time)
data$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()