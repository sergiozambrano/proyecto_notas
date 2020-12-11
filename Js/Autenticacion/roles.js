$(document).ready(function(){
  $.ajax({
    url:"../../Controller/Autenticacion/Roles.C.php",
    type:"POST",
    datatype: "json",
    success:function(data){
      data = JSON.parse(data);

      var cont;

      //Mostrar los accesos dependiento el rol
      if (data['rol_usu'] == 'Administrador') {

        cont  = "<a class='nav-link' href='' target='main'><span>Usuario</span></a>"+
                "<a class='nav-link' href='' target='main'><span>Alumnos</span></a>";

      }else if(data['rol_usu'] == 'Docente'){
        cont = "<a class='nav-link' href='' target='main'><span>Notas</span></a>";
      }

      //Agregando los accesos a la vista
      $('li#acceso').find('div').append(cont);
    }
  });

});
