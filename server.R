library(shiny)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$frame <- renderUI({
    tags$iframe(src="https://biteable.com/watch/embed/tae-1992701", height=500, width=800)
  })
}