#**********************************************************************************************************************************************************
#TÍTULO: functions.R
#
#AUTHOR: Brais López Yáñez
#***********************************************************************************************************************************************************

#Load data
data <- read.csv(file="./www/data/derbiesPremier12131415.csv",head=TRUE,sep=",")

row.names(data) <- c(1:nrow(data)) 


#Function that extract the derbies and results of the season
DataSeason<-function(year)
{ year2<-as.numeric(year)-1
  dateSeason <- as.Date(paste("30/06/", year, sep = ""), format='%d/%m/%Y')
  #print(dateSeason)
  dateSeason2 <- as.Date(paste("30/06/", year2, sep = ""), format='%d/%m/%Y')
  
  dateData <- as.Date(data$Date, format='%m/%d/%Y')
  #print(dateData)
  
  dataSeason<-data[which(dateData<dateSeason & dateData>dateSeason2),]
  
  dataSeason$Date<- format(as.Date(dataSeason$Date, format='%m/%d/%Y'), '%Y-%m-%d') 
  #print(dataSeason$Date)
  dataSeason
  
  return (dataSeason)
}