## Coursera; Data Science
## Course 4: "Exploratory Data Analysis"
## RUNNING ON MAC
## Week 1, Project1
## Plot 1

## *1* Downloading file
if(!file.exists("./C4W1P1data")){dir.create("./C4W1P1data")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./C4W1P1data/dataset.zip",method="curl")

## *2* Unzip the file
unzip(zipfile="./C4W1P1data/dataset.zip",exdir="./C4W1P1data")

## *3* Reading the unzipped file and making the dataframe
data<-read.table("./C4W1P1data/household_power_consumption.txt", header = TRUE, sep=";", dec=".",numerals = "no.loss", na.strings = "?", comment.char = "")

## *4* Making a new variable: Date-Time (abbreviated as 'dttm')
data$dttm<-paste(data$Date,data$Time)

## *5* Changing class of date and time
data$dttm<-strptime(data$dttm, "%d/%m/%Y %H:%M:%S")
data$Date<-strptime(data$Date, "%d/%m/%Y")
data$Date<-as.Date(data$Date)

## *6* Subsetting data, so the new data set included only data on February 1st and 2nd, 2007
selected<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## *7* Plot 3: "Energy sub metering in different times"
par(mfrow=c(1,1))
with(selected, plot(dttm, Sub_metering_1, xlab="Date - Time", ylab= "Energy sub metering", type="n"))
with(selected, lines(dttm, Sub_metering_1, type="l"))
with(selected, lines(dttm, Sub_metering_2, type="l", col="red"))
with(selected, lines(dttm, Sub_metering_3, type="l", col="blue"))
legend("topright", col = c("black","red","blue"), lty = 1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## *8* Writting data into png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
