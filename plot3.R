##Read the data, use the option in read.csv to replace ? with NA
powerData <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Pick the relevant subset to work with, *much* faster
data_subset<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

## because the x values are all the same just add lines
## found this website helpful
## http://cran.r-project.org/doc/contrib/Lemon-kickstart/kr_addat.html

##Plot the 3 series on the same graph
plot(datetime,data_subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,data_subset$Sub_metering_2,col="red")
lines(datetime,data_subset$Sub_metering_3,col="blue")

## the lwd option is important, it seems that the default option is a line width of 0 which doesn't show up
legend(cex=0.7,"topright",title="",legend=names(data_subset)[grep("Sub*",names(data_subset))], seg.len=3, lwd=1,col=c("black","red","blue"))

## Write output file
## default option is 480x480
dev.copy(png,"plot3.png")
dev.off()