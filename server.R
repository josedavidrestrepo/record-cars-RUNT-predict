library(shiny)
library(DT)
library(sqldf)
library(xts)
library(lubridate)

datos <-read.csv("predicciones.csv", header=T, sep=";")

datos$fecha <- parse_date_time(datos$fecha, "%d-%m-%Y")

datos$fecha <- as.Date(datos$fecha)

ds1216 <- read.delim("2012-2016.txt")
ds2017 <- read.delim("2017.txt")
ds2018 <- read.delim("2018-01.txt")

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
  
  output$downloadData <- downloadHandler(
    filename <- function() {
      paste(input$dataset, "txt", sep=".")
    },
    
    content <- function(file) {
      file.copy(paste(input$dataset, "txt", sep="."), file)
    }
  )
  
  datasetInput <- reactive({
    switch(input$dataset,
           "2012-2016" = ds1216,
           "2017" = ds2017,
           "2018-01" = ds2018)
  })
  
  output$table <- renderTable({
    datasetInput()
  })
}