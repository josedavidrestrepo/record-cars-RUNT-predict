library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
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
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      tabItem(tabName = "report",
              includeHTML("reporte.html")
      ),
      tabItem(tabName = "video",
              htmlOutput("frame")
      ),
      tabItem(tabName = "files"

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