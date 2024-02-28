<?php
include('../../Config/conexion.php');

$database = new Database();
$pdo = $database->conectar();

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nitcToUpdate = $_POST['nitc'];
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];

    // Prepare and execute the update query
    $updateQuery = $pdo->prepare("UPDATE empresa SET nombre = ?, direccion = ?, telefono = ? WHERE nitc = ?");
    $updateQuery->execute([$nombre, $direccion, $telefono, $nitcToUpdate]);

    // Redirect to the page displaying the updated data or any other desired location
    header("Location: ../Visualizar/Empresa.php");
    exit();
}

// Retrieve existing data for the selected record
if (isset($_GET['nitc'])) {
    $nitcToUpdate = $_GET['nitc'];

    $selectQuery = $pdo->prepare("SELECT * FROM empresa WHERE nitc = ?");
    $selectQuery->execute([$nitcToUpdate]);
    $empresa = $selectQuery->fetch(PDO::FETCH_ASSOC);
} else {
    // Redirect to the page displaying the data if nitc parameter is not provided
    header("Location: ../Visualizar/Empresa.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... (your existing head content) ... -->
</head>
<body>
    <!-- ... (your existing body content) ... -->

    <section class="section">
        <div class="container my-5">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <h2>Actualizar Empresa</h2>
                    <form method="POST">
                        <input type="hidden" name="nitc" value="<?php echo $empresa['nitc']; ?>">
                        <label for="nombre">Nombre:</label>
                        <input type="text" name="nombre" value="<?php echo $empresa['nombre']; ?>" required>

                        <label for="direccion">Direccion:</label>
                        <input type="text" name="direccion" value="<?php echo $empresa['direccion']; ?>" required>

                        <label for="telefono">Telefono:</label>
                        <input type="text" name="telefono" value="<?php echo $empresa['telefono']; ?>" required>

                        <button type="submit">Actualizar</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- ... (your existing script imports) ... -->

    <!-- ... (your existing script content) ... -->
</body>
</html>