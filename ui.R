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
           tabPanel("Start", includeHTML("./views/start.html")),
           #Section Statistics     
           navbarMenu("Statistics",
                      
                      #Subsection Seasons
                      tabPanel("Seasons", sidebarLayout(
                        sidebarPanel( #Panel lateral con el input fecha
                          selectInput("Season", label = h3("Select Season"), 
                                      choices = list("2013" = 2013, "2014" = 2014, "2015" = 2015), 
                                      selected = 1),
                          includeHTML("./views/sidebar.html")
                        ),
                        mainPanel(  #Central panel
                          includeHTML("./views/statistics.html"),
                          (dataTableOutput('ResultsDerbiesSeason'))
                        )
                      )
                      ),#Closed Seasons
					  
					  
					  #Subsection Percentages
                      tabPanel("Percentages", sidebarLayout(
                        sidebarPanel( #Panel lateral con el input fecha
                          radioButtons("derbyTeam", label = h3("Derby Team"),
                                       choices = list("Home Team" = 1, "Away Team" = 2), 
                                       selected = 1),
                          includeHTML("./views/sidebar.html")
                        ),
                        mainPanel(  #Central panel
                          includeHTML("./views/percentages.html"),
                          p(strong("Victory: "), textOutput("victory")),
                          p(strong("Draw: "), textOutput("draw")),
                          p(strong("Defeat: "), textOutput("defeat"))

                        )
                      )
                      )#Closed Percentages
              
           ),#Closed Statistics
           
           #Help Section
           tabPanel("Help", includeHTML("./views/help.html"))
               
          )#Closed Menu         
    )#Closed taglist
)#Closed UI
