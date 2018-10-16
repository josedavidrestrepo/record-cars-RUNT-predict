library(shiny)
library(shinydashboard)
library(DT)
library(highcharter)

ui <- dashboardPage(
  dashboardHeader(title = "RUNT - Predicciones"),
  skin = "purple",
  dashboardSidebar(
    sidebarMenu(
      menuItem("Predicciones", tabName = "predicts", icon = icon("calendar", lib = "glyphicon")),
      menuItem("Reporte técnico", tabName = "report", icon = icon("briefcase", lib = "glyphicon")),
      menuItem("Video Promocional", tabName = "video", icon = icon("facetime-video", lib = "glyphicon")),
      menuItem("Archivos planos", tabName = "files", icon = icon("save-file", lib = "glyphicon")),
      menuItem("Código fuente", icon = icon("file-code-o"), href = "https://github.com/josedavidrestrepo/record-cars-RUNT-predict"),
      menuItem("Acerca de", tabName = "about", icon = icon("info-sign", lib = "glyphicon"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "predicts",
              fluidRow(
                  box(status = "warning", width = 5,
                      dateRangeInput('dateRange',
                                     label = 'Seleccione un rango de fechas para las cuáles desea predecir el número de vehículos registrados diariamente en el Registro Único Nacional de Tránsito (RUNT).',
                                     start = "2018-01-01", end = "2018-06-30",
                                     min = "2012-01-01", max = "2018-06-30",
                                     separator = "hasta", format = "yyyy/mm/dd",
                                     startview = 'year', language = 'es', weekstart = 1
                      )
                  ),
                  box(width = 12,
                      highchartOutput("highchart", height = "500px")
                  )
              )
      ),
      tabItem(tabName = "report",
               includeHTML("reporte.html")
      ),
      tabItem(tabName = "video",
              titlePanel("Video Promocional"),
              htmlOutput("frame")
      ),
      tabItem(tabName = "files",
          titlePanel("Archivos Planos"),
          sidebarPanel(
            selectInput("dataset", "Seleccione el conjunto de datos:",
                        choices = c("2012-2016", "2017", "2018-01")),
            downloadButton("downloadData", "Descargar")
          ),
          tableOutput('table')
      ),
      tabItem(tabName = "about",
              tags$div(
                tags$h1("Esta aplicación ha sido desarrollada por:"), 
                tags$br(),
                tags$ul(
                  tags$li("Angie Valeria Lopez Echeverry - anvlopezec@unal.edu.co"),
                  tags$li("Wendy Karen Rivera Tamayo - wkriverat@unal.edu.co"),
                  tags$li("Jose David Restrepo Duque - jodrestrepodu@unal.edu.co"),
                  tags$li("Helber Santiago Padilla Rocha - hspadillar@unal.edu.co"),
                  tags$li("Jose Alejandro Aristizabal Hoyos - jaaristizabalh@unal.edu.co"),
                  tags$li("Santiago Alvarez Soto - saalvarezso@unal.edu.co")
                ),
                tags$br(),
                tags$h4("No dudes en contactarnos si tienes alguna duda que podamos resolverte, o para que nos compartas tus necesidades y hacerte una solución a tu medida.")
                
              )
      )
    )
  )
)