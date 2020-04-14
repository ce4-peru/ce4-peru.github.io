---
title: "﻿Datos COVID19-Perú"

description: "Esta es una página pública de recursos abiertos para centralizar información sobre los datos de casos COVID19 para Perú."

status: under-review

update: 2020-04-13
  
---
<html>
    <head>
        <meta lang="es" />
        <meta charset="utf-8" />
    </head>  
    <body style="max-width: 1024px; margin: 30px auto;">
        <p>Esta es una página pública de recursos abiertos para centralizar información sobre los datos de casos COVID19 para Perú.</p>
        <p><a target="_blank" href="https://github.com/ce4-peru/covid19">Repositorio de Github</a></p>
		<p>Última actualización: <b id="fecha1"></b></p>
        <div>
            <h3>Datos de casos COVID19 e información asociada a la epidemia en Perú</h3>
            <p>Nuestras bases de <a target="_blank" href="https://github.com/ce4-peru/covid19/tree/master/data/crudas">datos crudos</a> se compilan a partir de fuentes disponibles y abiertas en la web, principalmente sitios web oficiales de salud pública a nivel provincial y/o regional, y se complementan con información de diarios locales.</p>
            <p>Actualizamos una vez al día alrededor de las 22:00 hora de Lima.</p>
            <p>Estas bases de datos contiene un número diario informado de casos confirmados positivos y fuentes.</p>
            <p>Los datos anteriores al 23 de marzo de 2020 se recuperaron retroactivamente de fuentes abiertas en la web. Los datos del 23 de marzo de 2020 en adelante se recopilan diariamente directamente de los sitios.</p>
        </div>
        <div>
            <h3>Curación de datos</h3>
            <p>Nuestra <a target="_blank" href="https://github.com/ce4-peru/covid19/tree/master/data/modificadas">base de datos curados</a>:</p>
            <ul>
                <li>Pone toda la información en un formato consistente</li>
                <li>Calcula la incidencia diaria a partir de casos acumulativos</li>
                <li>Corrige errores menores (usando este <a target="_blank" href="https://github.com/ce4-peru/covid19/tree/master/Scripts/CÓDIGO LIMPIEZA BASE INDIVIDUAL_CA_MD.R">código</a> para la base de datos de casos individuales y este <a target="_blank" href="https://github.com/ce4-peru/covid19/tree/master/Scripts/CÓDIGO LIMPIEZA BASE AGREGADA POR DIA_CA_MD.R">código</a> para la base de datos agregados por día)</li>
                <li>Cuando es posible, utilizamos informes resumidos del sitio web de la <a target="_blank" href="https://www.dge.gob.pe/portal/">Dirección General de Epidemiología</a> para verificar nuestra corrección de errores y la certeza de nuestro datos.</li>
            </ul>
        </div>
        <div>
            <h3>Gráficos epidemiólogicos</h3>
            <p>Estos gráficos se generan utilizando los datos seleccionados.</p>
            <p>Última actualización: <b id="fecha2"></b></p>
            <div style="text-align: center;">
                <img style="padding: 2%; box-sizing: border-box;width: 60%;display: inline-block;" src="covid19-peru/pruebas_vs_positivos_COVID19.png" alt="">
                <img style="width: 100%; padding: 2%; box-sizing: border-box;" src="covid19-peru/Mapa de incidencias regionales de COVID19.png" alt="">
            </div>
        </div>
        <div>
            <h3>Contactos</h3>
            <p>Si tiene alguna pregunta sobre los datos, comuníquese por correo electrónico.</p>
            <p>Administradora: </p>
            <ul>
                <li>Micaela De la Puente (virginia.de.la.puente@upch.pe)</li>
            </ul>
            <p>Investigador Principal:</p>
            <ul>
                <li>Ricardo Castillo Neyra (cricardo@upenn.edu)</li>
            </ul>
        </div>
        <div>
            <h3>Términos de Uso</h3>
            <p>Esta página de GitHub, sus contenidos en este documento, y todos los datos pertenecen al Laboratorio de Investigación de Enfermedades Zoonóticas, un consorcio entre la Universidad Peruana Cayetano Heredia (Perú) y la Universidad de Pensilvania (EE.UU). Todos los derechos reservados, se proporcionan al público estrictamente con fines de investigación académica y educativa. Los datos aquí proporcionados provienen de múltiples fuentes disponibles públicamente que no siempre concuerdan. El proceso de curación involucra en algunos casos consenso para dirimir sobre las discordancias de datos entre fuentes. La metodología para la obtención de datos no ofrece garantías sobre la precisión y la idoneidad de las base de datos para ciertos. Se prohíbe estrictamente el uso de este sitio web para el comercio.</p>
        </div>
        <script type="text/javascript">
            function actualizarFecha(fecha) {
              document.querySelector("#fecha1").innerText = fecha;
              document.querySelector("#fecha2").innerText = fecha;
            };
            //--------------------------------------->
            //Aqui se tiene que actualizar la fecha-->
            actualizarFecha('13 de abril 22:21 hora de Perú');
            //--------------------------------------->
        </script>  
</body>		