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
    }else{
        $.ajax({
           url:"./Controller/Autenticacion/Login.C.php",
           type:"POST",
           datatype: "json",
           data: {usuario:usuario, password:password},
           success:function(data){
               if(data == 1){
                  $(location).attr('href',"Views/Plantilla/Plantilla.php");
               }
               else if(data == 2){
                    Swal.fire({
                        type:'error',
                        title:'Usuario y/o password incorrecta',
                    });
               }
               else if(data == 0){
                    Swal.fire({
                        type:'error',
                        title:'Usuario no registrado',
                    });
               }
           }
        });
    }
});
