data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

dim(data)

#9 variables and 2,075,259 rows of data

library(dplyr)

tbl_df(data)

#Extract rows where Date = 2007-02-01 and 2007-02-02
data1<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")

data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

png(file = "plot2.png", width = 480, height = 480) 
data1$Date1 <- as.Date(data1$Date, "%d/%m/%Y") 
data1$Date1 <- paste (data1$Date1, data1$Time, sep = " ") 
data1$Date1 <- strptime(data1$Date1, "%Y-%m-%d  %H:%M:%S") 
plot(data1$Date1, data1$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off () 
