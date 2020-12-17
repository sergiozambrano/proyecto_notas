<?php
session_start();

class Sesion{

    public function autenticacion(){
        if (!isset($_SESSION['id'])) {
            header('location: ../../index.html');
        }
    }
}
?>
