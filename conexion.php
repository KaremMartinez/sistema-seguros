<?php

$conexion = mysqli_connect(
    "localhost",
    "root",
    "",
    "sistemaseguros"
);

if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

?>