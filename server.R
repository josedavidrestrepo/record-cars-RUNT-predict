library(shiny)
library(DT)
library(sqldf)

server <- function(input, output) {
  
  output$frame <- renderUI({
    tags$iframe(src="https://biteable.com/watch/embed/tae-1992701", height=500, width=800)
  })
  
  output$dateRangeText <- renderText({
    as.character(input$dateRange[1])
  })
  
  output$table <- renderDataTable({
    query_dias <- paste("SELECT fecha AS Fecha FROM autos WHERE fecha >= '", as.character(input$dateRange[1]), sep="")
    query_dias <- paste(query_dias, "' AND fecha <= '", sep="")
    query_dias <- paste(query_dias, as.character(input$dateRange[2]), sep="")
    query_dias <- paste(query_dias, "'", sep="")
    
    autos_data_set <- sqldf(query_dias, dbname = "db")
    
    datatable(
      autos_data_set, rownames = FALSE,
      options = list(lengthChange = FALSE, dom = 'tlipr'),
      selection = list(mode = 'single', target = 'row', selected = c(1)),
      filter = 'bottom'
    ) %>% formatStyle(0, cursor = 'pointer')
  })
}