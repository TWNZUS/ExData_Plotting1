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

y <- as.numeric(Plot2_dataset$Global_active_power)

plot(y, type="l",	axes =  FALSE, ylab = "Global Active Power (Kilowatts)",  xlab = ""  ) 

axis( 2, at= axTicks(2), labels = paste(axTicks(2)))
axis( 1, at= c(0,1440,2880), labels = c("Thu","Fri","Sat"))

box()


dev.copy(png , "plot2.png" )
dev.off()