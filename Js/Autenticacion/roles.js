$(document).ready(function(){
  $.ajax({
    url:"../../Controller/Autenticacion/Roles.C.php",
    type:"POST",
    datatype: "json",
    success:function(data){
      data = JSON.parse(data);

      for (let i = 0; i < data['rol'].length; i++) {
        $('select#selectRol').append("<option value="+i+">"+data['rol'][i]+"</option>");
      }

      acceso(data);
    }
  });

  $('select#selectRol').on('change', function(){
    let select = $('select#selectRol option:Selected').val();
    $.ajax({
      url:"../../Controller/Autenticacion/Roles.C.php",
      type:"POST",
      datatype: "json",
      success:function(data) {
        data = JSON.parse(data);

        acceso(data,select);
      }
    });
  });

  function acceso(data, select=0) {
    var cont = document.createElement('div');
      for (let i = 0; i < data['acceso'][select].length; i++) {
        cont.innerHTML += "<a class='nav-link' href="+data['acceso'][select][i]['url']+" target='main'><span>"+data['acceso'][select][i]['descripcion']+"</span></a>";

        $('#iframe').attr('src',data['acceso'][select][0]['url']);
      }
      $('li#acceso').find('div').replaceWith(cont);
  }
});
