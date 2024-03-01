<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();
?>

<?php

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "formreg")) {
    $id = $_POST['id'];
    $daño = $_POST['daño'];
    $precio = $_POST['precio'];

    //4
    $sql = $con->prepare("SELECT * FROM precios WHERE id_pre='$id' or id_daño='$daño'");
    $sql->execute();
    $fila = $sql->fetchAll(PDO::FETCH_ASSOC);

    if ($daño == "" || $precio == "") {
        echo '<script>alert ("Hay campos vacios, llena los campos.");</script>';

    } else if ($fila) {
        echo '<script>alert ("Ese tipo de daño ya esta registrado.");</script>';
    } else {
        $insertSQL = $con->prepare("INSERT INTO precios (id_pre,id_daño,precio) VALUES 
        ('$id','$daño','$precio')");

        $insertSQL->execute();
        echo '<script>alert ("Tipo de precio registrado exitosamente.");</script>';
        echo '<script>window.location = "../Visualizar/precios.php"</script>';
    }

}
?>
<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Crear Precios</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="id" placeholder="Id_Precios" readonly>
        </div>
        <select name="daño">
            <option value="">Seleccione tipo de daño</option>
            <?php
            //2
            $control = $con->prepare("SELECT * From tipo_daño");
            $control->execute();
            while ($fila = $control->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value=" . $fila['id_daño'] . ">" . $fila['nombre'] . "</option>";
            }
            ?>
        </select>
        <br><br>
        <div class="campos">
            <input type="text" name="precio" placeholder="Precio">
        </div>
        <br>
        <input type="submit" name="inicio" value="Registrar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>