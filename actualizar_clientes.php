<?php

include("conexion.php");

$id = $_POST['id_cliente'];
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];

$sql = "UPDATE cliente SET

nombre = '$nombre',
apellido = '$apellido',
email = '$email',
telefono = '$telefono'

WHERE id_cliente = $id";

if(mysqli_query($conexion, $sql)){

    echo "
    <h2>Cliente actualizado correctamente</h2>

    <a href='listar_clientes.php'>
        Volver a la lista
    </a>
    ";

}else{

    echo "Error: " . mysqli_error($conexion);

}

?>