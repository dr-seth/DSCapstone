################################################################################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                              Seth E Dobrin                                 ##
##                                                                            ##
##           Github Repo: https://github.com/drseth/DSCapstone                ##
##                                                                            ##
################################################################################

suppressPackageStartupMessages(c(
  require(shinythemes),
  require(shiny),
  require(tm),
  require(stringr),
  require(markdown),
  require(stylo)))

source('inputCleaner.R')
final4Data <- readRDS(file='final4Data.RData')
final3Data <- readRDS(file='final3Data.RData')
final2Data <- readRDS(file='final2Data.RData')


shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                textInput <- cleanInput(text)
                wordCount <- length(textInput)
                wordPrediction <- nextWordPrediction(wordCount,textInput)})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})