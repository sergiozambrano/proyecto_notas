<?php
session_start();

class Sesion{

    public function autenticacion(){
        if (!isset($_SESSION['documento'])) {
            header('location: ../../index.html');
        }
    }
}
?>
