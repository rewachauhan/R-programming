library(shiny)
library(choroplethr)
library(choroplethrMaps)

shinyServer(function(input,output){
  output$map <- renderPlot({   #to retrieve the output from wherever the calculation is being made
    data('df_state_demographics')
    df_state_demographics$value = df_state_demographics[,input$select] #to select cols
    state_choropleth(df_state_demographics,
                     title = input$select,
                     num_colors = input$num_colors)
  })
  output$table <- renderDataTable({
    data("df_state_demographics")
    df_state_demographics[.c('region',input$select)]
  }) 
  
})