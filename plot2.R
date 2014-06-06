##changed the lang to english so the axis are in english and not in italian (my main lang)
Sys.setlocale("LC_TIME", "English")

##Read the data with read.csv to replace ? with NA
powerData <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Taking only the subset so we can work faster with less data and memory
data_subset<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

##create a helper variable with all the required date and time info in one variable
datetime<-as.POSIXct(paste(data_subset$Date," ",data_subset$Time),format="%Y-%m-%d %H:%M:%S")

plot(datetime,data_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Write output file
## default option is 480x480
dev.copy(png,"plot2.png")
dev.off()