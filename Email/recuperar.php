<?php

require_once("../Config/conexion.php");

// Crear una instancia de la clase Database para obtener la conexión PDO
$database = new Database();
$pdo = $database->conectar();

// Verificar si se ha hecho clic en el enlace de registro
if (isset($_GET['accion']) && $_GET['accion'] == 'registro') {
    // Consultar cuántas licencias activas hay
    $query = "SELECT COUNT(*) as total FROM licencia WHERE estado = 1";
    $resultado = $pdo->query($query);
    $row = $resultado->fetch(PDO::FETCH_ASSOC);
    $total_licencias_activas = $row['total'];

    // Si hay una o más licencias activas, realizar la acción de registro
    if ($total_licencias_activas >= 1) {

    } else {
        // Si no hay una licencia activa, redirigir al usuario al index.php
        header("Location: ../index.php");
        exit(); // Detener la ejecución del script
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Recuperar-Contraseña</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../Admin/assets/img/favicon.png" rel="icon">
    <link href="../Admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../Admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../Admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../Admin/assets/css/style.css" rel="stylesheet">

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

            <section
                class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4"><a href="../index.php">CRM -
                                                Recuperacion </a></h5>
                                    </div>

                                    <?php
                                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                        require_once '../Config/conexion.php';

                                        $correo = $_POST["correo"];
                                        $db = new Database();
                                        $pdo = $db->conectar();

                                        // Verificar si el correo electrónico existe en la base de datos
                                        $stmt = $pdo->prepare("SELECT * FROM usuario WHERE correo = ?");
                                        $stmt->execute([$correo]);
                                        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

                                        if ($usuario) {
                                            // Generar una nueva contraseña aleatoria
                                            $nueva_contraseña = bin2hex(random_bytes(8)); // Genera una cadena hexadecimal aleatoria de 16 caracteres
                                    
                                            // Encriptar la nueva contraseña
                                            $contraseña_encriptada = password_hash($nueva_contraseña, PASSWORD_DEFAULT);

                                            // Actualizar la contraseña en la base de datos
                                            $sql = "UPDATE usuario SET password = :password WHERE correo = :correo";
                                            $stmt = $pdo->prepare($sql);
                                            $stmt->bindParam(':password', $contraseña_encriptada);
                                            $stmt->bindParam(':correo', $correo);
                                            $stmt->execute();

                                            // Enviar la nueva contraseña por correo electrónico
                                            $mensaje = "Su nueva contraseña es: $nueva_contraseña";
                                            $asunto = "Recuperación de Contraseña";
                                            $headers = "From: tecnelectrics@gmail.com\r\n";
                                            mail($correo, $asunto, $mensaje, $headers);
                                            echo "<script>alert('Se ha enviado una nueva contraseña al correo electrónico proporcionado.'); window.location.href='../login.php?accion=registro';</script>";

                                        } else {
                                            echo "<script>alert('No se encontró ninguna cuenta asociada a este correo electrónico.'); window.location.href='../Email/recuperar.php?accion=registro';</script>";
                                        }
                                    } else {
                                        ?>
                                        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                                            <div class="col-12">

                                                <label for="correo" class="form-label">Ingresa el correo de tu
                                                    session</label>
                                                <div class="input-group has-validation">
                                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                    <input type="email" id="correo" name="correo" class="form-control"
                                                        required>
                                                    <div class="invalid-feedback">Por Favor, ingrese su Correo-electronico!
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-12">
                                                <input class="btn btn-primary w-100" type="submit"
                                                    value="Recuperar Contraseña">
                                            </div>
                                        </form>
                                        </br>
                                        <div class="col-12">
                                            <p class="small mb-0"><a href="../login.php?accion=registro">Inicia Session</a>
                                            </p>
                                        </div>
                                    <?php } ?>

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

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="../Admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="../Admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Admin/assets/vendor/chart.js/chart.umd.js"></script>
    <script src="../Admin/assets/vendor/echarts/echarts.min.js"></script>
    <script src="../Admin/assets/vendor/quill/quill.min.js"></script>
    <script src="../Admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="../Admin/assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="../Admin/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../Admin/assets/js/main.js"></script>

</body>

</html>