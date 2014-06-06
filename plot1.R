powerData <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Taking only the subset so we can work faster with less data and memory
data_subset <-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

##Draw and save the plot
hist(data_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Write output file
## default option is 480x480
dev.copy(png,"plot1.png")
dev.off()