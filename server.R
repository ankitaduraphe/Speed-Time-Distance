#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(car)    # Import library to use recode() function

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    # Calculate the distance  
    observe({
        input$action_Calc
        values$int <- isolate({
            input$num_time * recode(input$select_time, "1 = '3600'; 2 = '60'; 3 = '1'") * 
                input$slider_speed * recode(input$select_speed, "1 = '0.277777778'; 2 = '1'")
        })
    })
    
    # Display the calculated values
    output$num_distance <- renderText({
        if(input$action_Calc == 0) ""
        else
            paste("Distance:", round(values$int, 0), "meter(s)")
    })
    
})
