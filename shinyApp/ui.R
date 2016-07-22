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

shinyUI(navbarPage("Coursera Data Science Capstone", 
                   
                   theme = shinytheme("cosmo"),
                   
                   ############################### ~~~~~~~~1~~~~~~~~ ##############################  
                   ## Tab 1 - Prediction
                   
                   tabPanel("Predict-O-Matic",
                            
                            tags$head(includeScript('ga-shinyapps-io.js')),
                            
                            fluidRow(
                                    
                                    column(3),
                                    column(6,
                                           tags$div(textInput("text", 
                                                              label = h3("Enter your phrase here:"),
                                                              value = ),
                                                    tags$span(style="color:darkgrey",("English is the only supported language.")),
                                                    br(),
                                                    tags$hr(),
                                                    h4("The next word is:"),
                                                    tags$span(style="color:darkgreen",
                                                              tags$strong(tags$h3(textOutput("predictedWord")))),
                                                    br(),
                                                    tags$hr(),
                                                    h4("Your phrase:"),
                                                    tags$em(tags$h4(textOutput("enteredWords"))),
                                                    align="left")
                                    ),
                                    column(3)
                            )
                   ),
                   
                   ############################### ~~~~~~~~2~~~~~~~~ ##############################
                   ## Tab 2 - About 
                   
                   tabPanel("About This Application",
                            fluidRow(
                                    column(2,
                                           p("")),
                                    column(8,
                                           includeMarkdown('about.md')),
                                    column(2,
                                           p(""))
                            )
                   ),
                   
                   ############################### ~~~~~~~~F~~~~~~~~ ##############################
                   
                   ## Footer
                   
                   tags$hr(),
                   
                   tags$br(),
                   
                   tags$span(style="color:darkgrey", 
                             tags$footer(("© 2016 - "), 
                                         tags$a(
                                                 href="https://github.com/dr-seth",
                                                 target="_blank",
                                                 "Seth E Dobrin, PhD"), 
                                         tags$br(),
                                         ("Built with"), tags$a(
                                                 href="http://www.r-project.org/",
                                                 target="_blank",
                                                 "R"),
                                         ("&"), tags$a(
                                                 href="http://shiny.rstudio.com",
                                                 target="_blank",
                                                 "Shiny"),
                                         ("on the "), tags$a(
                                           href="http://datascience.ibm.com",
                                           target="_blank",
                                           "IBM Data Science Experience."),
                                         #                       ("&"), tags$a(
                                         #                               href="http://www.rstudio.com/products/shiny/shiny-server",
                                         #                               target="_blank",
                                         #                               "Shiny Server."),
                                         #                       ("Hosted on"), tags$a(
                                         #                               href="https://www.digitalocean.com/?refcode=f34ade566630",
                                         #                               target="_blank",
                                         #                               "DigitalOcean."),
                                         
                                         align = "left"),
                             
                             tags$br()
                   )
)
)