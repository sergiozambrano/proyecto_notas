let contar = 0;

$('#formLogin').submit(function(e){
  e.preventDefault();

  let usuario = $.trim($("#usuario").val());
  let password =$.trim($("#password").val());

  if(usuario.length == "" || password == ""){
    Swal.fire({
      type:'warning',
      title:'Debe ingresar todos los datos',
    });
    return false;
  }
  else{
    $.ajax({
      url:"./Controller/Autenticacion/Login.C.php",
      type:"POST",
      datatype: "json",
      data: {usuario:usuario, password:password},
      success:function(data){

        if(data == 1){
          $(location).attr('href',"Views/Plantilla/Plantilla.php");
          contar = 0;

        }else if(data == 2){
          Swal.fire({
            type:'error',
            title:'Usuario y/o password incorrecta',
          });
          contar++;

          if (contar == 3) {
            $.ajax({
              url:"./Controller/Autenticacion/Login.C.php",
              type:"POST",
              datatype: "json",
              data: {usuario: usuario},
              success: function (data) {
                if (data == 1) {
                  Swal.fire({
                    type:'error',
                    title:'El usuario ha sido inhabilitado por limite de intentos en la contraseña. Comuníquese con el Administrador.',
                  });
                }
              }
            });
          }
        }else if(data == 3){
          Swal.fire({
            type:'error',
            title:'El usuario se encuentra inactivo',
          });

        }else if(data == 0){
          Swal.fire({
            type:'error',
            title:'Usuario no registrado',
          });

        }else if (data == -1) {
          Swal.fire({
            type:'error',
            title:'Error inesperado contacte al Administrador',
          });
        }

        console.log(contar);
      }
    });
  }
});
