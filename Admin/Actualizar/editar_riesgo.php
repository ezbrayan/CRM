<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();


$sql = $con->prepare("SELECT * FROM riesgos WHERE id_riesgo = '" . $_GET['id_riesgo'] . "'");
$sql->execute();
$usua = $sql->fetch();
?>

<?php
//3
if (isset($_POST["update"])) {
    $id = $_POST['id'];
    $tipo = $_POST['tipo'];
    $hora = $_POST['hora'];
    //4
    $insertSQL = $con->prepare("UPDATE riesgos SET id_riesgo = '$id', tip_riesgo = '$tipo', tiempo_atent ='$hora' WHERE id_riesgo = '" . $_GET['id_riesgo'] . "'");
    $insertSQL->execute();
    echo '<script>alert ("Actualización exitosa.");</script>';
    echo '<script>window.location="../Visualizar/riesgos.php"</script>';
}

?>
<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Actualizar Riesgo</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="id" value="<?php echo $usua['id_riesgo'] ?>" readonly>
        </div>
        <div class="campos">
            <input type="text" name="tipo" value="<?php echo $usua['tip_riesgo'] ?>">
        </div>
        <div class="campos">
            <input type="text" name="hora" value="<?php echo $usua['tiempo_atent'] ?>">
        </div>
        <br>
        <input type="submit" name="update" value="Actualizar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>