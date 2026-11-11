<?php

include("conexion.php");

$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];

$sql = "INSERT INTO cliente
(nombre, apellido, email, telefono)
VALUES
('$nombre', '$apellido', '$email', '$telefono')";

if(mysqli_query($conexion, $sql)){
    echo "Cliente registrado correctamente";
} else {
    echo "Error: " . mysqli_error($conexion);
}

?>