#set environment variables
workDir <- 'C:/CourseraDataScientistCourse/04_ExploratoryDataAnalysis/week1/courseProject1'
fileName <- 'household_power_consumption.txt'
dataFileName <- paste(workDir,fileName, sep ='/')

# read the whole csv
powerData <- read.table(dataFileName,fill = TRUE,sep = ';' , header = TRUE)
powerData$Date <- as.Date(powerData$Date,'%d/%m/%Y')

# select the rows what we need
filteredPowerData <- subset(powerData, format(powerData$Date,'%Y%m%d') %in% c('20070201','20070202'))

# save memory
rm(powerData)


with(filteredPowerData, Global_active_power <-as.numeric(as.character(Global_active_power)))

hist(filteredPowerData$Global_active_power, 
     col = "red", main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.copy(png, file=paste(workDir,"plot1.png", sep ='/'), width=480, height=480)
dev.off()



