#**********************************************************************************************************************************************************
#TÍTULO: ui.R
#
#AUTHOR: Brais López Yáñez
#***********************************************************************************************************************************************************


#Biblioteca de Shiny 
library("shiny")
#Biblioteca shinyjs, con funciones JavaScript
library("shinyjs")
#Biblioteca que carga themes de Bootstrap
library("shinythemes")
#Biblioteca para la creación de gráficos interactivos
library("dygraphs")


shinyUI(
  tagList(
    useShinyjs(),
    includeCSS("./www/css/sCustomization.css"),
    
    #Navigation Menu
    navbarPage("Derbies Premier League",theme = shinytheme("cerulean"),
           
           #Start Section     
           tabPanel("Start", includeHTML("./views/inicio.html")),
           #Sección Gráficos, con submenús     
           navbarMenu("Statistics",
                      
                      #Subsección Mapa Global
                      tabPanel("Seasons", sidebarLayout(
                        sidebarPanel( #Panel lateral con el input fecha
                          dateInput("dateMaps","Fecha: ",value=NULL,min="1500-01-01",max="2500-12-31",format = "yyyy-mm",startview="year",language="es"),
                          includeHTML("./views/sidebar.html")
                        ),
                        mainPanel(  #Panel central, inclusión de la descripción y mapa
                          includeHTML("./views/gMapaGlobal.html"),
                          div(id="divMap",imageOutput("map"))
                        )
                      )
                      ),#Cierre Mapa Global
                      
                      #Subsección Otros
                      tabPanel("Average", sidebarLayout(
                        sidebarPanel( #Panel lateral con los sliders selectores de años
                          sliderInput("siYear1","Año 1:",min=1854,max=2500,value=1900),
                          sliderInput("siYear2","Año 2:",min=1854,max=2500,value=2000),
                          includeHTML("./views/sidebar.html")
                        ),
                        mainPanel(  #Panel central, inclusión de la descripción y el gráfico
                          includeHTML("./views/gOtros.html")
                          #dygraphOutput('dgMeanSeasonal')
                        )
                      )
                      )#Cierre Otros
           ),#Cierre Gráficos

               
           #Help Section
           tabPanel("Help", includeHTML("./views/ayuda.html"))
               
          )#Closed Menu         
    )#Closed taglist
)#Closed UI
