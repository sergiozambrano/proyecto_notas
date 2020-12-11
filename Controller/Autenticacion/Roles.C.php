<?php
include_once("../../Model/Autenticacion/Login.M.php");

if(!isset($_SESSION)) {
    session_start();
}

$loginM = new LoginM();
$data;

$documento = $_SESSION['documento'];
$data = $loginM->roles($documento);

print json_encode($data);

?>
