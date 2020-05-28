#icon_svg_path <- "M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"
# icon_svg_path = "M19.404,6.65l-5.998-5.996c-0.292-0.292-0.765-0.292-1.056,0l-2.22,2.22l-8.311,8.313l-0.003,0.001v0.003l-0.161,0.161c-0.114,0.112-0.187,0.258-0.21,0.417l-1.059,7.051c-0.035,0.233,0.044,0.47,0.21,0.639c0.143,0.14,0.333,0.219,0.528,0.219c0.038,0,0.073-0.003,0.111-0.009l7.054-1.055c0.158-0.025,0.306-0.098,0.417-0.211l8.478-8.476l2.22-2.22C19.695,7.414,19.695,6.941,19.404,6.65z M8.341,16.656l-0.989-0.99l7.258-7.258l0.989,0.99L8.341,16.656z M2.332,15.919l0.411-2.748l4.143,4.143l-2.748,0.41L2.332,15.919z M13.554,7.351L6.296,14.61l-0.849-0.848l7.259-7.258l0.423,0.424L13.554,7.351zM10.658,4.457l0.992,0.99l-7.259,7.258L3.4,11.715L10.658,4.457z M16.656,8.342l-1.517-1.517V6.823h-0.003l-0.951-0.951l-2.471-2.471l1.164-1.164l4.942,4.94L16.656,8.342z"


icon_svg_path <-"M12.871,9.337H7.377c-0.304,0-0.549,0.246-0.549,0.549c0,0.303,0.246,0.55,0.549,0.55h5.494c0.305,0,0.551-0.247,0.551-0.55C13.422,9.583,13.176,9.337,12.871,9.337z M15.07,6.04H5.179c-0.304,0-0.549,0.246-0.549,0.55c0,0.303,0.246,0.549,0.549,0.549h9.891c0.303,0,0.549-0.247,0.549-0.549C15.619,6.286,15.373,6.04,15.07,6.04z M17.268,1.645H2.981c-0.911,0-1.648,0.738-1.648,1.648v10.988c0,0.912,0.738,1.648,1.648,1.648h4.938l2.205,2.205l2.206-2.205h4.938c0.91,0,1.648-0.736,1.648-1.648V3.293C18.916,2.382,18.178,1.645,17.268,1.645z M17.816,13.732c0,0.607-0.492,1.1-1.098,1.1h-4.939l-1.655,1.654l-1.656-1.654H3.531c-0.607,0-1.099-0.492-1.099-1.1v-9.89c0-0.607,0.492-1.099,1.099-1.099h13.188c0.605,0,1.098,0.492,1.098,1.099V13.732z"

# Prueba
infobutton <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra ...');
    }"
  )
)





## Lineal 
infobutton_1 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos nuevos por día (barras) y casos acumulados (línea naranja) en escala lineal a nivel nacional. La escala lineal sirve para visualizar la suma contínua de casos.');
    }"
  )
)

# Logaritmico
infobutton_2 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos nuevos por día (barras) y casos acumulados (línea naranja) en escala logarítmica a nivel nacional. La escala logarítmica sirve para visualizar la multiplicación de los casos y observar si la curva se aplana.');
    }"
  )
)


infobutton_1_2 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos nuevos por día (barras) y casos acumulados (línea naranja) en escala lineal o logarítmica a nivel nacional.<br> La escala lineal sirve para visualizar la suma contínua de casos </br>. <br>La escala logarítmica sirve para visualizar la multiplicación de los casos y observar si la curva se aplana.</br>');
    }"
  )
)
infobutton_3 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos nuevos por día (barras) y la media móvil (línea naranja) a 7 días a nivel nacional. La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.');
    }"
  )
)


infobutton_4 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos acumulados en escala logarítmica desde el día del primer reporte a nivel nacional. Las líneas punteadas corresponden a las pendientes de duplicación de casos cada 1 a 4 días; una pendiente más inclinada implica la duplicación de casos en menor tiempo.');
    }"
  )
)



infobutton_5 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la proporción de casos acumulados según estado en escala lineal a nivel nacional.');
    }"
  )
)


infobutton_6 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la proporción de casos acumulados según estado a nivel nacional.' 
);
    }"
  )
)



infobutton_7 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra los casos nuevos por día (barras) y la media móvil (línea naranja) a 7 días por departamento. La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.');
    }"
  )
)


infobutton_8 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la media móvil (línea naranja) a 7 días por millón de habitantes por departamento comparado a la misma media móvil reportada en otros departamentos. La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.');
    }"
  )
)

infobutton_9 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la media móvil (línea naranja) a 7 días desde el día del primer reporte de casos por departamento comparado a la misma media móvil reportada en otros departamentos  La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.'); }"
  )
)


infobutton_10 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la media móvil (línea naranja) por país comparado a la misma media móvil reportada en otros países de América Latina. La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.');
    }"
  )
)



# Prueba
infobutton11 <- list(
  name = "Información",
  icon = list(
    path = icon_svg_path,
    transform = "scale(0.84) translate(-1, 0)"
  ),
  click = htmlwidgets::JS(
    "function(gd) { 
      alert('Muestra la proporción de resultados pruebas realizadas por día (barras) y la media móvil de casos nuevos (línea naranja) a 7 días a nivel nacional. La media móvil muestra el valor promedio de los casos reportados en un periodo determinado.');
    }"
  )
)
