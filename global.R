library(ggplot2)
library(dplyr)
library(shiny)
library(googleVis)
library(maps)
library(mapproj)
library(datasets)
library(shinydashboard)
library(devtools)
library(DT)
library(data.table)
library(shinythemes)


df3 <- fread(file = "df3.csv")
df3$Date.Local = as.Date(df3$Date.Local)
df3 <- df3 %>%
  filter(Date.Local >= "2012-01-01")

df_map <- fread(file = "df_map.csv")
