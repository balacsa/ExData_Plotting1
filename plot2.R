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

# save memory
rm(powerData)

# make the graph
plot( x=filteredPowerData$DateTime, y=filteredPowerData$Global_active_power, 
      type = "l", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, file=paste(workDir,"plot2.png", sep ='/'), width=480, height=480)
dev.off()



