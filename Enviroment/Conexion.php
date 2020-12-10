<?php

class Conexion extends PDO{
    private $user;
    private $pass;
    protected $conexion;

    public function __construct(){
        $this->user = 'root';
        $this->pass = '';

        try {
            $this->conexion = new PDO('mysql:host=127.0.0.1;dbname=proyecto_notas', $this->user, $this->pass);
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $this->conexion;

        }catch (PDOException $e) {
            return $e->getMessage();
        }
    }

    function __destruct(){
        unset($this->conexion);
    }
}

?>
