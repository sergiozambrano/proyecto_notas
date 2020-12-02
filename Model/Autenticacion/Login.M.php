<?php
include_once('../../Enviroment/Conexion.php');

if(!isset($_SESSION)) {
    session_start();
}

class LoginM extends Conexion{
    private $sql;
    private $statament;
    private $resulSet;
    private $documento;
    private $pass;

    public function __construct(){
        parent::__construct();
    }

    public function login($user){
        try {
            $this->sql = "SELECT * FROM usuario WHERE documento_usu=?";
            $this->statament = $this->conexion->prepare($this->sql);
            $this->statament->execute(array($user->documento));

            $this->resulSet =  $this->statament->rowCount();  #Obteniendo el numero de filas afectadas por la consulta

            if ($this->resulSet === 1) {
                $this->resulSet = $this->statament->fetch(PDO::FETCH_ASSOC);  #Obteniendo los campos de la fila en un arreglo asociativo

                if ($user->pass == $this->resulSet['pass_usu']) {
                    $_SESSION['nombre'] = $this->resulSet['nombre_usu'];
                    $_SESSION['documento'] = $this->resulSet['documento_usu'];
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
            $this->sql = "SELECT r.descripcion
                        FROM rol AS r
                        INNER JOIN usuario_rol AS u_r ON u_r.id_rol = r.id_rol
                        INNER JOIN usuario AS u ON u.id_usuario = u_r.id_usuario
                        WHERE u.documento_usu = ?";
            $this->statament = $this->conexion->prepare($this->sql);
            $this->statament->execute(array($documento));

            $this->resulSet = $this->statament->fetchAll(PDO::FETCH_ASSOC);
            return $this->resulSet;

        } catch (\Throwable $e) {
            return -1;
        }
    }

    public function acceso($rol){
        try {
            $this->sql = "SELECT f.descripcion, f.url
                        FROM formulario AS f
                        INNER JOIN formulario_rol AS f_r ON f.id_formulario=f_r.id_formularo
                        INNER JOIN rol as r ON r.id_rol=f_r.id_rol
                        WHERE r.descripcion = ?";
            $this->statament = $this->conexion->prepare($this->sql);
            $this->statament->execute(array($rol));

            $this->resulSet = $this->statament->fetchAll(PDO::FETCH_ASSOC);

            return $this->resulSet;

        } catch (\Throwable $e) {
            return -1;
        }
    }
}
?>
