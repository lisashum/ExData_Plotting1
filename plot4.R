data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

dim(data)

#9 variables and 2,075,259 rows of data

library(dplyr)

tbl_df(data)

#Extract rows where Date = 2007-02-01 and 2007-02-02
data1<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")

data1$Date1 <- as.Date(data1$Date, "%d/%m/%Y") 
data1$Date1 <- paste (data1$Date1, data1$Time, sep = " ") 
data1$Date1 <- strptime(data1$Date1, "%Y-%m-%d  %H:%M:%S") 

png(file = "plot4.png", width = 480, height = 480) 
par(mfrow=c(2,2))

#Plot1
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))
plot(data1$Date1, data1$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

#Plot2
data1$Voltage<-as.numeric(as.character(data1$Voltage))
plot(data1$Date1, data1$Voltage, type="l", xlab = "datetime", ylab = "Voltage") 

#Plot3
data1$Sub_metering_1 = as.numeric(as.character(data1$Sub_metering_1))
plot(data1$Date1,data1$Sub_metering_1,type="l",col="black",xlab = "",ylab ="Energy sub metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
par(new=TRUE)
data1$Sub_metering_2 = as.numeric(as.character(data1$Sub_metering_2))
plot(data1$Date1,data1$Sub_metering_2,type="l",col="red",xlab = "",ylab ="Energy sub metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
par(new=TRUE)
data1$Sub_metering_3 = as.numeric(as.character(data1$Sub_metering_3))
plot(data1$Date1,data1$Sub_metering_3,type="l",col="blue",xlab = "",ylab ="Energy sub metering",ylim=c(0, max(data1$Sub_metering_1, data1$Sub_metering_2, data1$Sub_metering_3)))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,bty="n")

#Plot4
data1$Global_reactive_power<-as.numeric(as.character(data1$Global_reactive_power))
plot(data1$Date1, data1$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off () 