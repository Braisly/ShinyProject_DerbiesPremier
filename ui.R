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
    
    #Menú de navegación
    navbarPage("SciDB-R Project",theme = shinytheme("cerulean"),
           
           #Sección Inicio     
           tabPanel("Inicio", includeHTML("./views/inicio.html")),
           
           #Sección Gráficos, con submenús     
           navbarMenu("Gráficos",
                      
                      ),#Cierre Gráficos
               
           #Sección Datos estadísticos, con submenús     
           navbarMenu("Datos estadísticos",
                      
                      #Subsección Tendencias
                    
                  ),#Cierre Datos estadísticos
               
               #Seccion Ayuda
               tabPanel("Ayuda", includeHTML("./views/ayuda.html"))
               
          )#Cierre Menú         
    )#Cierre taglist
)#Cierre UI
