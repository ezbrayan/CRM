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

<?php
require_once("Config/conexion.php");

// Crear una instancia de la clase Database para obtener la conexión PDO
$database = new Database();
$pdo = $database->conectar();

// Inicializar mensaje de error
$error = '';

// Verificar si se ha enviado el formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $documento = $_POST["documento"];
    $nombre = $_POST["nombre"];
    $correo = $_POST["correo"];
    $password = $_POST["password"];
    $pin = $_POST["pin"];
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $nitc = $_POST["nitc"];
    $id_tip_usu = $_POST["id_tip_usu"];

    // Validar campos obligatorios
    if (empty($documento) || empty($nombre) || empty($correo) || empty($password) || empty($pin) || empty($telefono) || empty($direccion) || empty($nitc) || empty($id_tip_usu)) {
        echo "<script>alert('Todos los campos son obligatorios.')</script>";
    } else {
        // Verificar si ya existe un usuario con el mismo correo, pin o documento
        $query = "SELECT * FROM usuario WHERE correo = :correo OR pin = :pin OR documento = :documento";
        $stmt = $pdo->prepare($query);
        $stmt->execute(array(':correo' => $correo, ':pin' => $pin, ':documento' => $documento));

        // Si se encuentra algún registro, mostrar un mensaje de error
        if ($stmt->rowCount() > 0) {
            echo "<script>alert('Correo existente o pin')</script>";
        } else {
            // Si no hay registros duplicados, insertar el nuevo usuario
            // Encriptar la contraseña antes de insertarla en la base de datos
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $query = "INSERT INTO usuario (documento, nombre, correo, password, pin, telefono, direccion, nitc, id_tip_usu) 
                      VALUES (:documento, :nombre, :correo, :password, :pin, :telefono, :direccion, :nitc, :id_tip_usu)";
            $stmt = $pdo->prepare($query);
            $stmt->execute(array(
                ':documento' => $documento,
                ':nombre' => $nombre,
                ':correo' => $correo,
                ':password' => $hashed_password, // Guardar la contraseña encriptada
                ':pin' => $pin,
                ':telefono' => $telefono,
                ':direccion' => $direccion,
                ':nitc' => $nitc,
                ':id_tip_usu' => $id_tip_usu
            ));
            // Redirigir al usuario al index.php después del registro exitoso
            header("Location: index.php");
            exit(); // Detener la ejecución del script después de la redirección
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="Assets/css/formulario.css">
    <title>FORMULARIO DE REGISTRO E INICIO SESIÓN</title>
</head>

<body>
    <div class="container-form register">
        <div class="information">
            <div class="info-childs">
                <h2>Bienvenido</h2>
                <p>Para unirte a nuestra comunidad por favor Inicia Sesión con tus datos</p>
                <input type="button" value="Iniciar Sesión" id="sign-in">
            </div>
        </div>
        <div class="form-information">
            <div class="form-information-childs">
                <h2>Crear una Cuenta</h2>
                <p>o usa tu email para registrarte</p>
                <form class="form" method="post">
                    <label for="documento">
                        <i class='bx bx-user'></i>

                        <input type="text" id="documento" name="documento" placeholder="Documento:" required>
                    </label>
                    <label for="nombre">
                        <i class='bx bx-envelope'></i>

                        <input type="text" id="nombre" name="nombre" placeholder="Nombre:" required>
                    </label>
                    <label for="correo">
                        <i class="bx bxl-gmail"></i>
                        <input type="email" id="correo" name="correo" placeholder="Correo:" required>
                    </label>
                    <label for="password">
                        <i class='bx bx-lock-alt'></i>

                        <input type="password" id="password" name="password" placeholder="Contraseña:" required>
                    </label>
                    <label for="pin">
                        <i class='bx bx-lock-alt'></i>

                        <input type="text" id="pin" name="pin" placeholder="PIN:" required>
                    </label>
                    <label for="telefono">
                        <i class='bx bx-phone'></i>

                        <input type="tel" id="telefono" name="telefono" placeholder="Teléfono:" required>
                    </label>
                    <label for="direccion">
                        <i class='bx bx-home'></i>

                        <input type="text" id="direccion" name="direccion" placeholder="Dirección:" required>
                    </label>
                    <label for="nitc">
                        <select id="nitc" name="nitc" placeholder="Nitc:" required>
                            <option value="">Seleccione su empresa</option>
                            <?php
                            // Conectar a la base de datos y obtener los roles
                            require_once("Config/conexion.php");
                            $database = new Database();
                            $pdo = $database->conectar();
                            $query = "SELECT * FROM empresa";
                            $stmt = $pdo->query($query);
                            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . $row['nitc'] . "'>" . $row['nombre'] . "</option>";
                            }
                            ?>
                        </select>
                    </label>
                    <label for="id_tip_usu">
                        <select id="id_tip_usu" name="id_tip_usu" placeholder="usuario:" required>
                            <option value="">Seleccione un tipo de usuario</option>
                            <?php
                            // Conectar a la base de datos y obtener los roles
                            require_once("Config/conexion.php");
                            $database = new Database();
                            $pdo = $database->conectar();
                            $query = "SELECT * FROM roles WHERE id_tip_usu < 2 ";
                            $stmt = $pdo->query($query);
                            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . $row['id_tip_usu'] . "'>" . $row['tip_usu'] . "</option>";
                            }
                            ?>
                        </select>
                    </label>
                    <button type="submit">Registrarse</button>
                </form>
            </div>
        </div>
    </div>

    <div class="container-form login hide">
        <div class="information">
            <div class="info-childs">
                <h2>¡¡Bienvenido nuevamente!!</h2>
                <p>Para unirte a nuestra comunidad por favor Inicia Sesión con tus datos</p>
                <input type="button" value="Registrarme" id="sign-up">
            </div>
        </div>
        <div class="form-information">
            <div class="form-information-childs">
                <h2>Iniciar Sesión</h2>
                <div class="icons">
                    <i class='bx bxl-google'></i>
                    <i class='bx bxl-github'></i>
                    <i class='bx bxl-linkedin'></i>
                </div>
                <p>o Iniciar Sesión con una cuenta</p>
                <form  class="form" method="post">
                    <label for="correo">
                        <i class='bx bx-envelope'></i>
                        
                        <input type="email" id="correo" name="correo" placeholder="Correo:" required>
                    </label>
                    <label for="password">
                        <i class='bx bx-lock-alt'></i>
                        <input type="password" id="password" name="password" placeholder="Contraseña:" required>
                    </label>
                    <button type="submit">Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </div>

    <script src="Assets/js/script.js"></script>
</body>

</html>