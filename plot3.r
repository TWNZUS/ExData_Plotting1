setwd("./DataScienceDoc/data/C4W1")
library(dplyr)

##### Create and fillter/cleaning up dataset

Plot2_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

Plot2_dataset$Date <- as.character(Plot2_dataset$Date)
Plot2_dataset$Date <- as.Date(Plot2_dataset$Date, format="%d/%m/%Y")

Plot2_dataset<- Plot2_dataset[Plot2_dataset$Date %in% c( as.Date("2007-02-02",format="%Y-%m-%d" ),as.Date("2007-02-01",format="%Y-%m-%d" )),]

Plot2_dataset$Global_active_power <- as.character(Plot2_dataset$Global_active_power)

Plot2_dataset <- Plot2_dataset[ !(Plot2_dataset$Global_active_power == "?") ,  ]

######### Create time series plot

y_metering_1 <- as.numeric(Plot2_dataset$Sub_metering_1)
y_metering_2 <- as.numeric(Plot2_dataset$Sub_metering_2)
y_metering_3 <- as.numeric(Plot2_dataset$Sub_metering_3)
x<- c(1: length(y))

plot(y_metering_1, type="n",	axes =  FALSE, ylab = "Global Active Power (Kilowatts)",  xlab = ""  ) 

axis( 2, at= c(0,10,20,30), labels = c(0,10,20,30))
axis( 1, at= c(0,1440,2880), labels = c("Thu","Fri","Sat"))

lines(x,y_metering_1, lwd = 1, col="black", type = "l" )
lines(x,y_metering_2, lwd = 1, col="red", type = "l" )
lines(x,y_metering_3, lwd = 1, col="blue", type = "l" )
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"), lty = c(1,1,1))

box()

dev.copy(png , "plot3.png" )
dev.off()
