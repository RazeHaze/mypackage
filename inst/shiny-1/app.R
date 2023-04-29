library(shiny)
# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("myttest example shiny server"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: slider for number of observations in sample
      sliderInput(inputId = "obs",
                  label = "number of observations",
                  min = 10,
                  max = 100,
                  value = 30),

      #sets the means and standard deviations for the random data, samples x and y
      numericInput(inputId = "xmean",
                   label = "mean of x data",
                   value = 0),

      numericInput(inputId = "ymean",
                   label = "mean of y data",
                   value = 0),

      numericInput(inputId = "xstd",
                   label = "standard deviation of x data",
                   value = 1),

      numericInput(inputId = "ystd",
                   label = "standard deviation of y data",
                   value = 1),

      #alpha value for the t test
      numericInput(inputId = "a",
                   label = "alpha",
                   value = .05),

      #seed for rnorm
      numericInput(inputId = "seed",
                   label = "Random Seed",
                   value = 30),

      #option for if data is paired or not
      radioButtons("pair_choice","Is the data paired?",
                   c("Yes" = "paired",
                     "No"  = "unpaired")),

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: plots ----
      plotOutput(outputId = "distPlot")

    )
  )
)

# Define server logic required to draw the plots ----
server <- function(input, output) {


  output$distPlot <- renderPlot({

    set.seed(input$seed) #sets seed for rnorm

    #configures x and y data sets, based on inputs from panel
    xdata = rnorm(input$obs,input$xmean,input$xstd)
    ydata = rnorm(input$obs,input$ymean,input$ystd)

    pair_choice = switch(input$pair_choice, #true or false for paired plot or not
                         "paired" = TRUE,
                         "unpaired"  = FALSE )

    obj = mypackage::myttest(xdata,ydata, input$a, pair_choice)
    plot(obj) #plots the final result
  })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
