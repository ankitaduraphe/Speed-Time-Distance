#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Distance Measurement"),
    sidebarLayout(
        sidebarPanel(
            helpText("To calculate distance:"),            
            br(),   
            
            numericInput("num_time",
                         label = h6("Enter time"),
                         value = 0, min = 0),
            selectInput("select_time",
                        label = h6(""),
                        choices = list("Hours" = 1,
                                       "Minutes" = 2,
                                       "Seconds" = 3),
                        selected = 1),
            br(), 
            
            sliderInput("slider_speed",
                        label = h6("Enter speed"),
                        min = 2, max = 4.5, value = 2),
            selectInput("select_speed",
                        label = h6(""),
                        choices = list("km/hr" = 1,
                                       "m/s" = 2),
                        selected = 1),
            br(),
            br(),            
            actionButton("action_Calc", label = "Calculate")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         p(h5("Calculated value:")),
                         textOutput("num_distance"),
                )
            )
        )
    )
))