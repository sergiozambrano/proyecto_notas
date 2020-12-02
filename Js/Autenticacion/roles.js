$(document).ready(function(){
  $.ajax({
    url:"./../Autenticacion/Controller/Roles.C.php",
    type:"POST",
    datatype: "json",
    success:function(data){
      data = JSON.parse(data);

      for (let i = 0; i < data['rol'].length; i++) {
        if (i == 0) {
          $('select#selectRol').append("<option value="+i+">"+data['rol'][i]['descripcion']+"</option>");

        }
        else {
          $('select#selectRol').append("<option value="+i+">"+data['rol'][i]['descripcion']+"</option>");
        }
      }

      var cont = document.createElement('div');
      for (let i = 0; i < data['acceso'].length; i++) {
        cont.innerHTML += "<a class='nav-link' href="+data['acceso'][i]['url']+"><span>"+data['acceso'][i]['descripcion']+"</span></a>";
      }
      $('li#acceso').find('div').replaceWith(cont);

    }
  });

  $('select#selectRol').on('change', function(){
    let data = $('select#selectRol option:Selected').text();
    $.ajax({
      url:"./../Controller/Roles.C.php",
      type:"POST",
      datatype: "json",
      data: {valor:'acceso', data},
      success:function(data) {
        data = JSON.parse(data);

        var cont = document.createElement('div');
        for (let i = 0; i < data.length; i++) {
          cont.innerHTML += "<a class='nav-link' href="+data[i]['url']+"><span>"+data[i]['descripcion']+"</span></a>";
        }

        $('li#acceso').find('div').replaceWith(cont);
      }
    });
  });
});
