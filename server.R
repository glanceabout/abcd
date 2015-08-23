#install.packages("shiny")
library(shiny)


number <- floor(runif(1,1,101))

numberGuessed <- function(a, number) {
        returnValue <- "Nothing entered yet."
        if (a > 100) {
               
                returnValue <- 'Above 100.\nPlease make a selection between 1 and 100.'
        }
        else if (a < 1) {
              
                returnValue <- 'Below 1.\nPlease make a selection between 1 and 100.'
        }
        else if (a > n) {
                returnValue <- 'Higher than the number.'
        }
        else if (a < n) {
                returnValue <- 'Lower than the number.'
        }
        else if (a == n) {
                returnValue <- 'Correct!'
        }
        returnValue
}
shinyServer( 
        function(input, output) {
                output$inputValue <- renderPrint({as.numeric(input$a)})
                #output$outputValue <- renderText({numberGuessed(input$guess, number)})
                output$outputValue <- renderText({
                        if (input$goButton == 0) "You have not guessed a number yet"
                        else if (input$goButton >= 1) numberGuessed(as.numeric(input$a), n)
                })
        }
)