library(shiny)
library(choroplethr)
library(choroplethrMaps)
data('df_state_demographics')

shinyUI( fluidPage(    #to let the project page stay and not get shut down immediately
  #application title
  titlePanel("USA census-Rewa Singh Chauhan"),
  
  #sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput( "num_colors",
                   "Number of colors:",
                   min=1,  #min value of slider
                   max=9,  #max 
                   value = 7),
      selectInput("select", label="select demographic:",
                  choices=colnames(df_state_demographics)[2:9], #items of dropdown from dataset file i.e col 2 to 
                  selected = 1),  #by default selection for the dropdown
      downloadButton('downloadData','Download')
      
      ),
    #show a plot of the generated distribution
    mainPanel(
      plotOutput("map"),
      dataTableOutput("table")
    )
  )
))
  

