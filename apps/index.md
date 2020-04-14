---
layout: default
permalink: /apps
title: Aplicaciones
---

Próximamemente podrás encontrar aqui aplicaciones interactivas.

[Revisa nuestros proyectos aquí](/proyectos) y [nuestra sección acerca de la pandemia de COVID-19](/proyectos/covid19)

## Listado
{% for app in site.shinyapp %}
 - [{{ app.title }}]({{ app.url }})
{% endfor %}
