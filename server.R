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
  year <- reactive(as.numeric(input$Season))
  
  
  
  output$victory <- renderPrint({ 
    cat(calculateStatistics(input$derbyTeam)[1])          
    })
  output$draw <- renderPrint({ 
    cat(calculateStatistics(input$derbyTeam)[2])          
  })
  output$defeat <- renderPrint({ 
    cat(calculateStatistics(input$derbyTeam)[3])          
  })
  
  
  #Generate Season Data
  output$ResultsDerbiesSeason <- renderDataTable({
    dataSeason(year())},
  options = list(rowCallback = I(
    'function(row,data,table) {
          if((data[0]-1)%3==0 | data[0] == 1)
            $("td", row).css("background", "yellow");
      }'
  ))
  )
  
 
                                      
}

