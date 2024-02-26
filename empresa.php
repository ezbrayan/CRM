<?php
include 'Config/conexion.php';

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $nitc = $_POST['nitc'];
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    
    // Verificar si todos los campos están llenos
    if(empty($nitc) || empty($nombre) || empty($direccion) || empty($telefono)){
        echo "<script>alert('Todos los campos son obligatorios.')</script>";
    } elseif (!is_numeric($nitc) || !is_numeric($telefono)) {
        echo "<script>alert('El NITC y el teléfono deben contener solo números.')</script>";
    } else {
        $database = new Database();
        $pdo = $database->conectar();
        
        // Verificar si ya existe un registro con el mismo NITC
        $stmt = $pdo->prepare("SELECT * FROM empresa WHERE nitc = :nitc");
        $stmt->execute([':nitc' => $nitc]);
        $existingNitc = $stmt->fetch();
        
        // Verificar si ya existe un registro con el mismo nombre
        $stmt = $pdo->prepare("SELECT * FROM empresa WHERE nombre = :nombre");
        $stmt->execute([':nombre' => $nombre]);
        $existingNombre = $stmt->fetch();
        
        if($existingNitc) {
            echo "<script>alert('Ya existe una empresa con este NITC.')</script>";
        } elseif ($existingNombre) {
            echo "<script>alert('Ya existe una empresa con este nombre.')</script>";
        } else {
            // Insertar datos en la base de datos
            $sql = "INSERT INTO empresa (nitc, nombre, direccion, telefono) VALUES (:nitc, :nombre, :direccion, :telefono)";
            $stmt = $pdo->prepare($sql);
            
            $params = array(
                ':nitc' => $nitc,
                ':nombre' => $nombre,
                ':direccion' => $direccion,
                ':telefono' => $telefono
            );
            
            if($stmt->execute($params)){
                echo "<script>alert('Empresa creada correctamente.')</script>";
            } else {
                echo "<script>alert('Error al crear la empresa.')</script>";
            }
        }
        
        unset($stmt);
        unset($pdo);
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Empresa</title>
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
  <!-- ======= Header ======= -->

  
  
  <!-- ======= Hero Section ======= -->
  <section class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h2 class="mb-4">Crear Empresa</h2>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="nitc" class="form-label">NIT:</label>
                            <input type="number" class="form-control" id="nitc" name="nitc" pattern="[0-9]*" title="Ingrese solo números" required>
                        </div>

                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección:</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>

                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono:</label>
                            <input type="number" class="form-control" id="telefono" name="telefono" pattern="[0-9]*" title="Ingrese solo números" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Generar Empresa</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
  

</body>

</html>
