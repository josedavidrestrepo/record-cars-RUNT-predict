library(shiny)
library(DT)
library(sqldf)
library(xts)
library(lubridate)

datos <-read.csv("predicciones.csv", header=T, sep=";")

datos$fecha <- parse_date_time(datos$fecha, "%d-%m-%Y")

datos$fecha <- as.Date(datos$fecha)

server <- function(input, output) {
  
  output$frame <- renderUI({
    tags$iframe(src="https://biteable.com/watch/embed/tae-1992701", height=500, width=800)
  })
  
  output$dateRangeText <- renderText({
    as.character(input$dateRange[1])
  })
  
  output$highchart <- renderHighchart({
    rango <- datos[datos$fecha >= input$dateRange[1] & datos$fecha <= input$dateRange[2],]
    
    hchart(xts(rango$unidades, rango$fecha))
  })
}