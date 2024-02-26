<?php
require_once("Config/conexion.php");

$fecha_actual = date('Y-m-d'); // Defino la fecha actual
$fecha_vencimiento = date('Y-m-d', strtotime('+1 year', strtotime($fecha_actual))); // calculamos de tiempo para el vencimiento

// Generar una licencia aleatoria
$caracteres = "lkjhsysaASMNB8811AMMaksjyuyysth098765432%#%poiyAZXSDEWOjhhs";
$long = 20;
$licencia = substr(str_shuffle($caracteres), 0, $long);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener el NIT y el estado del formulario
    $nit = $_POST['nit'] ?? '';
    $estado = $_POST['estado'] ?? '';

    // Validar que los campos no estén vacíos
    if (empty($nit) || empty($estado)) {
        echo "<script>alert('Por favor, complete todos los campos.');</script>";
    } else {
        // Crear una instancia de la clase Database para obtener la conexión PDO
        $database = new Database();
        $pdo = $database->conectar();

        try {
            $pdo->beginTransaction();

            // Verificar si ya existe una licencia para el NIT dado en estado 1
            $query_verificar = "SELECT COUNT(*) as count FROM licencia WHERE nitc = :nit AND estado = 1";
            $statement_verificar = $pdo->prepare($query_verificar);
            $statement_verificar->execute(array('nit' => $nit));
            $resultado_verificar = $statement_verificar->fetch(PDO::FETCH_ASSOC);

            if ($resultado_verificar['count'] > 0) {
                echo "<script>alert('Ya existe una licencia activa asociada al NIT proporcionado.');</script>";
            } else {
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

                // Verificar si se insertó correctamente la licencia
                if ($statement->rowCount() > 0) {
                    $pdo->commit();
                    echo "<script>alert('La licencia se ha generado y guardado en la base de datos.');</script>";
                } else {
                    $pdo->rollBack();
                    echo "<script>alert('Ha ocurrido un error al generar y guardar la licencia.');</script>";
                }
            }
        } catch (PDOException $e) {
            $pdo->rollBack();
            echo "<script>alert('Error en la transacción: " . $e->getMessage() . "');</script>";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Liencia</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">


</head>

<body>
    <section class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h2>Subir Datos de Licencia</h2>
                        <br />
                        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                            <label for="nit" class="form-label">Selecciona el NIT de la empresa:</label><br>
                            <select id="nit" name="nit" class="form-control" required>
                                <option value="" disabled selected>Selecciona un NIT</option>
                                <?php
                                // Consultar los datos de la tabla empresa
                                $database = new Database();
                                $pdo = $database->conectar();
                                $query_empresas = "SELECT nitc, nombre FROM empresa";
                                $statement_empresas = $pdo->prepare($query_empresas);
                                $statement_empresas->execute();
                                while ($row = $statement_empresas->fetch(PDO::FETCH_ASSOC)) {
                                    echo "<option value='" . $row['nitc'] . "'>" . $row['nombre'] . "</option>";
                                }
                                ?>
                            </select><br><br>

                            <label for="estado" class="form-label">Selecciona el estado de la licencia:</label><br>
                            <select id="estado" name="estado" class="form-control" required>
                                <option value="" disabled selected>Selecciona un estado</option>
                                <?php
                                $query_estados = "SELECT id_est, tip_est FROM estado WHERE id_est < 2";
                                $statement_estados = $pdo->prepare($query_estados);
                                $statement_estados->execute();
                                while ($row = $statement_estados->fetch(PDO::FETCH_ASSOC)) {
                                    echo "<option value='" . $row['id_est'] . "'>" . $row['tip_est'] . "</option>";
                                }
                                ?>
                            </select><br><br>
                            <label for="fecha_inicial" class="form-label">Fecha de Creación:</label><br>
                            <input type="text" id="fecha_inicial" name="fecha_inicial" class="form-control" value="<?php echo $fecha_actual; ?>" readonly><br><br>

                            <label for="fecha_final" class="form-label">Fecha de Vencimiento:</label><br>
                            <input type="text" id="fecha_final" name="fecha_final" class="form-control" value="<?php echo $fecha_vencimiento; ?>" readonly><br><br>
                            <label for="licencia" class="form-label">Licencia Generada:</label><br>
                            <input type="text" id="licencia" name="licencia" class="form-control" value="<?php echo $licencia; ?>" readonly><br><br>

                            <input type="submit" class="btn btn-primary" value="Crear Licencia">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>