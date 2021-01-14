library(shiny)
library(leaflet)

Eiffel_tower <- data.frame(
   lat = 48.85856,
   lng = 2.29450
)

EiffelSites <- c( "<a href='https://www.toureiffel.paris/fr/decouvrir/2-eme-etage'>Good catch, guy ! Visit the Tour Eiffel</a>")

# Define server logic required to draw a radius circle
shinyServer(function(input, output) {
       
        size <- reactive({
        input$meter
        })
        
        output$title1 <- renderText({
                paste0("My position with a radius of ", size(), " meters:")
        })
        
        output$mymap <- renderLeaflet({
                Eiffel_tower %>% 
                leaflet() %>% 
                addTiles() %>%
                addMarkers(popup = EiffelSites) %>%
                addCircles(weight=10, radius = size() , fillOpacity = 0, color = "#03F")
        }) 
        
        output$title2 <- renderText({
                "District around Eiffel Tower"
        })  
}
)
        
        
