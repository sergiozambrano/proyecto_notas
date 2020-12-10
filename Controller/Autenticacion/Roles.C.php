<?php
include_once("../../Model/Autenticacion/Login.M.php");

if(!isset($_SESSION)) {
    session_start();
}

$loginM = new LoginM();
@$valor = $_POST['valor'];
$data;
$rol;

if($valor == ''){
    $documento = $_SESSION['documento'];
    $data['rol'] = $loginM->roles($documento);

    $rol = $data['rol'][0]['descripcion'];
    $data['acceso'] = $loginM->acceso($rol);
}
elseif ($valor = 'acceso') {
    $rol = $_POST['data'];
    $data = $loginM->acceso($rol);
}

print json_encode($data);

?>
