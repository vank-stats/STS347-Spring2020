#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# In the preamble, we will load any packages we want to use and possibly also
# any functions or data sets that we will use.
library(shiny)
library(ggplot2)
colors <- c('red', 'blue', 'green')

MyTrim <- function( vec ){
    xmax <- max(vec)
    xmin <- min(vec)
    S <- sum(vec) - xmax - xmin
    L <- length(vec) - 2
    M <- S / L
    M
}

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Our First Shiny App!"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30,
                        step = 5),
            radioButtons("fillColor",
                         "Bar color:",
                         # choices = c("Red" = "indianred1", 
                         #             "Green" = "green", 
                         #             "Purple" = "purple",
                         #             "Off White" = "seashell1"),
                         choices = colors,
                         selected = "green"),
            sliderInput("mintime",
                        "Minimum Time for Graph",
                        min = 43,
                        max = 96,
                        value = 43),
            radioButtons("nothing",
                         "This doesn't work",
                         choices = unique(iris$Species))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[faithful$waiting >= input$mintime, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = input$fillColor, border = 'white')
    # })
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[faithful$waiting >= input$mintime, 2]

        # draw the histogram with the specified number of bins
        ggplot(NULL, aes(x = x)) +
            geom_histogram(fill = input$fillColor, bins = input$bins)
        
        })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
