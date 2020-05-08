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



# Define UI for application that draws a histogram and boxplot

ui <- fluidPage(

    # Application title
    titlePanel("Our First Shiny App!"),

    sidebarLayout(
        sidebarPanel(
            textInput("name", "Enter your name"),
            numericInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30,
                        step = 5),
            radioButtons("fillColor",
                         "Bar color:",
                         choices = c("Red" = "indianred1", 
                                     "Green" = "green", 
                                     "Purple" = "purple",
                                     "Off White" = "seashell1"),
                         selected = "green"),
            selectInput("borderColor",
                        "Border color:",
                        choices = c("Black" = "black",
                                    "Gray" = "gray",
                                    "White" = "white",
                                    "Pink" = "pink"),
                        selected = "white")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           textOutput("greeting"),
           plotOutput("distPlot"),
           plotOutput("boxPlot")
        )
    )
)

# Define server logic required to draw a histogram

server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$fillColor, border = input$borderColor)
    })
    
    # output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[faithful$waiting >= input$mintime, 2]
    # 
    #     # draw the histogram with the specified number of bins
    #     ggplot(NULL, aes(x = x)) +
    #         geom_histogram(fill = input$fillColor, bins = input$bins,
    #                        color = input$borderColor)
    # 
    #     })
    
    output$boxPlot <- renderPlot({
        x    <- faithful[, 2]
        boxplot(x, col = input$fillColor, border = input$borderColor)

        # ggplot(NULL, aes(y = x)) +
        #     geom_boxplot(fill = input$fillColor, color = input$borderColor)
    })
    
    output$greeting <- renderText({
        paste0("Hello ", input$name, "!")
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
