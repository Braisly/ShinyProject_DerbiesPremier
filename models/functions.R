#**********************************************************************************************************************************************************
#TÍTULO: functions.R
#
#AUTHOR: Brais López Yáñez
#***********************************************************************************************************************************************************

#Load data
data <- read.csv(file="./www/data/derbiesPremier12131415.csv",head=TRUE,sep=",")




#Function that extract the derbies and results of the selected season
DataSeason<-function(year)
{ year2<-as.numeric(year)-1
  dateSeason <- as.Date(paste("30/06/", year, sep = ""), format='%d/%m/%Y')
  dateSeason2 <- as.Date(paste("30/06/", year2, sep = ""), format='%d/%m/%Y')
  
  dateData <- as.Date(data$Date, format='%d/%m/%Y')
  
  dataSeason<-data[which(dateData<dateSeason & dateData>dateSeason2),]
  
  dataSeason$Date<- as.Date(dataSeason$Date, format='%d/%m/%Y')
  #print(dataSeason$Date)

  return (dataSeason)
}