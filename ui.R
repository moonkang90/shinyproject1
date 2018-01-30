


shinyUI(dashboardPage(
  
  skin = "green",
  
  dashboardHeader(title = "AIR POLLUTION", titleWidth = 200),
  dashboardSidebar(
    width = 200,
    sidebarUserPanel(
      tags$head(tags$style(HTML('.info {
                                background-color: transparent;
                                }'))),
      name = h3('Moon Kang'), 
      image = "http://jonvilma.com/images/tree-1.jpg"),
   
    
    sidebarMenu(
      
      menuItem(h5("Pie Charts"), tabName = "pie", icon = icon("bookmark-o")),
      menuItem(h5("Calendar Charts"), tabName = "calendar", icon = icon("calendar-check-o")),                  #first menu       
      menuItem(h5("Map Charts"), tabName = "map", icon = icon("map-o")),                    #second menu
      menuItem(h5("Bar Charts"), tabName = "bar", icon = icon("bar-chart-o")),               #third menu
      menuItem(h5("Data Table"), tabName = "data", icon = icon("database")))),                        #fifth menu
  
  dashboardBody(
    selectInput("var", 
                label = "Choose a pollution type",
                choices = c("Percent NO2", "Percent O3",
                            "Percent CO", "Percent SO2"),
                selected = "Percent NO2"),
    
    
    
    
    
    tabItems(
      
     #first tab  
      
      tabItem( 
              tabName = "pie", 
              fluidRow(box(htmlOutput("pie1"),
                           width = 12, height = 850))),
        
        
      #second tab
      
      tabItem(
              tabName = "calendar", 
              fluidRow(box(htmlOutput("calendar1"),
                           width = 12, height = 800))),
                       
     
           

      
     #third tab
      
      tabItem(
                tabName = "map",
                fluidRow(box(htmlOutput("map1"), 
                             width = 11, height = 800))),
                         
            
      
    
      #fourth tab               
                       
                       
        tabItem(
                 tabName = "bar",
                 fluidRow(box(htmlOutput("bar1"),
                              width = 12, height = 650))),
            
     
      #fifth tab
     
         
     

        tabItem(
              tabName = "data",
              fluidRow(box(dataTableOutput("table"),
                           width = "300px", height = "300px")))

     
       
    
  ))
))






