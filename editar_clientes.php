<?php

include("conexion.php");

$id = $_GET['id'];

$sql = "SELECT * FROM cliente WHERE id_cliente = $id";

$resultado = mysqli_query($conexion, $sql);

$fila = mysqli_fetch_assoc($resultado);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="formulario">

    <h2>Editar Cliente</h2>

    <form action="actualizar_cliente.php" method="POST">

        <input
            type="hidden"
            name="id_cliente"
            value="<?php echo $fila['id_cliente']; ?>"
        >

        <div class="campo">
            <label>Nombre</label>
            <input
                type="text"
                name="nombre"
                value="<?php echo $fila['nombre']; ?>"
                required
            >
        </div>

        <div class="campo">
            <label>Apellido</label>
            <input
                type="text"
                name="apellido"
                value="<?php echo $fila['apellido']; ?>"
                required
            >
        </div>

        <div class="campo">
            <label>Email</label>
            <input
                type="email"
                name="email"
                value="<?php echo $fila['email']; ?>"
                required
            >
        </div>

        <div class="campo">
            <label>Teléfono</label>
            <input
                type="text"
                name="telefono"
                value="<?php echo $fila['telefono']; ?>"
                required
            >
        </div>

        <button type="submit">
            Guardar Cambios
        </button>

    </form>

</div>

</body>
</html>