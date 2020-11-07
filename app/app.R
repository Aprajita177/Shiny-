#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Cereal Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("carbo","Amount of carbohydrate:",min = -1.0,max = 23,value = 16)),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("carbohydratePlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$carbohydratePlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <-10:100
        sodium <- seq(min(x), max(x), length.out = input$carbo +1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = sodium, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
