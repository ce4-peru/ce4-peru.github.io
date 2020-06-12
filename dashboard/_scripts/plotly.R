
plotly_config <- function(x,y) {
  x %>% config(locale = "es",
               displaylogo=F,
               modeBarButtonsToRemove = c("select2d","zoom2d","lasso2d",
                                          "drawclosedpath","drawopenpath",
                                          "hoverClosestCartesian","hoverCompareCartesian",
                                          "toggleHover","toggleSpikelines",
                                          "autoScale2d"),
               modeBarButtonsToAdd = list(y),
               responsive = T,
               displayModeBar = T
  )
}



plotly_layout <- function(x) {
  x %>% layout(paper_bgcolor="black",
               plot_bgcolor="black",
               hoverdistance = 50,
               hovermode = "closest",
               dragmode="pan",
               margin = list(l=65, r=65, b=40, t=50),
               autosize=T
  )
}

plotly_layout_2 <- function(x) {
  x %>% layout(paper_bgcolor="black",
               plot_bgcolor="black",
               hoverdistance = 50,
               hovermode = "closest",
               dragmode="pan",
               margin = list(l=65, r=65, b=125, t=50),
               autosize=T
  )
}

plotly_end<- function(x) {
  x %>% partial_bundle() %>% 
  htmlwidgets::onRender('function(el, x) {
                         $("[data-title=\'Información\'] svg path").css("fill", "#f6e486");
                         $("[data-title=\'Información\'] svg").css("width","2em");
                        }')
}
plotly_layout_group <- function(x) {
  x %>% layout(paper_bgcolor="black",
               plot_bgcolor="black",
               hoverdistance = 10,
               hovermode = "closest",
               dragmode="pan",
               margin = list(l=75, r=0, b=65, t=60),
               autosize=T
  )
}

plotly_layout_group_2 <- function(x) {
  x %>% layout(paper_bgcolor="black",
               plot_bgcolor="black",
               hoverdistance = 10000,
               hovermode = "all",
               dragmode="pan",
               margin = list(l=75, r=0, b=65, t=60),
               autosize=T
  )
}


# %>%
#   add_segments(x = "2020-03-15", xend = "2020-03-15", 
#                y = 0, yend=roundUpNice(max(nac$pos.new)),
#                text="2020-04-08",name="Estado de Emergencia",
#                hovertemplate = paste('<b>%{text}</b>'),
#                legendgroup = 'group2',
#                width=2, 
#                line = list(color = "#7aa82a", 
#                            width = 3, 
#                            dash = "dot")
#   ) %>%
#   add_segments(x = "2020-03-26", xend = "2020-03-26", 
#                y = 0, yend=roundUpNice(max(nac$pos.new)),
#                text="2020-04-08",name="1ra ampliación",
#                hovertemplate = paste('<b>%{text}</b>'),
#                legendgroup = 'group2',
#                width=2, 
#                line = list(color = "#7aa82a", 
#                            width = 3, 
#                            dash = "dot")
#                ) %>%
#   add_segments(x = "2020-04-23", xend = "2020-04-23", 
#                y = 0, yend=roundUpNice(max(nac$pos.new)),
#                text="2020-04-08",name="3ra ampliación",
#                hovertemplate = paste('<b>%{text}</b>'),
#                legendgroup = 'group2',
#                width=2, 
#                line = list(color = "#7aa82a", 
#                            width = 3, 
#                            dash = "dot")
#                ) 
