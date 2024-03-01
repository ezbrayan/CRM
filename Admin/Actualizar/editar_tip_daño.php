<?php
include("../../Config/validarSesion.php");
require_once("../../Config/conexion.php");
$Conexion = new Database;
$con = $Conexion->conectar();


$sql = $con->prepare("SELECT * FROM tipo_daño WHERE id_daño = '" . $_GET['id_daño'] . "'");
$sql->execute();
$usua = $sql->fetch();
?>

<?php
//3
if (isset($_POST["update"])) {
    $id = $_POST['id'];
    $tipo = $_POST['tipo'];
    //4
    $insertSQL = $con->prepare("UPDATE tipo_daño SET id_daño = '$id', nombre = '$tipo' WHERE id_daño = '" . $_GET['id_daño'] . "'");
    $insertSQL->execute();
    echo '<script>alert ("Actualización exitosa.");</script>';
    echo '<script>window.location="../Visualizar/tipo_daño.php"</script>';
} 

?>
<?php include "../Template/header.php"; ?>
<div class="formulario">
    <h1>Actualizar Tipo de daño</h1>
    <form method="POST" name="formreg" autocomplete="off">
        <div class="campos">
            <input type="text" name="id" value="<?php echo $usua['id_daño'] ?>" readonly>
        </div>
        <div class="campos">
            <input type="text" name="tipo" value="<?php echo $usua['nombre'] ?>">
        </div>
        <br>
        <input type="submit" name="update" value="Actualizar">
        <input type="hidden" name="MM_insert" value="formreg">
    </form>
</div>
<?php include "../Template/footer.php"; ?>