<?php
include_once("../../Model/Autenticacion/Login.D.php");
include_once("../../Model/Autenticacion/Login.M.php");
if(!isset($_SESSION)) {
  session_start();
}

$loginM = new LoginM();
$loginD = new LoginD();
$data;

$documento = $_POST['usuario'];

if (isset($_POST['password'])) {
  $pass = $_POST['password'];

  $loginD->ingresar($documento,$pass);
  $data = $loginM->login($loginD);

} else {
  $data = $loginM->estado($documento);
}

print json_encode($data);
?>
