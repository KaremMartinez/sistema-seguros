<?php

include("conexion.php");

$id = $_GET['id'];

$sql = "DELETE FROM cliente WHERE id_cliente = $id";

if(mysqli_query($conexion, $sql)){

    header("Location: listar_clientes.php");
    exit();

}else{

    echo "Error al eliminar: " . mysqli_error($conexion);

}

?>