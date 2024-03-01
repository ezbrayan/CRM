<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();
?>

<?php
//3
if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "formreg")) {
    $id = $_POST['id'];
    $tipo = $_POST['tipo'];
    $hora = $_POST['hora'];

    //4
    $sql = $con->prepare("SELECT * FROM riesgos WHERE id_riesgo='$id' or tip_riesgo='$tipo' or tiempo_atent='$hora'");
    $sql->execute();
    $fila = $sql->fetchAll(PDO::FETCH_ASSOC);

    if ($tipo == "" || $hora == "") {
        echo '<script>alert ("Hay campos vacios, llena los campos.");</script>';

    } else if ($fila) {
        echo '<script>alert ("Ese tipo de riesgo ya esta registrado.");</script>';
    } else {
        $insertSQL = $con->prepare("INSERT INTO riesgos (id_riesgo,tip_riesgo,tiempo_atent) VALUES 
        ('$id','$tipo','$hora')");

        $insertSQL->execute();
        echo '<script>alert ("Tipo de riesgo registrado exitosamente.");</script>';
        echo '<script>window.location = "../Visualizar/riesgos.php"</script>';
    }

}
?>

<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Crear Riesgo</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="id" placeholder="Id_Riesgo" readonly>
        </div>
        <div class="campos">
            <input type="text" name="tipo" placeholder="Riesgo">
        </div>
        <div class="campos">
            <input type="text" name="hora" placeholder="Tiempo de Demora">
        </div>
        <br>
        <input type="submit" name="inicio" value="Registrar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>