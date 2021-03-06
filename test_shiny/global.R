library(dplyr)
library(shiny)
library(leaflet)
library(leaflet.minicharts)
library(highcharter)

eco2mix<-read.csv2("data1.csv",header=TRUE,na.strings=c("NA","","NULL","NaN"),sep=";",dec=",")
data(diamonds, economics_long, mpg, package = "ggplot2")
#regions<-read.csv2("data2.csv",header=TRUE,na.strings=c("NA","","NULL","NaN"),sep=";",dec=",")
#data("regions")
#data("eco2mix")

# Remove data for the whole country
prodRegions <- eco2mix %>% filter(area != "France")

# Production columns
prodCols <- names(prodRegions)[6:13]

# Create base map
tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

basemap <- leaflet(width = "100%", height = "400px") %>%
  addTiles(tilesURL) #%>%
  #addPolylines(data = regions, color = "brown", weight = 1, fillOpacity = 0)


