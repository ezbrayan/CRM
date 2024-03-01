<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();
?>

<?php
//3
if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "formreg")) {
    $detalle = $_POST['detalle'];
    $daño = $_POST['daño'];
    $solucion = $_POST['solucion'];

    //4
    $sql = $con->prepare("SELECT * FROM detalle_daño WHERE id_detalle_daño='$detalle' or pasos_solucion='$solucion'");
    $sql->execute();
    $fila = $sql->fetchAll(PDO::FETCH_ASSOC);

    if ($daño == "" || $solucion == "") {
        echo '<script>alert ("Hay campos vacios, llena los campos.");</script>';

    } else if ($fila) {
        echo '<script>alert ("Esa solucion ya esta registrada.");</script>';
    } else {
        $insertSQL = $con->prepare("INSERT INTO detalle_Daño (id_detalle_daño, id_daño, pasos_solucion) VALUES 
        ('$detalle','$daño','$solucion')");

        $insertSQL->execute();
        echo '<script>alert ("Solucion daño registrado exitosamente.");</script>';
        echo '<script>window.location = "../Visualizar/detalle_daño.php"</script>';
    }

}
?>
<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Crear Solucion</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="detalle" placeholder="Id_detalle_daño" readonly>
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
            <input type="text" name="solucion" placeholder="solución">
        </div>
        <br>
        <input type="submit" name="inicio" value="Registrar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>