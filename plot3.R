#set environment variables
workDir <- 'C:/CourseraDataScientistCourse/04_ExploratoryDataAnalysis/week1/courseProject1'
fileName <- 'household_power_consumption.txt'
dataFileName <- paste(workDir,fileName, sep ='/')

# read the whole csv
powerData <- read.table(dataFileName,fill = TRUE,sep = ';' , header = TRUE)
powerData$DateTime <-paste(powerData$Date,powerData$Time,' ')
powerData$Date <- as.Date(powerData$Date,'%d/%m/%Y')

# select the rows what we need
filteredPowerData <- subset(powerData, format(powerData$Date,'%Y%m%d') %in% c('20070201','20070202'))
filteredPowerData$DateTime<-as.POSIXct(filteredPowerData$DateTime, format = '%d/%m/%Y %H:%M:%S')
filteredPowerData$Global_active_power <-as.numeric(as.character(filteredPowerData$Global_active_power))
filteredPowerData$Sub_metering_1 <-as.numeric(as.character(filteredPowerData$Sub_metering_1))
filteredPowerData$Sub_metering_2 <-as.numeric(as.character(filteredPowerData$Sub_metering_2))
filteredPowerData$Sub_metering_3 <-as.numeric(as.character(filteredPowerData$Sub_metering_3))

# save memory
rm(powerData)

# make the graph
plot( x=filteredPowerData$DateTime, y=filteredPowerData$Sub_metering_1, 
      type = "l", xlab = '', ylab = 'Energy sub metering')
points( x=filteredPowerData$DateTime, y=filteredPowerData$Sub_metering_2, 
        type = "l", col='red')
points( x=filteredPowerData$DateTime, y=filteredPowerData$Sub_metering_3, 
        type = "l", col='blue')
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.copy(png, file=paste(workDir,"plot3.png", sep ='/'), width=480, height=480)
dev.off()



