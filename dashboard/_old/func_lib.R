library(flexdashboard)
library(rio)
library(tidyverse)
library(XML)
library(httr)
library(RCurl)
library(sf)
library(lubridate)
library(leaflet)
library(colorspace)
library(DT)
library(zoo)
library(slider)
library(plotly)
library(waffle)
library(extrafont)
library(plyr)
library(extrafont)
library(waffle)
library(RColorBrewer)
library(leaflet.extras)
library(rmapshaper)

options(scipen=999)

# 
# plotly_mod_dep = function(p){
#   deps <- p$dependencies
#   deps_urls <- purrr::map(
#     deps,
#     ~if(.x$name == "plotly-basic") {
#       .x$src = list(file=getwd())
#       .x$script = "plotly-redirect-cdn-1.39.2.js"
#       .x
#     } else {
#       .x
#     }
#   )
#   p$dependencies <- deps_urls
#   p
# }