<?php
include("conexion.php");

$sql = "SELECT * FROM cliente";
$resultado = mysqli_query($conexion, $sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Clientes Registrados</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    background:#f4f6f9;
    padding:40px;
}

h1{
    text-align:center;
    margin-bottom:30px;
    color:#0f4c81;
}

.contenedor{
    width:95%;
    margin:auto;
}

.boton-nuevo{

    display:inline-block;

    background:#0f4c81;

    color:white;

    text-decoration:none;

    padding:12px 20px;

    border-radius:10px;

    margin-bottom:20px;
}

table{

    width:100%;

    border-collapse:collapse;

    background:white;

    box-shadow:0 5px 15px rgba(0,0,0,.1);
}

th{

    background:#0f4c81;

    color:white;

    padding:15px;
}

td{

    padding:12px;

    text-align:center;

    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f5f5f5;
}

.editar{

    background:#28a745;

    color:white;

    padding:8px 15px;

    text-decoration:none;

    border-radius:8px;
}

.eliminar{

    background:#dc3545;

    color:white;

    padding:8px 15px;

    text-decoration:none;

    border-radius:8px;
}

.acciones{

    display:flex;

    justify-content:center;

    gap:10px;
}

</style>

</head>
<body>

<div class="contenedor">

<h1>Clientes Registrados</h1>

<a href="index.html" class="boton-nuevo">
Registrar Nuevo Cliente
</a>

<table>

<tr>
    <th>ID</th>
    <th>Nombre</th>
    <th>Apellido</th>
    <th>Email</th>
    <th>Teléfono</th>
    <th>Acciones</th>
</tr>

<?php
while($fila = mysqli_fetch_assoc($resultado)){
?>

<tr>

    <td><?php echo $fila['id_cliente']; ?></td>

    <td><?php echo $fila['nombre']; ?></td>

    <td><?php echo $fila['apellido']; ?></td>

    <td><?php echo $fila['email']; ?></td>

    <td><?php echo $fila['telefono']; ?></td>

    <td>

        <div class="acciones">

            <a
            class="editar"
            href="editar_cliente.php?id=<?php echo $fila['id_cliente']; ?>">
            Editar
            </a>

            <a
            class="eliminar"
            href="eliminar_cliente.php?id=<?php echo $fila['id_cliente']; ?>">
            Eliminar
            </a>

        </div>

    </td>

</tr>

<?php
}
?>

</table>

</div>

</body>
</html>