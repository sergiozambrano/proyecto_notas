<?php
include_once('../../Enviroment/Conexion.php');

if(!isset($_SESSION)) {
    session_start();
}

class LoginM extends Conexion{
    private $sql;
    private $statement;
    private $resulSet;
    private $documento;
    private $pass;

    public function __construct(){
        parent::__construct();
    }

    public function login($user){
        try {
            $this->sql = "SELECT p.nombre_per, p.apellido_per, p.num_doc_per, u.pass_usu
                          FROM  persona  AS p
                          INNER JOIN usuario AS u ON u.id_persona=p.id_persona
                          WHERE p.num_doc_per=?";
            $this->statement = $this->conexion->prepare($this->sql);
            $this->statement->execute(array($user->documento));

            $this->resulSet =  $this->statement->rowCount();  #Obteniendo el numero de filas afectadas por la consulta

            if ($this->resulSet === 1) {
                $this->resulSet = $this->statement->fetch(PDO::FETCH_ASSOC);  #Obteniendo los campos de la fila en un arreglo asociativo

                if (password_verify($user->pass, $this->resulSet['pass_usu'])) {
                    $_SESSION['nombre'] = $this->resulSet['nombre_per'];
                    $_SESSION['documento'] = $this->resulSet['num_doc_per'];
                    return 1;
                }
                else{
                    return 2;
                }

            } else {
                return 0;
            }
        } catch (\Throwable $e) {
            return -1;
        }
    }

    public function roles($documento){
        try {
            $this->sql = "SELECT rol_usu
                          FROM usuario AS u
                          INNER JOIN persona AS p ON p.id_persona=u.id_persona
                          WHERE p.num_doc_per=?";
            $this->statement = $this->conexion->prepare($this->sql);
            $this->statement->execute(array($documento));

            $this->resulSet = $this->statement->fetch(PDO::FETCH_ASSOC);
            return $this->resulSet;

        } catch (\Throwable $e) {
            return -1;
        }
    }
}
?>
