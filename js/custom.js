$(function(){
  $("#categorias").tabs({
      active: 0,                    
      event: "mouseover",
      heightStyle: "auto"
  });

  $( "#clic-aqui" ).click(function() {
    $("#categorias").tabs({
      active: 3
    });
  });
  
  $.ajax({
    url: "formato-publicaciones.csv",
    async: false,
    success: function (csvd) {
      var items = $.csv.toObjects(csvd);
      
      var div_titulo = '';
      var div_estado = '';
      var div_fecha_publicacion = '';
      var div_fecha_actualizacion = '';
      var div_descripcion = '';
      var div_link = ''
      for (var i = 0; i < items.length; i++) {
        //Envoltura para el cuerpo del item
        var div_wrapper = document.createElement('div');
        div_wrapper.className = 'wrapper';
        //*Item internos del wrapper
        // - Titulo
        div_titulo = document.createElement('h3');
        div_titulo.className = "titulo";
        div_titulo.textContent = "\ufeff"+items[i].TITULO;
        // - Estado
        div_estado = document.createElement('div');
        div_estado.className = "col3";
        div_estado.textContent = "Estado: \ufeff"+items[i].ESTADO;
        // - Fecha publicacion
        div_fecha_publicacion = document.createElement('div');
        div_fecha_publicacion.className = "col3";
        div_fecha_publicacion.textContent = "Fecha Publicación: "+items[i].FECHA_PUBLICACION;
        // - Fecha ACTUALIZACION
        div_fecha_actualizacion = document.createElement('div');
        div_fecha_actualizacion.className = "col3";
        div_fecha_actualizacion.textContent = "Fecha Actualización: "+items[i].FECHA_ACTUALIZACION;
        // - DESCRIPCION
        div_descripcion = document.createElement('div');
        div_descripcion.className = "descripcion";
        div_descripcion.textContent = "\ufeff"+items[i].DESCRIPCION;
        // - LINK
        div_link = document.createElement('div');
        div_link.className = "link";
        div_link.textContent = items[i].LINK;

        //Envoltura para el cuerpo del item
        var div_wrapper2 = document.createElement('div');
        div_wrapper2.className = 'wrapper2';
        //Poniendo dentro del wrapper2
        div_wrapper2.appendChild(div_estado);
        div_wrapper2.appendChild(div_fecha_publicacion);
        div_wrapper2.appendChild(div_fecha_actualizacion);

        //Poniendo dentro de ITEM_BODY
        div_wrapper.appendChild(div_titulo);
        div_wrapper.appendChild(div_wrapper2);
        div_wrapper.appendChild(div_descripcion);
        div_wrapper.appendChild(div_link);            

        //Poner todo dentro de la ruta del DIV que queramos
        var currentDiv = document.getElementById('publicaciones');
        currentDiv.appendChild(div_wrapper);
      }
    }
  });
});