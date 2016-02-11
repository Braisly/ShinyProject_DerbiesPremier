#**********************************************************************************************************************************************************
#TÍTULO: server.R
#
#AUTHOR: Brais López Yáñez
#***********************************************************************************************************************************************************


#Biblioteca shiny
library("shiny")
#Biblioteca shinyjs, con funciones JavaScript
library("shinyjs")
#Biblioteca para la creación de gráficos interactivos
library("dygraphs")
#Archivos que contienen las funciones necesarias para realizar las operaciones, modelos (lógia de negocio)
source("./models/functions.R")


function(input, output,session) 
{ 
  year <- reactive(input$Season)
  
  
  #output<-year
  
  
  #Generate Season Data
  output$ResultsDerbiesSeason <- renderDataTable({
    DataSeason(year())
  })
 
                                      
}

