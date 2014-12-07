install.packages('sqldf')
library(sqldf)

#Separator is ';'
data <- read.csv.sql('household_power_consumption.txt', sql="select * from file where Date = '1/2/2007' or Date='2/2/2007'", sep=';')

#Use datetime format
time <- paste(data$Date, data$Time)
data$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")

#check if loaded data is expected
#str(data)
#head(data)
#tail(data)

png("plot1.png")

hist(data$Global_active_power, col="#FF2500", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()