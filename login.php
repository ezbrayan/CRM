<?php
require_once("Config/conexion.php");

// Crear una instancia de la clase Database para obtener la conexión PDO
$database = new Database();
$pdo = $database->conectar();

// Verificar si se ha hecho clic en el enlace de registro
if (isset($_GET['accion']) && $_GET['accion'] == 'registro') {
    // Consultar si hay una licencia activa
    $query = "SELECT * FROM licencia WHERE estado = 1";
    $resultado = $pdo->query($query);

    // Si no hay una licencia activa, redirigir al usuario al index.php
    if ($resultado->rowCount() != 1) {
        header("Location: index.php");
        exit(); // Detener la ejecución del script
    }
}

// Si llegamos aquí, significa que hay una licencia activa o no se ha intentado registrarse
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Login - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="Admin/assets/img/favicon.png" rel="icon">
    <link href="Admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="Admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="Admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="Admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="Admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="Admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="Admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="Admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="Admin/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="index.php" class="logo d-flex align-items-center w-auto">
                                    <img src="assets/img/logo.png" alt="">
                                    <span class="d-none d-lg-block">CRM</span>
                                </a>
                            </div><!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Inicia Session</h5>
                                        <p class="text-center small">Ingrese los datos requeridos</p>
                                    </div>

                                    <form class="row g-3 needs-validation" novalidate>

                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Correo</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="text" name="username" class="form-control" id="yourUsername" required>
                                                <div class="invalid-feedback">Por Favor, ingrese su Correo-electronico!</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" id="yourPassword" required>
                                            <div class="invalid-feedback">Por Favor, ingrese su Contraseña!</div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                                <label class="form-check-label" for="rememberMe">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Login</button>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">No Tienes Una Cuenta? <a href="registro.php">registrate</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                Terminos Y Condiciones</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>

        </div>
    </main><!-- End #main -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="Admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="Admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="Admin/assets/vendor/chart.js/chart.umd.js"></script>
    <script src="Admin/assets/vendor/echarts/echarts.min.js"></script>
    <script src="Admin/assets/vendor/quill/quill.min.js"></script>
    <script src="Admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="Admin/assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="Admin/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="Admin/assets/js/main.js"></script>

</body>

</html>