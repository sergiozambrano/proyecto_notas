$(document).ready(function(){

  /**
   * Mostrando los roles y sus acciones del usuario que inicio sesión.
   */
  $.ajax({
    url:"../../Controller/Autenticacion/Roles.C.php",
    type:"POST",
    datatype: "json",
    success:function(data){
      data = JSON.parse(data);

      for (let i = 0; i < data.length; i++) {
        $('select#selectRol').append("<option value="+i+">"+data[i]['nombre_rol']+"</option>");
      }

      acceso(data[0]['nombre_rol']);
    }
  });

  /**
   * Detectar si hubo un cambio en la selección del rol para mostrar las acciones de ese rol
   */
  $('select#selectRol').on('change', function(){
    var data = $('select#selectRol option:Selected').text();
    acceso(data);
  });


  function acceso(data){
    var cont = document.createElement('div');

      //Mostrar los accesos dependiento el rol
      if (data == 'Administrador') {
        accion  = "<a class='nav-link' href='' target='main'><span>Administrador</span></a>";

      }
      else if (data == 'Auditor'){
        accion = "<a class='nav-link' href='' target='main'><span>Auditor</span></a>";

      }
      else if (data == 'Coordinador de auditoria') {
        accion = "<a class='nav-link' href='' target='main'><span>Coordinador de auditoria</span></a>";

      }
      else if (data == 'Coordinador de area') {
        accion = "<a class='nav-link' href='' target='main'><span>Coordinador de area</span></a>";

      }
      else if (data == 'Prueba') {
        accion = "<a class='nav-link' href='' target='main'><span>Prueba</span></a>";

      }

      //Agregando los accesos a la vista
      cont.innerHTML = accion;
      $('li#acceso').find('div').replaceWith(cont);
  }

});
