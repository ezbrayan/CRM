<?php
require_once("Config/conexion.php");

$mensaje = ""; // Inicializamos el mensaje como vacío
$fecha_actual = date('Y-m-d'); // Defino la fecha actual
$fecha_vencimiento = date('Y-m-d', strtotime('+1 year', strtotime($fecha_actual))); // hacemos el calculo de tiempo para el vencimiento

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener el NIT y el estado del formulario
    $nit = $_POST['nit'];
    $estado = $_POST['estado'];

    // Crear una instancia de la clase Database para obtener la conexión PDO
    $database = new Database();
    $pdo = $database->conectar();

    // Verificar si ya existe una licencia para el NIT dado
    $query_verificar = "SELECT COUNT(*) as count FROM licencia WHERE nitc = :nit";
    $statement_verificar = $pdo->prepare($query_verificar);
    $statement_verificar->execute(array('nit' => $nit));
    $resultado_verificar = $statement_verificar->fetch(PDO::FETCH_ASSOC);

    if ($resultado_verificar['count'] > 0) {
        $mensaje = "Ya existe una licencia asociada al NIT proporcionado.";
    } else {
        // Generar una licencia aleatoria
        $caracteres = "lkjhsysaASMNB8811AMMaksjyuyysth098765432%#%poiyAZXSDEWOjhhs";
        $long = 20;
        $licencia = substr(str_shuffle($caracteres), 0, $long);

        // Insertar la licencia generada en la tabla licencia
        $query = "INSERT INTO licencia (licencia, nitc, estado, fecha_inicial, fecha_final) VALUES (:licencia, :nitc, :estado, :fecha_inicial, :fecha_final)";
        $statement = $pdo->prepare($query);
        $statement->execute(array(
            'licencia' => $licencia,
            'nitc' => $nit,
            'estado' => $estado,
            'fecha_inicial' => $fecha_actual,
            'fecha_final' => $fecha_vencimiento
        ));

        // Verificar si se inserto correctamente la licencia
        if ($statement->rowCount() > 0) {
            $mensaje = "La licencia se ha generado y guardado en la base de datos.";
        } else {
            $mensaje = "Ha ocurrido un error al generar y guardar la licencia.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Datos de Licencia</title>
</head>

<body>
    <h2>Subir Datos de Licencia</h2>
    <?php
    // Mostrar el mensaje
    echo $mensaje;
    ?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="nit">Selecciona el NIT de la empresa:</label><br>
        <select id="nit" name="nit" required>
            <option value="" disabled selected>Selecciona un NIT</option>
            <?php
            require_once("Config/conexion.php");

            // Crear una instancia de la clase Database para obtener la conexión PDO
            $database = new Database();
            $pdo = $database->conectar();

            // Consultar los datos de la tabla empresa
            $query_empresas = "SELECT nitc, nombre FROM empresa";
            $statement_empresas = $pdo->prepare($query_empresas);
            $statement_empresas->execute();

            // Generar las opciones del menú desplegable
            while ($row = $statement_empresas->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['nitc'] . "'>" . $row['nitc'] . " - " . $row['nombre'] . "</option>";
            }
            ?>
        </select><br><br>

        <label for="estado">Selecciona el estado de la licencia:</label><br>
        <select id="estado" name="estado" required>
            <option value="" disabled selected>Selecciona un estado</option>
            <?php
            // Consultar los datos de la tabla estado
            $query_estados = "SELECT id_est, tip_est FROM estado";
            $statement_estados = $pdo->prepare($query_estados);
            $statement_estados->execute();

            // Generar las opciones del menú desplegable
            while ($row = $statement_estados->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id_est'] . "'>" . $row['tip_est'] . "</option>";
            }
            ?>
        </select><br><br>
        <label for="fecha_inicial">Fecha de Creación:</label><br>
        <input type="text" id="fecha_inicial" name="fecha_inicial" value="<?php echo $fecha_actual; ?>" readonly><br><br>

        <label for="fecha_final">Fecha de Vencimiento:</label><br>
        <input type="text" id="fecha_final" name="fecha_final" value="<?php echo $fecha_vencimiento; ?>" readonly><br><br>

        <input type="submit" value="Subir Datos">
    </form>
</body>

</html>
