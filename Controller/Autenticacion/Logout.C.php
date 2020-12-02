<?php
session_start();

unset($_SESSION["nombre"]);
unset($_SESSION['documento']);

session_destroy();
header("Location:../../index.html");
?>
