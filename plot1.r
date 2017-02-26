setwd("./DataScienceDoc/data/C4W1")
library(dplyr)

##### Create and fillter/cleaning up dataset


Plot1_dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

Plot1_dataset$Date <- as.character(Plot1_dataset$Date)
Plot1_dataset$Date <- as.Date(Plot1_dataset$Date, format="%d/%m/%Y")

Plot1_dataset<- Plot1_dataset[Plot1_dataset$Date %in% c( as.Date("2007-02-02",format="%Y-%m-%d" ),as.Date("2007-02-01",format="%Y-%m-%d" )),]


Plot1_dataset$Global_active_power <- as.character(Plot1_dataset$Global_active_power)

Plot1_dataset <- Plot1_dataset[ !(Plot1_dataset$Global_active_power == "?") ,  ]



######### Create histogram

y <- as.numeric(Plot1_dataset$Global_active_power)

hist(y,
	main = "Global Active Power",
	ylab = "Frequency" ,
	xlab = "Global Active Power (Kilowatts)",
	col = "red" 
	)

dev.copy(png , "plot1.png" )
dev.off()