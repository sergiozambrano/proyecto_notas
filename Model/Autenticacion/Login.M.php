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
            $this->sql = "SELECT p.nombre_pri_per, p.apellido_pri_per, u.id_usuario, u.pass_usu, u.estado_usu
                          FROM persona AS p
                          INNER JOIN usuario AS u ON u.id_persona=p.id_persona
                          WHERE p.num_documento=?";
            $this->statement = $this->conexion->prepare($this->sql);
            $this->statement->execute(array($user->documento));

            $this->resulSet =  $this->statement->rowCount();  #Obteniendo el numero de filas afectadas por la consulta

            if ($this->resulSet === 1) {
                $this->resulSet = $this->statement->fetch(PDO::FETCH_ASSOC);  #Obteniendo los campos de la fila en un arreglo asociativo

                if ($this->resulSet['estado_usu'] == 1) {
                  if (password_verify($user->pass, $this->resulSet['pass_usu'])) {
                    $_SESSION['nombre'] = $this->resulSet['nombre_pri_per']." ".$this->resulSet['apellido_pri_per'];
                    $_SESSION['id'] = $this->resulSet['id_usuario'];
                    return 1;
                  }
                  else{
                    return 2;
                  }

                } else {
                  return 3;
                }
            } else {
                return 0;
            }
        } catch (\Throwable $e) {
            return -1;
        }
    }

    public function roles($id){
        try {
            $this->sql = "SELECT r.nombre_rol
                          FROM usuario AS u
                          INNER JOIN usuario_rol AS u_r ON u_r.id_usuario=u.id_usuario
                          INNER JOIN rol AS r ON r.id_rol=u_r.id_rol
                          WHERE u.id_usuario=?";
            $this->statement = $this->conexion->prepare($this->sql);
            $this->statement->execute(array($id));

            $this->resulSet = $this->statement->fetchAll(PDO::FETCH_ASSOC);
            return $this->resulSet;

        } catch (\Throwable $e) {
            return -1;
        }
    }

    public function estado($documento){
      try {
        $this->sql = "UPDATE usuario SET estado_usu='0'
                      WHERE id_persona = (SELECT id_persona FROM persona WHERE num_documento=?)";

        $this->statement = $this->conexion->prepare($this->sql);
        $this->statement->execute(array($documento));

        return $this->statement = (true) ? 1 : 0;

      } catch (\Throwable $th) {
        return -1;
      }
    }
}
?>
