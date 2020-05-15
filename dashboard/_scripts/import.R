# Librerias
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
library(fontawesome)
library(rmapshaper)

options(scipen=999)



# Datos externos

nac <- rio::import("https://github.com/jincio/COVID_19_PERU/blob/master/reportes_minsa.xlsx?raw=true")

dep <- rio::import("https://github.com/jincio/COVID_19_PERU/blob/master/reportes_minsa.xlsx?raw=true", sheet = 3)

pop <- read_csv("data/peru_pop_stratum.csv") %>%
  group_by(dep_adm1) %>%
  dplyr::summarise(pop = sum(N)) %>%
  dplyr::mutate(REGION = toupper(dep_adm1))


LATAM <- read_csv ("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

shp <- st_read("Limite_departamental", stringsAsFactors = F)%>% 
  st_transform(4326) %>% 
  dplyr::select(Departamento = NOMBDEP)%>%
  ms_simplify(keep=0.0075)


# Variables globales

c.date <- max(dep$Fecha)
y.date <- as.Date(c.date) - 1 
today <- ymd(Sys.Date())
f.date <- min(dep$Fecha)

# https://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
# Rounds Up to a nice number, defined as a number divisible by those in the vector.
# Some other good choices of the "nice" vector above are: 1:10, c(1,5,10), seq(1, 10, 0.1),c(1,2,4,5,6,8,10)

roundUpNice <- function(x, nice=c(1,2,5,6,10)) {
  if(length(x) != 1) stop("'x' must be of length 1")
  10^floor(log10(x)) * nice[[which(x <= 10^floor(log10(x)) * nice)[[1]]]]
}
# roundUpNice(max(nac$pos.new))/5





