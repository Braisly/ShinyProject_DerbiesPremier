#**********************************************************************************************************************************************************
#TÍTULO: server.R
#
#DESCRIPCIÓN: Archivo encargado de llevar a cabo la lógica de negocio, se realizan las llamadas a los otros archivos que tienen implementada la funcionalidad.  
#
#AUTOR: Brais López Yáñez
#***********************************************************************************************************************************************************


#Biblioteca shiny
library("shiny")
#Biblioteca shinyjs, con funciones JavaScript
library("shinyjs")
#Biblioteca para la creación de gráficos interactivos
library("dygraphs")
#Archivos que contienen las funciones necesarias para realizar las operaciones, modelos (lógia de negocio)
source("./models/cargarTemperaturas.R")
source("./models/generarGraficos.R")
source("./models/generarMapa.R")
source("./models/library/rFunctions.R")
source("./models/library/shinyFunctions.R")
source("./models/cargarTendencias.R")


function(input, output,session) 
{ 

  #Generación de fecha para Mapa global, reutilizable
  monthYear<-reactive({
                        generarData(input$dateMaps)
    })
  
  #Generación de fecha para proyecciones en Datos estadísticos 
  monthYear2<-reactive({
                        generarData(input$dateTemperatures)
  })
  
 
  #Generación de Mapa global, Gráficos
  output$map<-renderImage({ #Comprobación data correcta, estado de la operación y generación de la imagen
                            checkDateCal(monthYear()[2])
                            progressBar(generarMapa(monthYear()[1],monthYear()[2]),6,12,session)
                            list(src="./www/images/map.png")
                            
                          },deleteFile=FALSE)
  
  
  #Generación de Otros, Gráficos
  output$dgMeanSeasonal <- renderDygraph({  #Generación del gráfico de medias temporales con estado de la operación  
                                            progressBar(dygraph(generarGrafico(input$siYear1,input$siYear2),main="Comparación de medias temporales",ylab="Temperatra [Cº]",xlab="Tiempo"),7,10,session)
    
  })
  
  
  
  #Generación de Tendencias, Datos estadísticos
  output$dtTrend <- renderDataTable({ #Carga de la tabla con los coeficientes y barra de progreso
                                      progressBar(cargarTrend(),8,10,session) 
                                    })
  

  #Generación de Proyecciones, Datos estadísticos, temperaturas pasadas
  observeEvent(input$bPastTemperatures,
  {
      #Mostrar el input Date y la tabla con las temperaturas pasadas
      shinyjs::show("dateTemperatures")
      output$tDateTemperatures<-renderText("Elija una fecha pasada:")
      shinyjs::show("dtcoordTemperatures")
      
      #Generación tabla temperaturas pasadas
      output$dtcoordTemperatures <- renderDataTable({ #Comprobación data válida y generación de tabla con estado de la operación
                                                      checkDatePast(monthYear2()[2])
                                                      progressBar(generarTempPas(monthYear2()[1],monthYear2()[2]),9,10,session)
                                                  })
            
    })
  
  
  #Generación de Proyecciones, Datos estadísticos, temperaturas calculadas  
  observeEvent(input$bCalculatedTemperatures,
  {
    #Mostrar el input Date y la tabla con las temperaturas calculadas
    shinyjs::show("dateTemperatures")
    output$tDateTemperatures <- renderText("Elija una fecha para calcular su proyección en base a la tendencia:")
    shinyjs::show("dtcoordTemperatures")  
  
    #Generación tabla temperaturas calculadas
    output$dtcoordTemperatures <- renderDataTable({ #Comprobación data válida y generación de tabla con estado de la operación
                                                    checkDateCal(monthYear2()[2])
                                                    progressBar(generarTempCal(monthYear2()[1],monthYear2()[2]),5,12,session)
                                                  })
  })
 
  
#Generación de Zonas extremas
output$dtExtremeZones <- renderDataTable({  #Generación Zonas extremas con estado de la operación
                                            progressBar(generarZonasExtremas(),7,8,session)
                                        })
                                      
}

