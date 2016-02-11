#**********************************************************************************************************************************************************
#TÍTULO: ui.R
#
#AUTHOR: Brais López Yáñez
#***********************************************************************************************************************************************************


#Biblioteca de Shiny 
library("shiny")
#Themes Bootstrap
library("shinythemes")



shinyUI(
  tagList(
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
                          selectInput("Season", label = h3("Select Season"), 
                                      choices = list("2013" = 2013, "2014" = 2014, "2015" = 2015), 
                                      selected = 1),
                          includeHTML("./views/sidebar.html")
                        ),
                        mainPanel(  #Panel central, inclusión de la descripción y mapa
                          includeHTML("./views/gMapaGlobal.html"),
                          (dataTableOutput('ResultsDerbiesSeason'))
                        )
                      )
                      )#Closed Seasons
              
           ),#Closed Statistics
           
           #Help Section
           tabPanel("Help", includeHTML("./views/ayuda.html"))
               
          )#Closed Menu         
    )#Closed taglist
)#Closed UI
