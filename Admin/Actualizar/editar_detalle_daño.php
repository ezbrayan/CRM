<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();


$sql = $con->prepare("SELECT * FROM detalle_daño,tipo_daño WHERE  detalle_daño.id_daño = tipo_daño. id_daño AND id_detalle_daño = '" . $_GET['id_detalle_daño'] . "'");
$sql->execute();
$usua = $sql->fetch();
?>

<?php
//3
if (isset($_POST["update"])) {
    $solucion = $_POST['solucion'];

    //4
    $insertSQL = $con->prepare("UPDATE detalle_daño SET pasos_solucion ='$solucion' WHERE id_detalle_daño = '" . $_GET['id_detalle_daño'] . "'");
    $insertSQL->execute();
    echo '<script>alert ("Actualización exitosa.");</script>';
    echo '<script>window.location="../Visualizar/detalle_daño.php"</script>';
}

?>



<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Actualizar Riesgo</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="detalle" value="<?php echo $usua['id_detalle_daño'] ?>" readonly>
        </div>
        <div class="campos">
            <input type="text" name="nombre" value="<?php echo $usua['nombre'] ?>" readonly>
        </div>
        <div class="campos">
            <input type="text" name="solucion" value="<?php echo $usua['pasos_solucion'] ?>">
        </div>
        <br>
        <input type="submit" name="update" value="Actualizar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>