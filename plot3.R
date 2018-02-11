data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

dim(data)

#9 variables and 2,075,259 rows of data

library(dplyr)

tbl_df(data)

data1<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")

png(file = "plot3.png", width = 480, height = 480) 

data1$Date1 <- as.Date(data1$Date, "%d/%m/%Y") 
data1$Date1 <- paste (data1$Date1, data1$Time, sep = " ") 
data1$Date1 <- strptime(data1$Date1, "%Y-%m-%d  %H:%M:%S")

data1$Sub_metering_1 = as.numeric(as.character(data1$Sub_metering_1))
plot(data1$Date1,data1$Sub_metering_1,type="l",col="black",xlab = "",ylab ="Energy Sub Metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
par(new=TRUE)

data1$Sub_metering_2 = as.numeric(as.character(data1$Sub_metering_2))
plot(data1$Date1,data1$Sub_metering_2,type="l",col="red",xlab = "",ylab ="Energy Sub Metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
par(new=TRUE)

data1$Sub_metering_3 = as.numeric(as.character(data1$Sub_metering_3))
plot(data1$Date1,data1$Sub_metering_3,type="l",col="blue",xlab = "",ylab ="Energy Sub Metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off () 
