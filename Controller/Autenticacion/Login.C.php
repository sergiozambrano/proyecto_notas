<?php
include_once("../../Model/Autenticacion/Login.D.php");
include_once("../../Model/Autenticacion/Login.M.php");

$documento = $_POST['usuario'];
$pass = $_POST['password'];
$data;

$loginD = new LoginD();
$loginM = new LoginM();

$loginD->loginD($documento, $pass);
$data = $loginM->login($loginD);

print json_encode($data);

?>
