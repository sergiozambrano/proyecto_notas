<?php
include_once("../../Model/Autenticacion/Login.M.php");

if(!isset($_SESSION)) {
    session_start();
}

$loginM = new LoginM();
$data;

$id = $_SESSION['id'];
$data = $loginM->roles($id);

print json_encode($data);

?>
