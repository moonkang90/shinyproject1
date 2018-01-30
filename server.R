

shinyServer(function(input, output){
  
  
  
  
  
  output$pie1 <- renderGvis({
    data4 <- switch(input$var, 
                   "Percent NO2" = df_map[,c("State", "no2mean")],
                   "Percent O3" = df_map[,c("State", "o3mean")],
                   "Percent CO" = df_map[,c("State", "comean")],
                   "Percent SO2" = df_map[,c("State", "so2mean")])
   #1st tab of pie
    
    gvisPieChart(data4, labelvar = "State",
                 options = list(title="Highest level of pollution by States", 
                                height = 800, width = 1200,
                                pieHole=0.5))})
  
  
  
  #2nd tab of calendars
  
  output$calendar1 <- renderGvis({
    data <- switch(input$var, 
                   "Percent NO2" = "no2mean",
                   "Percent O3" = "o3mean",
                   "Percent CO" = "comean",
                   "Percent SO2" = "so2mean")
    
    gvisCalendar(df3, datevar="Date.Local", numvar=data,                 
                 options=list(
                   title="Calendar of Pollution Level From 2012 - 2016",
                   width = 1400, height = 800,
                   calendar = "{yearLabel: {fontName: 'Times-Roman',
                   fontSize: 32, color: '#cbb69d', bold: true},
                   cellSize: 15,
                   cellColor: { stroke: 'red', strokeOpacity: 0.001 },
                   focusedCellColor: {stroke: 'red'}}"))})
  

  

  
  #3rd tab of the maps
  
  output$map1 <- renderGvis({
    data2 <- switch(input$var, 
                   "Percent NO2" = "no2mean",
                   "Percent O3" = "o3mean",
                   "Percent CO" = "comean",
                   "Percent SO2" = "so2mean")
    gvisGeoChart(df_map, locationvar = "State", colorvar = data2,
                 option=list(title="United States Pollution Level", 
                             region="US", displayMode="regions",
                             resolution="provinces",
                             width="1000", height="700"))})  




  #4th tab of the histograms

  output$bar1 <- renderGvis({
    data3 <- switch(input$var, 
                   "Percent NO2" = "no2mean",
                   "Percent O3" = "o3mean",
                   "Percent CO" = "comean",
                   "Percent SO2" = "so2mean")
    gvisBarChart(df_map, xvar = "State",
                 yvar = data3,
                 options = list(title="Highest level of pollution by States", 
                                width=1200, height=600))}) 
 



  #5th tab of pure data table
  
  output$table <- DT::renderDataTable({
    datatable(df_map, rownames=FALSE) %>%
      formatStyle(input$selected,
                  background="skyblue", fontWeight='bold')})




     })

  
  
 
  


  
