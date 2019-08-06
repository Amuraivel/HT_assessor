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
   titlePanel("HT Assessor"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     
     
     
      sidebarPanel(
        sliderInput("time_horizon",
                    "Time horizon:",
                    min = 0,
                    max = 100,
                    value = 20),
        selectInput("currency", "Currency:",
                    c( "EUR" = "EUR",
                       "USD" = "USD",
                      "AUD" = "AUD",
                      "BRL" = "BRL",
                      "CAD" = "CAD",
                      "CHF" = "CHF",
                      "CNY" = "CNY",
                      "GBP" = "GBP",
                      "INR" = "INR",
                      "JPY" = "JPY",
                      "MXP" = "MXP",
                      "NZD" = "NZD",
                      "ZAR" = "ZAR")),
        selectInput("discount","Discount",
                    c("Yes." = 1,
                    "No." = 0)),
        
        
        sliderInput("",
                    "Time horizon:",
                    min = 0,
                    max = 100,
                    value = 20), 
        
        
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
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
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

