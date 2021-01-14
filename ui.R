library(shiny)
library(leaflet)

# Define UI for application that draws the circle by reaction
shinyUI(fluidPage(

    # Application title
    titlePanel("Which distance are you from the Eiffel Tower ?"),

    # Sidebar with a slider input for number of meters
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "meter",
                        label = "Distance in meters:",
                        min = 100,
                        max = 1000,
                        value = 500)
        ),
        
    # Draw the map around Eiffel Tower with a circle
         mainPanel(
             h3(textOutput("title1")),
             leafletOutput("mymap"),
             h3(textOutput("title2")) )
    )
))
