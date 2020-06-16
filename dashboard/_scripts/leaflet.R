palette_1 <- c("#ffffff",
               #"#fff3e3",
               "#ffe8c8",
               #"#ffddac",
               "#ffd291",
               "#ffc775",
               "#ffbc59",
               "#ffb139",
               "#ffa600",
               "#ea8a0a",
               "#d37011",
               "#ba5713",
               "#a04013",
               "#852a11",
               "#6a150c",
               "#4f0000")

palette_log <- c("#ffffff",
               #"#fff3e3",
               #"#ffe8c8",
               #"#ffddac",
               "#ffd291",
               "#ffc775",
               "#ffbc59",
               "#ffb139",
               "#ffa600",
               "#ea8a0a",
               "#d37011",
               "#ba5713",
               "#a04013",
               "#852a11",
               "#6a150c",
               "#4f0000")
map_tiles <- function(x) {
  x %>% 
    addTiles(urlTemplate = 'http://a.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
             options = providerTileOptions(minZoom = 5, maxZoom = 6))
}

map_bounds <- function(x) {
  x %>% setMaxBounds(lng1 = -90.648918,
                     lat1 = 4.991423,
                     lng2 = -59.605965,
                     lat2 = -23.920121) 
}

map_poly <-  function(x,y) {
  x %>%
    addPolygons(fillColor = pal.cases(log(y)),
                weight = 2,
                opacity = 1,
                color = "white",
                dashArray = "",
                fillOpacity = 0.7,
                highlight = highlightOptions(weight = 5,
                                             color = "#666",
                                             dashArray = "",
                                             fillOpacity = 0.7,
                                             bringToFront = TRUE),
                label = labels,
                labelOptions = labelOptions(style = list("font-weight" = "normal",
                                                         padding = "3px 8px"),
                                            textsize = "15px",
                                            direction = "auto")
                ) 
  
}


map_poly_log <-  function(x,y) {
  x %>%
    addPolygons(fillColor = pal.cases(y),
                weight = 2,
                opacity = 1,
                color = "white",
                dashArray = "",
                fillOpacity = 0.7,
                highlight = highlightOptions(weight = 5,
                                             color = "#666",
                                             dashArray = "",
                                             fillOpacity = 0.7,
                                             bringToFront = TRUE),
                label = labels,
                labelOptions = labelOptions(style = list("font-weight" = "normal",
                                                         padding = "3px 8px"),
                                            textsize = "15px",
                                            direction = "auto")) 
  
}
