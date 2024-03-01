-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 18:27:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clientes`
--
CREATE DATABASE IF NOT EXISTS `clientes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clientes`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentacion`
--

CREATE TABLE `documentacion` (
  `documento_v` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documentacion`
--

INSERT INTO `documentacion` (`documento_v`, `nombre`, `apellido`) VALUES
(200, 'Ana Paula', 'Vaquero'),
(1000, 'Jhon', 'Vaquiro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documentacion`
--
ALTER TABLE `documentacion`
  ADD PRIMARY KEY (`documento_v`);
--
-- Base de datos: `crm`
--
CREATE DATABASE IF NOT EXISTS `crm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crm`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(11) NOT NULL,
  `tip_cat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `tip_cat`) VALUES
(1, 'Hardware'),
(2, 'Software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_daño`
--

CREATE TABLE `detalle_daño` (
  `id_detalle_daño` int(10) NOT NULL,
  `id_daño` int(10) NOT NULL,
  `pasos_solucion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_daño`
--

INSERT INTO `detalle_daño` (`id_detalle_daño`, `id_daño`, `pasos_solucion`) VALUES
(1, 1, 'Si el dispositivo está congelado pero aún responde, intenta cerrar todas las aplicaciones y procesos abiertos.'),
(2, 1, 'Si el dispositivo muestra una pantalla azul o está congelado, intenta reiniciarlo presionando y manteniendo el botón de encendido/apagado.'),
(3, 1, 'Si el problema comenzó después de instalar un nuevo software o programa, intenta desinstalarlo.'),
(4, 2, 'Reinicia la computadora en modo seguro, presionando la tecla F8 antes de que Windows se cargue por completo. Esto hará que se cargue lo necesario para eliminar el malware.'),
(5, 2, 'Utiliza un software antivirus confiable y actualizado para realizar un escaneo completo del sistema en busca de malware.'),
(6, 2, 'Una vez que el escaneo esté completo, sigue las instrucciones del antivirus para eliminar cualquier malware detectado. '),
(7, 3, 'Por lo general los archivos o datos eliminados en su mayor medida se pueden encontrar y recuperar en la papelera de reciclaje.'),
(8, 3, 'Si los datos o archivos ya fueron eliminados en su totalidad, debe descargar un software de recuperación de datos confiable y actualizado como: Recuva, EaseUS Data Recovery Wizard, TestDisk, etc.'),
(9, 3, 'Una vez descargado e instalado el software de recuperación de datos, debe seguir las instrucciones proporcionadas por el programa para realizar un escaneo completo del dispositivo.'),
(10, 4, 'Identificar los programas que estén haciendo interferencia, si no logran ser identificados debe cerrar todos los programas que no sean esenciales para la tarea que este realizando.'),
(11, 4, 'Reinicie la computadora, esto puede resolver problemas temporales de interferencia entre programas.'),
(12, 4, 'Asegúrese de que los programas estén instalados en un sistema que cumpla con los requisitos mínimos de hardware y software'),
(13, 5, 'Revisa las conexiones físicas y verifica que los dispositivos estén correctamente conectados a los puertos correspondientes.'),
(14, 5, 'Asegúrate de que haya una buena señal Wi-Fi en el área donde estás intentando conectarte. Puedes probar acercarte al enrutador para mejorar la señal o en su defecto reiniciarlo.'),
(15, 5, 'Prueba conectando el dispositivo a otro puerto USB de tu computadora.'),
(16, 6, 'Asegúrate de que el dispositivo esté ubicado en un lugar bien ventilado y que no esté obstruido por objetos que puedan bloquear las rejillas de ventilación.'),
(17, 6, 'Utiliza aire comprimido o un cepillo suave para limpiar las rejillas de ventilación y lo ventiladores para eliminar el polvo y la suciedad.'),
(18, 6, 'Revisa la carga del procesador verificando si hay programas o procesos que estén utilizando demasiados recursos que esten influyendo en el sobrecalentamiento.'),
(19, 7, 'Asegúrate de que el cable de alimentación esté correctamente enchufado tanto a la toma de corriente como a tu dispositivo (computadora, monitor, etc).'),
(20, 7, 'Si tienes acceso a otra fuente de alimentación compatible con tu dispositivo, intenta usarla para descartar si el problema está en la fuente de alimentación actual.'),
(21, 7, 'Inspecciona los cables de alimentación en busca de posibles cortocircuitos o daños visibles verificando que no haya ningún daño evidente en el cable.'),
(22, 8, 'Revisa la lista de aplicaciones instaladas en el dispositivo y desinstala aquellas que no utilices regularmente o que ocupen mucho espacio en disco.'),
(23, 8, 'Si el dispositivo tiene la capacidad de expandir el almacenamiento mediante tarjetas de memoria, discos duros externos o servicios de almacenamiento en la nube, considera mover archivos grandes o poco utilizados.'),
(24, 8, 'Si el dispositivo tiene almacenamiento limitado y continúa experimentando problemas de espacio, considera la posibilidad de actualizar el disco duro a una unidad de estado sólido (SSD).');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nitc` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`nitc`, `nombre`, `direccion`, `telefono`) VALUES
(12345, 'google', 'Estados_Unidos', '3110852930');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_est` int(11) NOT NULL,
  `tip_est` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_est`, `tip_est`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencia`
--

CREATE TABLE `licencia` (
  `codigo` int(11) NOT NULL,
  `licencia` varchar(100) NOT NULL,
  `nitc` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `licencia`
--

INSERT INTO `licencia` (`codigo`, `licencia`, `nitc`, `estado`, `fecha_inicial`, `fecha_final`) VALUES
(916, 'AD#0yyy6s3SM9XhM48j%', 12345, 1, '2024-03-01', '2025-03-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llamadas`
--

CREATE TABLE `llamadas` (
  `id_llamada` int(11) NOT NULL,
  `documento` int(12) NOT NULL,
  `id_cat` int(10) NOT NULL,
  `id_daño` int(10) NOT NULL,
  `id_est` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

CREATE TABLE `precios` (
  `id_pre` int(10) NOT NULL,
  `id_daño` int(10) NOT NULL,
  `precio` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precios`
--

INSERT INTO `precios` (`id_pre`, `id_daño`, `precio`) VALUES
(1, 1, 10000),
(2, 2, 20000),
(3, 3, 30000),
(4, 4, 40000),
(5, 5, 50000),
(6, 6, 60000),
(7, 7, 70000),
(8, 8, 80000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgos`
--

CREATE TABLE `riesgos` (
  `id_riesgo` int(10) NOT NULL,
  `tip_riesgo` varchar(30) NOT NULL,
  `tiempo_atent` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `riesgos`
--

INSERT INTO `riesgos` (`id_riesgo`, `tip_riesgo`, `tiempo_atent`) VALUES
(1, 'Alto', 'Entre 1 y 3 días hábiles'),
(2, 'Medio', 'Entre 5 y 7 días hábiles'),
(3, 'Bajo', 'Entre 8 y 10 días hábiles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_tip_usu` int(11) NOT NULL,
  `tip_usu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_tip_usu`, `tip_usu`) VALUES
(1, 'Usuario'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(100) NOT NULL,
  `id_llamada` int(11) NOT NULL,
  `id_riesgo` int(10) NOT NULL,
  `tecnico_a` int(10) NOT NULL,
  `id_precio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_daño`
--

CREATE TABLE `tipo_daño` (
  `id_daño` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_daño`
--

INSERT INTO `tipo_daño` (`id_daño`, `nombre`) VALUES
(1, 'Pantalla azul o de congelamiento'),
(2, 'Infección de Malware'),
(3, 'Perdida de datos'),
(4, 'Interferencia entre programas'),
(5, 'Problemas de conectividad'),
(6, 'Problemas de temperatura'),
(7, 'Problemas de alimentación'),
(8, 'Problemas de almacenamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trigger_usuarios`
--

CREATE TABLE `trigger_usuarios` (
  `documento` int(12) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `telefono` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trigger_usuarios`
--

INSERT INTO `trigger_usuarios` (`documento`, `correo`, `password`, `telefono`, `date`, `user_action`) VALUES
(1105610405, 'jdmolina504@misena.edu.co', '$2y$10$IAU0raEutK2B23laBrlZQOVzbzT25JxLIGwe3GnNyx0q6DHS7.kHS', 357864121, '2024-03-01', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `documento` int(12) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `pin` int(10) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nitc` int(10) DEFAULT NULL,
  `id_tip_usu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`documento`, `nombre`, `correo`, `password`, `pin`, `telefono`, `direccion`, `nitc`, `id_tip_usu`) VALUES
(1104544454, 'brayan', 'brayan@misena', '$2y$10$HImeOt.1u8kVSfQSzd4By.gRY.YMaRuCkIwzoAgdCI37agwsFqbi6', 12345, '3202174961', 'mz-casa-14', 12345, 2);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `Trigger_usuarios` AFTER DELETE ON `usuario` FOR EACH ROW INSERT INTO trigger_usuarios (documento, correo, password, telefono, date, user_action) 
    VALUES (OLD.documento, OLD.correo, OLD.password, OLD.telefono, CURDATE(), CURRENT_USER())
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indices de la tabla `detalle_daño`
--
ALTER TABLE `detalle_daño`
  ADD PRIMARY KEY (`id_detalle_daño`),
  ADD KEY `detalle_daño_ibfk_1` (`id_daño`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nitc`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_est`);

--
-- Indices de la tabla `licencia`
--
ALTER TABLE `licencia`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `nitc` (`nitc`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `llamadas`
--
ALTER TABLE `llamadas`
  ADD PRIMARY KEY (`id_llamada`),
  ADD KEY `documento` (`documento`),
  ADD KEY `id_cat` (`id_cat`),
  ADD KEY `id_est` (`id_est`),
  ADD KEY `id_daño` (`id_daño`);

--
-- Indices de la tabla `precios`
--
ALTER TABLE `precios`
  ADD PRIMARY KEY (`id_pre`),
  ADD KEY `id_daño` (`id_daño`);

--
-- Indices de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD PRIMARY KEY (`id_riesgo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_tip_usu`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_llamada` (`id_llamada`),
  ADD KEY `id_riesgo` (`id_riesgo`),
  ADD KEY `tecnico_a` (`tecnico_a`),
  ADD KEY `id_precio` (`id_precio`);

--
-- Indices de la tabla `tipo_daño`
--
ALTER TABLE `tipo_daño`
  ADD PRIMARY KEY (`id_daño`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `nitc` (`nitc`),
  ADD KEY `id_tip_usu` (`id_tip_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_daño`
--
ALTER TABLE `detalle_daño`
  MODIFY `id_detalle_daño` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_est` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `licencia`
--
ALTER TABLE `licencia`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=917;

--
-- AUTO_INCREMENT de la tabla `llamadas`
--
ALTER TABLE `llamadas`
  MODIFY `id_llamada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precios`
--
ALTER TABLE `precios`
  MODIFY `id_pre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  MODIFY `id_riesgo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_tip_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_daño`
--
ALTER TABLE `tipo_daño`
  MODIFY `id_daño` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_daño`
--
ALTER TABLE `detalle_daño`
  ADD CONSTRAINT `detalle_daño_ibfk_1` FOREIGN KEY (`id_daño`) REFERENCES `tipo_daño` (`id_daño`);

--
-- Filtros para la tabla `licencia`
--
ALTER TABLE `licencia`
  ADD CONSTRAINT `licencia_ibfk_1` FOREIGN KEY (`nitc`) REFERENCES `empresa` (`nitc`),
  ADD CONSTRAINT `licencia_ibfk_2` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_est`);

--
-- Filtros para la tabla `llamadas`
--
ALTER TABLE `llamadas`
  ADD CONSTRAINT `llamadas_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `usuario` (`documento`),
  ADD CONSTRAINT `llamadas_ibfk_2` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id_cat`),
  ADD CONSTRAINT `llamadas_ibfk_3` FOREIGN KEY (`id_est`) REFERENCES `estado` (`id_est`),
  ADD CONSTRAINT `llamadas_ibfk_4` FOREIGN KEY (`id_daño`) REFERENCES `tipo_daño` (`id_daño`);

--
-- Filtros para la tabla `precios`
--
ALTER TABLE `precios`
  ADD CONSTRAINT `precios_ibfk_1` FOREIGN KEY (`id_daño`) REFERENCES `tipo_daño` (`id_daño`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_llamada`) REFERENCES `llamadas` (`id_llamada`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_riesgo`) REFERENCES `riesgos` (`id_riesgo`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`tecnico_a`) REFERENCES `usuario` (`id_tip_usu`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_pre`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`nitc`) REFERENCES `empresa` (`nitc`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tip_usu`) REFERENCES `roles` (`id_tip_usu`);
--
-- Base de datos: `fashion`
--
CREATE DATABASE IF NOT EXISTS `fashion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fashion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_servicios`
--

CREATE TABLE `registro_servicios` (
  `ID_Registro` int(11) NOT NULL,
  `ID_Usuarios` int(11) DEFAULT NULL,
  `ID_Servicio` int(11) DEFAULT NULL,
  `Empleado` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_servicios`
--

INSERT INTO `registro_servicios` (`ID_Registro`, `ID_Usuarios`, `ID_Servicio`, `Empleado`, `Fecha`) VALUES
(1, 12345678, 2, 4354345, '2023-09-22'),
(5, 2147483647, 1, 87654321, '2023-09-20'),
(11, 1234657, 3, 87654321, '2023-09-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `ID_Tipos` int(11) NOT NULL,
  `Nombre_t` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`ID_Tipos`, `Nombre_t`) VALUES
(1, 'Admin'),
(2, 'Cliente'),
(3, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicios`
--

CREATE TABLE `tipo_servicios` (
  `ID_Servicio` int(11) NOT NULL,
  `NombreS` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_servicios`
--

INSERT INTO `tipo_servicios` (`ID_Servicio`, `NombreS`, `Descripcion`, `Precio`) VALUES
(1, 'Corte de cabello', 'es un conjunto de técnicas que pueden modificar su longitud y su forma, realizadas con herramientas específicas como: tijeras, navajas, maquinillas.', 5.00),
(2, 'Manicura', 'ratamiento de belleza cosmético en el que se da la forma deseada a las uñas, y se maquillan con un esmalte.', 20.00),
(3, 'Pedicura', 'tratamiento de las afecciones cutáneas córneas propias de los pies lindos.', 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuarios` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Correo_electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Contrasena` varchar(500) DEFAULT NULL,
  `Pint` tinyint(3) DEFAULT NULL,
  `ID_Tipos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuarios`, `Nombre`, `Correo_electronico`, `Telefono`, `Contrasena`, `Pint`, `ID_Tipos`) VALUES
(1234657, 'cesar', 'cesar@misena', '34268513', '$2y$10$rpgPA/liiC6OfKg91ob85e1tb4h3mcSc0.eAYoQP4OhurCnWNaI.K', 26, 2),
(4354345, 'esperancito', 'esperacito@misena', '43243201', '$2y$10$Gch/h7kPijpqG0YZ2fSM.Opc9A31JhRETXCxsd1eiWdHs3UlO.GKW', 122, 3),
(12345678, 'daniel', 'daniel@misena', '3118052930', '$2y$10$AHRMzci8nY/502SpaGJGXuk/qcuhzVhPi3M1CcR1V0z3l/mCKOQAm', 124, 2),
(87654321, 'esperancita', 'espe@misena', '12345678', '$2y$10$ARpWKgoXGk5DYPn9BT73o.8/jWvR.b644uFQzbO4CzC/TJQ64Q1xK', 121, 3),
(1104544454, 'brayan', 'brayan@misena', '3202174961', '$2y$10$mqgRghm2akHIbtMgshPWUuImFqPC3R1dp9PmIwaeftkFPiiB5t7SS', 123, 2),
(2147483647, 'santiago', 'santiago@misena', '4542123', '$2y$10$cKI4t6iMJ9XnkACM4rQhcewwA3ifg5aGRZ3z4zuLaKsyPmezqCJyu', 127, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registro_servicios`
--
ALTER TABLE `registro_servicios`
  ADD PRIMARY KEY (`ID_Registro`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`ID_Tipos`);

--
-- Indices de la tabla `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registro_servicios`
--
ALTER TABLE `registro_servicios`
  MODIFY `ID_Registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `ID_Tipos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  MODIFY `ID_Servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4546;
--
-- Base de datos: `ferreteria_sanchez`
--
CREATE DATABASE IF NOT EXISTS `ferreteria_sanchez` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ferreteria_sanchez`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `ID_DetalleFactura` int(11) NOT NULL,
  `ID_Factura` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(100) NOT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `IVA` decimal(10,2) DEFAULT NULL,
  `Descuento` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Fecha_Contratacion` date DEFAULT NULL,
  `Correo_electronico` varchar(100) DEFAULT NULL,
  `ID_TipoEmpleado` int(11) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_Empleado`, `Nombre`, `Direccion`, `Telefono`, `Fecha_Contratacion`, `Correo_electronico`, `ID_TipoEmpleado`, `Sexo`) VALUES
(1104544454, 'Brayan', 'mz-casa-14', '3202174961', '2023-08-11', 'bfsanchez45@misena.edu.co', 10, 'masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_Factura` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `ID_Sucursal` int(11) DEFAULT NULL,
  `ID_TipoPago` int(11) DEFAULT NULL,
  `Fecha_Factura` date DEFAULT NULL,
  `Total_Pagar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`ID_Factura`, `ID_Usuario`, `ID_Sucursal`, `ID_TipoPago`, `Fecha_Factura`, `Total_Pagar`) VALUES
(1, 15, 11, 1, '2023-08-12', 10000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `CantidadProductos` int(100) NOT NULL,
  `Stock_Minimo` int(11) DEFAULT NULL,
  `Stock_Maximo` int(11) DEFAULT NULL,
  `Fecha_Actualizacion` date DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_Inventario`, `CantidadProductos`, `Stock_Minimo`, `Stock_Maximo`, `Fecha_Actualizacion`, `ID_Producto`) VALUES
(1, 50, 20, 100, '2023-08-12', 2558036);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `ID_TipoMarca` int(11) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `Precio_Compra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `Nombre`, `Descripcion`, `ID_TipoMarca`, `Precio_Venta`, `Precio_Compra`) VALUES
(2558036, 'Martillo', 'herramienta para golpear ', 1, 300.00, 250.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `ID_Sucursal` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Horario` varchar(255) DEFAULT NULL,
  `ID_TipoSucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`ID_Sucursal`, `Nombre`, `Direccion`, `Telefono`, `Horario`, `ID_TipoSucursal`) VALUES
(2558036, 'productmax', 'mz-casa-14', '3202174961', '15:18', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `ID_Tipos` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`ID_Tipos`, `Nombre`) VALUES
(0, 'Administrador'),
(1, 'Gerente de tienda'),
(2, 'Administrador financiero'),
(3, 'Coordinador de recursos humanos'),
(4, 'Supervisor de operaciones logisticas'),
(5, 'Gerente de ventas'),
(6, 'Asistente administrativo'),
(7, 'Técnico de soporte'),
(8, 'Asistente de marketing digital'),
(9, 'Cajero de tienda'),
(10, 'Empleado regular'),
(11, 'Empresa grande'),
(12, 'Empresa mediana'),
(13, 'Empresa pequeña'),
(14, 'Micro empresa'),
(15, 'Cliente'),
(16, 'Proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_pago`
--

CREATE TABLE `tipos_pago` (
  `ID_TipoPago` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_pago`
--

INSERT INTO `tipos_pago` (`ID_TipoPago`, `Nombre`) VALUES
(1, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_marcas`
--

CREATE TABLE `tipo_marcas` (
  `ID_TipoMarca` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_marcas`
--

INSERT INTO `tipo_marcas` (`ID_TipoMarca`, `Nombre`) VALUES
(1, 'Panter');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `ID_TipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre`, `Correo_Electronico`, `Contrasena`, `Telefono`, `Direccion`, `ID_TipoUsuario`) VALUES
(11656678, 'brebt', 'fgfgf@fg', '$2y$10$DcOj3vUFJwRMqdH.hPt34.aF7sa9JBSOUOWpP/Y0gyVnxtJGwCzK.', '46', '65767', 0),
(41516511, 'hjjhj', 'fghhfdhrdt', '$2y$10$S2wgpcBZ2QZj8j83yuGkeeuHcd25YJAhy16BCt6COmbkyctDDUeT6', '52872', 'kuhfuyfkf', 0),
(1104544454, 'Brayan', 'bfsanchez45@misena.edu.co', 'brayan10', '3202174961', 'mz-casa-14', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`ID_DetalleFactura`),
  ADD KEY `ID_Factura` (`ID_Factura`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_CantidadProductos` (`Cantidad`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_TipoEmpleado` (`ID_TipoEmpleado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_TipoPago` (`ID_TipoPago`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `ID_CantidadProductos` (`CantidadProductos`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_TipoMarca` (`ID_TipoMarca`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`ID_Sucursal`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`ID_Tipos`);

--
-- Indices de la tabla `tipos_pago`
--
ALTER TABLE `tipos_pago`
  ADD PRIMARY KEY (`ID_TipoPago`);

--
-- Indices de la tabla `tipo_marcas`
--
ALTER TABLE `tipo_marcas`
  ADD PRIMARY KEY (`ID_TipoMarca`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `ID_DetalleFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `ghg`
--
CREATE DATABASE IF NOT EXISTS `ghg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ghg`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(11) NOT NULL,
  `tip_cat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `tip_cat`) VALUES
(16, 'Software');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_est` int(10) NOT NULL,
  `tip_est` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_est`, `tip_est`) VALUES
(4, 'activo'),
(5, 'desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_tip_usu` int(10) NOT NULL,
  `tip_usu` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_tip_usu`, `tip_usu`) VALUES
(0, 'cliente '),
(2, 'adm');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_est`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_tip_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_est` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Base de datos: `hola`
--
CREATE DATABASE IF NOT EXISTS `hola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hola`;
--
-- Base de datos: `holiwis`
--
CREATE DATABASE IF NOT EXISTS `holiwis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `holiwis`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `id` int(11) UNSIGNED NOT NULL,
  `Contact_Title` varchar(30) DEFAULT NULL,
  `Contact_First` varchar(5) NOT NULL,
  `Contact_Middle` varchar(30) DEFAULT NULL,
  `Contact_Last` varchar(8) NOT NULL,
  `Lead_Referral_Source` varchar(23) NOT NULL,
  `Date_of_Initial_Contact` date NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Company` varchar(16) NOT NULL,
  `Industry` varchar(12) NOT NULL,
  `Address` varchar(38) NOT NULL,
  `Address_Street_1` varchar(17) NOT NULL,
  `Address_Street_2` varchar(30) DEFAULT NULL,
  `Address_City` varchar(12) NOT NULL,
  `Address_State` char(2) NOT NULL DEFAULT '',
  `Address_Zip` int(11) NOT NULL,
  `Address_Country` varchar(30) DEFAULT NULL,
  `Phone` varchar(14) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Status` int(11) UNSIGNED NOT NULL,
  `Website` varchar(23) NOT NULL,
  `LinkedIn_Profile` varchar(21) NOT NULL,
  `Background_Info` text NOT NULL,
  `Sales_Rep` int(11) UNSIGNED NOT NULL,
  `Rating` decimal(4,2) NOT NULL,
  `Project_Type` varchar(35) DEFAULT NULL,
  `Project_Description` tinytext DEFAULT NULL,
  `Proposal_Due_Date` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Deliverables` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `contact`
--

INSERT INTO `contact` (`id`, `Contact_Title`, `Contact_First`, `Contact_Middle`, `Contact_Last`, `Lead_Referral_Source`, `Date_of_Initial_Contact`, `Title`, `Company`, `Industry`, `Address`, `Address_Street_1`, `Address_Street_2`, `Address_City`, `Address_State`, `Address_Zip`, `Address_Country`, `Phone`, `Email`, `Status`, `Website`, `LinkedIn_Profile`, `Background_Info`, `Sales_Rep`, `Rating`, `Project_Type`, `Project_Description`, `Proposal_Due_Date`, `Budget`, `Deliverables`) VALUES
(1, NULL, 'Amir', NULL, 'Kahnzz', 'www.google .com', '2014-05-09', 'PR Director', 'Barnes and Wells', 'PR', '52 Broadway New York, NY 12345', '52 Broadway', NULL, 'New York', 'NY', 12345, NULL, '(234) 432-2234', 'amir@pr.com', 1, 'www.pr.com', 'www.sample.com', '4 years as PR Dir. Knows the biz and has wide network.', 1, 4.00, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'Dave', NULL, 'Myers', 'Mack Truck Partner Site', '2014-02-11', 'DEF Sales', 'DEF Fluids', 'Auto', '456 Diesel St Philadelphia, PA 19308', '456 Diesel St', NULL, 'Philadelphia', 'PA', 19308, NULL, '(765) 765-7755', 'dave@def.com', 2, 'www.def.com', 'www.sample.com', '19 years in biz', 2, 2.50, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'Jason', NULL, 'Wright', 'salesforce associate', '2014-09-12', 'Marketing Director', 'Ben and Jerry\'s', 'Food', '123 Ice Cream Way Burlington, VT 12345', '123 Ice Cream Way', NULL, 'Burlington', 'VT', 12345, NULL, '(123) 432-1223', 'eat@benandjerrys.com', 1, 'www.benandjerrys.com', 'http://www.sample.com', 'Amazing ice creme company from Vermont. Sustainable practices.', 1, 4.00, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'Linda', NULL, 'DeCastro', 'Conference', '2014-01-19', 'Regional Sales Mgr', 'Pillsbury', 'Retail Foods', '44 Reading Rd Flourtown, NJ 39485', '44 Reading Rd', NULL, 'Flourtown', 'NJ', 39485, NULL, '(555) 555-5555', 'linda@pillsbury.com', 3, 'www.pillsbury.com', 'www.sample.com', 'New territory MGR', 1, 3.00, 'New Packaging for Cookie products', 'Design new cookie packaging for new line of Sugar Free cookies.', '2014-11-01', 45000.00, '6 Proofs, multiple assets'),
(5, NULL, 'Sally', NULL, 'Jane', 'CES Conference', '2014-07-01', 'COO', 'Facetech', 'Tech', '123 Tech Blvd Menlo Park, CA 12345', '123 Tech Blvd', NULL, 'Menlo Park', 'CA', 12345, NULL, '(321) 321-1122', 'sally@facetech.com', 1, 'http://www.facetech.com', 'www.sample.com', 'Great contact, has a really great roadmap.', 1, 5.00, NULL, NULL, NULL, 30000.00, NULL),
(6, NULL, 'Tim', NULL, 'Smith', 'www.google.com', '2014-10-10', 'Supply Chain Manager', 'Levis', 'Apparel', '1 Blue Jean St. Corduroy, CO 12345', '1 Blue Jean St.', NULL, 'Corduroy', 'CO', 12345, NULL, '(321) 321-4321', 'tim@levis.com', 2, 'www.levis.com', 'www.sample.com', 'Jeans and apparel for eastern U.S.<br />', 1, 3.50, 'Shelf talkers; kiosk style displays', 'Set up shelf talkers for stock shelves with an end of aisle kiosk detailing the history of Levis.', '2014-11-05', 333000.00, '10k shelf talkers, 1500 kiosks');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact_status`
--

CREATE TABLE `contact_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `contact_status`
--

INSERT INTO `contact_status` (`id`, `status`) VALUES
(1, 'lead'),
(2, 'opportunity'),
(3, 'customer/won'),
(4, 'archive');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notes`
--

CREATE TABLE `notes` (
  `id` int(11) UNSIGNED NOT NULL,
  `Date` date DEFAULT NULL,
  `Notes` tinytext DEFAULT NULL,
  `Is_New_Todo` int(11) UNSIGNED NOT NULL,
  `Todo_Type_ID` int(11) UNSIGNED NOT NULL,
  `Todo_Desc_ID` int(11) UNSIGNED NOT NULL,
  `Todo_Due_Date` varchar(29) DEFAULT NULL,
  `Contact` int(11) UNSIGNED NOT NULL,
  `Task_Status` int(11) UNSIGNED NOT NULL,
  `Task_Update` varchar(51) DEFAULT NULL,
  `Sales_Rep` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `notes`
--

INSERT INTO `notes` (`id`, `Date`, `Notes`, `Is_New_Todo`, `Todo_Type_ID`, `Todo_Desc_ID`, `Todo_Due_Date`, `Contact`, `Task_Status`, `Task_Update`, `Sales_Rep`) VALUES
(1, '2014-07-11', 'ddddd', 1, 1, 1, '07/23/2014 6:00pm to 8:00pm', 1, 1, '', 1),
(2, '2015-10-10', 'Sample Note', 0, 1, 1, NULL, 2, 1, NULL, 2),
(3, '2015-05-21', 'sx', 1, 1, 2, '07/31/2014', 3, 1, '', 1),
(4, '2014-06-01', 'Want to be sure to communicate weekly.', 1, 2, 3, '07/04/2014 10:00am to 10:30am', 4, 1, 'Ongoing', 1),
(5, '2014-01-31', 'Was introduced at textile conference.zzz', 1, 1, 1, '04/09/2014 3:45pm to 4:45pm', 5, 2, 'Great demo. All they needed to seal the deal.<br>', 1),
(6, '2014-11-11', 'Great to have this customer on board!', 0, 1, 4, NULL, 6, 1, NULL, 1),
(7, '2017-01-27', 'test', 0, 1, 2, '', 3, 1, '', 1),
(8, '2017-01-11', 'test123', 0, 1, 5, NULL, 6, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `role` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Sales Rep'),
(2, 'Sales Manager'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_status`
--

CREATE TABLE `task_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `task_status`
--

INSERT INTO `task_status` (`id`, `status`) VALUES
(1, 'pending'),
(2, 'completed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todo_desc`
--

CREATE TABLE `todo_desc` (
  `id` int(11) UNSIGNED NOT NULL,
  `description` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `todo_desc`
--

INSERT INTO `todo_desc` (`id`, `description`) VALUES
(1, 'Follow Up Email'),
(2, 'Phone Call'),
(3, 'Lunch Meeting'),
(4, 'Tech Demo'),
(5, 'Meetup'),
(6, 'Conference'),
(7, 'Others');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todo_type`
--

CREATE TABLE `todo_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `todo_type`
--

INSERT INTO `todo_type` (`id`, `type`) VALUES
(1, 'task'),
(2, 'meeting');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name_Title` varchar(30) DEFAULT NULL,
  `Name_First` varchar(6) NOT NULL,
  `Name_Middle` varchar(30) DEFAULT NULL,
  `Name_Last` varchar(8) NOT NULL,
  `Email` varchar(16) NOT NULL,
  `Password` varchar(9) NOT NULL,
  `User_Roles` int(11) UNSIGNED NOT NULL,
  `User_Status` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `Name_Title`, `Name_First`, `Name_Middle`, `Name_Last`, `Email`, `Password`, `User_Roles`, `User_Status`) VALUES
(1, NULL, 'Johnny', NULL, 'Rep', 'rep@test.com', '123456', 1, 1),
(2, NULL, 'Mary', NULL, 'Rep', 'rep2@test.com', '123456', 1, 1),
(3, NULL, 'Suzy', NULL, 'Manager', 'manager@test.com', '123456', 2, 1),
(4, NULL, 'Sales', NULL, 'Manager1', 'sm@sm.com', '123456', 2, 1),
(5, NULL, 'Rich', NULL, 'C', 'test@test.com', '123456', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user_status`
--

INSERT INTO `user_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'inactive'),
(3, 'pending approval');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SALES_REP` (`Sales_Rep`),
  ADD KEY `FK_STATUS` (`Status`);

--
-- Indices de la tabla `contact_status`
--
ALTER TABLE `contact_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EVENT_NAME` (`Todo_Type_ID`),
  ADD KEY `FK_EVENT_TYPE` (`Todo_Desc_ID`),
  ADD KEY `FK_CONTACT_ID` (`Contact`),
  ADD KEY `FK_SALES_ID` (`Sales_Rep`),
  ADD KEY `FK_TASK_STATUS` (`Task_Status`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `todo_desc`
--
ALTER TABLE `todo_desc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `todo_type`
--
ALTER TABLE `todo_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USER_STATUS` (`User_Status`),
  ADD KEY `FK_ROLE` (`User_Roles`);

--
-- Indices de la tabla `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `contact_status`
--
ALTER TABLE `contact_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `todo_desc`
--
ALTER TABLE `todo_desc`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `todo_type`
--
ALTER TABLE `todo_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_SALES_REP` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_STATUS` FOREIGN KEY (`Status`) REFERENCES `contact_status` (`id`);

--
-- Filtros para la tabla `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `FK_CONTACT_ID` FOREIGN KEY (`Contact`) REFERENCES `contact` (`id`),
  ADD CONSTRAINT `FK_EVENT_NAME` FOREIGN KEY (`Todo_Type_ID`) REFERENCES `todo_type` (`id`),
  ADD CONSTRAINT `FK_EVENT_TYPE` FOREIGN KEY (`Todo_Desc_ID`) REFERENCES `todo_desc` (`id`),
  ADD CONSTRAINT `FK_SALES_ID` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_TASK_STATUS` FOREIGN KEY (`Task_Status`) REFERENCES `task_status` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_ROLE` FOREIGN KEY (`User_Roles`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FK_USER_STATUS` FOREIGN KEY (`User_Status`) REFERENCES `user_status` (`id`);
--
-- Base de datos: `menu`
--
CREATE DATABASE IF NOT EXISTS `menu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `menu`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(3) NOT NULL,
  `imagen` varchar(55) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `imagen`, `nombre`) VALUES
(1, '../img_prod/tacos-todos.jpg', 'picada'),
(2, '../img_prod/postres_img.jpg', 'Postres'),
(3, '../img_prod/bebidas_todas.jpg', 'Bebidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `cve_comentario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `comentario` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`cve_comentario`, `nombre`, `apellidos`, `correo`, `telefono`, `comentario`, `timestamp`) VALUES
(3, 'Leonardo', 'Madrigal Pardo', 'leo@gmail.com', '9932408301', 'ola buenas tardes que buena pagina 👍', '2022-08-20 20:51:51'),
(4, 'ola', 'asd', 'asd', '123', 'TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO TEXTO ', '2022-08-20 21:20:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `imagen` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_usuario`, `correo`, `password`, `nombre`, `imagen`) VALUES
(1, 'leo@gmail.com', '123', 'Leonardo', '../img_admin/fot3.jpg'),
(2, 'alfredo@gmail.com', '1234', 'Alfredo', '../img_admin/869283.jpg'),
(3, 'eva@gmail.com', '123', 'eva', '../img_admin/1005830.jpg'),
(4, 'itzelita@gmail.com', '123', 'Itzelita❤️', '../img_admin/familia 👌👌.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `cve_noticia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `contenido` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`cve_noticia`, `fecha`, `titulo`, `contenido`) VALUES
(5, '2022-08-20', 'Buenas Noticias', 'Se agrega un nuevo platillo de PASTEL CON QUESO'),
(6, '2022-08-16', 'nopi', '123ffffffff'),
(7, '2022-08-22', 'asdawd', 'asdawds'),
(8, '2022-08-15', 'asdasd', 'asdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cve_producto` int(4) NOT NULL,
  `imagen` varchar(60) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int(11) NOT NULL,
  `id_categoria` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cve_producto`, `imagen`, `nombre`, `descripcion`, `precio`, `id_categoria`) VALUES
(1, '../img_prod/pastor.jpg', 'Pastor ', 'carne de dudosa procedencia', 15, 1),
(2, '../img_prod/shirlon.jpg', 'Shirlon', 'carne de dudosa procedencia', 20, 1),
(3, '../img_prod/cochinita.webp', 'Cochinita', 'carne de dudosa procedencia', 12, 1),
(4, '../img_prod/canasta.jpg', 'Canasta', 'carne de dudosa procedencia', 16, 1),
(5, '../img_prod/churros.jpg', 'churros', 'carne dudosa procedencia', 10, 2),
(6, '../img_prod/donas.jpg', 'donas', 'carne dudosa procedencia', 7, 2),
(7, '../img_prod/pastes chocolate.jfif', 'pastel chocolate', 'carne dudosa procedencia', 55, 2),
(8, '../img_prod/pay.jfif', 'pay manzana', 'carne dudosa procedencia', 50, 2),
(9, '../img_prod/jugo de naranja.jpg', 'jugo naranja', 'agua dudosa procedencia', 25, 3),
(10, '../img_prod/chokomilk.jpg', 'chocomilk', 'agua dudosa procedencia', 30, 3),
(11, '../img_prod/agua.jfif', 'agua natural', 'natural', 10, 3),
(12, '../img_prod/cafe.jpg', 'cafe', 'agua locas', 30, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cve_usuario` tinyint(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ap_paterno` text NOT NULL,
  `ap_materno` text NOT NULL,
  `imagen` varchar(55) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cve_usuario`, `nombre`, `ap_paterno`, `ap_materno`, `imagen`, `telefono`, `direccion`) VALUES
(1, 'Leonardo', 'Madrigal', 'Pardo', '../img_usuario/1000030.jpg', '9932408301', 'La magan uno, Calle uno'),
(2, 'Alfredo', 'Perez', 'Garcia', '../img_usuario/1009824.jpg', '9932408302', 'Mercado de la cierra'),
(3, 'eva', 'castro', 'prats', '../img_usuario/valorant_jett_by_agussw_defl7wa-pre.jpg', '9932408302', 'Bajo el puente'),
(4, 'Ana', 'aurora', 'si', '../img_usuario/1034735.png', '9940789371', 'asdasd');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`cve_comentario`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`cve_noticia`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cve_producto`),
  ADD KEY `productos_cate_fk` (`id_categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cve_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `cve_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `cve_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `cve_producto` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cve_usuario` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'prueba_datos', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":\"usuarios\",\"table_structure[]\":\"usuarios\",\"table_data[]\":\"usuarios\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'dios', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"categorias\",\"estado\",\"galeria\",\"productos\",\"tipo_usuario\",\"usuarios\"],\"table_structure[]\":[\"categorias\",\"estado\",\"galeria\",\"productos\",\"tipo_usuario\",\"usuarios\"],\"table_data[]\":[\"categorias\",\"estado\",\"galeria\",\"productos\",\"tipo_usuario\",\"usuarios\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"crm\",\"table\":\"tipo_da\\u00f1o\"},{\"db\":\"crm\",\"table\":\"trigger_usuarios\"},{\"db\":\"crm\",\"table\":\"usuario\"},{\"db\":\"crm\",\"table\":\"roles\"},{\"db\":\"crm\",\"table\":\"empresa\"},{\"db\":\"crm\",\"table\":\"licencia\"},{\"db\":\"crm\",\"table\":\"estado\"},{\"db\":\"crm\",\"table\":\"llamadas\"},{\"db\":\"crm\",\"table\":\"precios\"},{\"db\":\"crm\",\"table\":\"riesgos\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('tecni-electric', 'detalle_pedidos', 'producto'),
('tecni-electric', 'productos', 'nombre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'crm', 'usuario', '{\"CREATE_TIME\":\"2024-02-29 18:56:13\",\"col_order\":[0,1,2,3,4,5,6,7,8],\"col_visib\":[1,1,1,1,1,1,1,1,1]}', '2024-03-01 14:58:14'),
('root', 'fashion', 'tipos', '[]', '2023-09-06 21:51:55'),
('root', 'ferreteria_sanchez', 'inventario', '{\"CREATE_TIME\":\"2023-08-12 16:13:50\",\"col_order\":[0,1,2,3,4,5],\"col_visib\":[1,1,1,1,1,1]}', '2023-08-12 21:16:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-01 16:54:13', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `proyecto`
--
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(30) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_departamento` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `id_departamento`) VALUES
(1, 'ibague', 0),
(2, 'cali', 0),
(3, 'medellin', 0),
(4, 'bogota', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(30) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `id_ciudad` int(30) NOT NULL,
  `genero` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `id_ciudad`, `genero`) VALUES
(100, 'Jhon', 'Vaquiro', 0, ''),
(2000, 'Ana Paula', 'Vaquiro', 0, ''),
(1104544454, 'Brayan', 'Sanchez', 1, 'masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(30) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);
--
-- Base de datos: `prueba_datos`
--
CREATE DATABASE IF NOT EXISTS `prueba_datos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba_datos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre`, `edad`) VALUES
(1, 'Ana paula', 10),
(2, 'Jhon ', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);
--
-- Base de datos: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurante`;
--
-- Base de datos: `restaurante_juli`
--
CREATE DATABASE IF NOT EXISTS `restaurante_juli` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurante_juli`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'en-espera'),
(2, 'entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `id_plato_diario` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `documento`, `fecha`, `total`, `id_plato_diario`, `id_estado`) VALUES
(11, 1104544454, '2023-11-20', 2, 1, 2),
(145, 1104544454, '2023-11-23', 500, 2, 1),
(1566, 1234567899, '2023-11-20', 77572, 1, 1),
(1567, 1234567899, '2023-11-16', 5252, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_diario`
--

CREATE TABLE `plato_diario` (
  `id_plato_diario` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `id_plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `plato_diario`
--

INSERT INTO `plato_diario` (`id_plato_diario`, `precio`, `id_plato`) VALUES
(1, 22000, 1),
(3, 44444, 2),
(4, 20000, 3),
(7870, 8000, 11),
(7871, 300, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_rol` int(11) NOT NULL,
  `tipo_usu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_rol`, `tipo_usu`) VALUES
(1, 'Administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_plato`
--

CREATE TABLE `tip_plato` (
  `id_plato` int(11) NOT NULL,
  `plato` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tip_plato`
--

INSERT INTO `tip_plato` (`id_plato`, `plato`) VALUES
(1, 'arroz paisa'),
(2, 'carne sudada'),
(3, 'sancocho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `documento` bigint(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`documento`, `nombre`, `telefono`, `correo`, `password`, `id_rol`) VALUES
(1104544454, 'brayan', '3202174695', 'bf@bf', '$2y$10$kvBCu7f0mUAyIPSxehVM.ezp0gtBkrG.YBufq.yt7J99Er3EOfoQ.', 1),
(1105610405, 'molina', '3108052930', 'mo@mo', '$2y$10$FMVGy7Y1UCxMwd.c1D7Ss.oJRwEASkBfqLYtflFvPGjB98NlvQa7K', 1),
(1234567899, 'julian', '9876543219', 'ju@ju', '$2y$10$aeeRIb0qEG7vwmPX/VT64uwtZh9E1fwmgXJoJtrsC//Nhw.GR9VF6', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `plato_diario`
--
ALTER TABLE `plato_diario`
  ADD PRIMARY KEY (`id_plato_diario`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tip_plato`
--
ALTER TABLE `tip_plato`
  ADD PRIMARY KEY (`id_plato`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1568;

--
-- AUTO_INCREMENT de la tabla `plato_diario`
--
ALTER TABLE `plato_diario`
  MODIFY `id_plato_diario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7872;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT de la tabla `tip_plato`
--
ALTER TABLE `tip_plato`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Base de datos: `tecni-electric`
--
CREATE DATABASE IF NOT EXISTS `tecni-electric` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tecni-electric`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `cantidad`, `id_producto`, `id_cliente`) VALUES
(1, 5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'fddf', 'Assets/images/categorias/20240120033518.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'defaul.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(1, 'felipe', 'tecnelectrics@gmail.com', '$2y$10$sdoJqH.uN4ThnkxLwnbFS.MNzyDfqrtbSLjebL4.YxaVOCoUuY6/.', 'defaul.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'gfg', 887.00, 1, 1, 1),
(2, 'gfg', 887.00, 12, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3','') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6RH00099F9090433A', 887.00, 'COMPLETED', '2024-01-20 16:42:26', 'sb-e1rh829095745@personal.example.com', 'John', 'Doe', 'calle Vilamari 76993- 17469', 'Albacete', 1, '1'),
(2, '0678474528415161A', 10644.00, 'COMPLETED', '2024-01-20 16:43:18', 'sb-e1rh829095745@personal.example.com', 'John', 'Doe', 'calle Vilamari 76993- 17469', 'Albacete', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'gfg', '<p>fgjjf</p>', 887.00, 65, 'Assets/images/productos/20240120033531.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'nuevo', 'usuario', 'tecnelectrics@gmail.com', '$2y$10$YbG7OxB8Ful.3LwUfLpGu.CoC3fuu84N7Shwo8NsnfXfZ6NyuUqHu', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda_freelancer`
--
CREATE DATABASE IF NOT EXISTS `tienda_freelancer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tienda_freelancer`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` int(255) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `password_usuario` varchar(255) NOT NULL,
  `rol_usuario` varchar(20) NOT NULL,
  `avatar_usuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Tabla de registro de usuarios';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` int(255) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `usuarios`
--
CREATE DATABASE IF NOT EXISTS `usuarios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `usuarios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trigger_users`
--

CREATE TABLE `trigger_users` (
  `documento` int(12) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `telefono` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trigger_users`
--

INSERT INTO `trigger_users` (`documento`, `correo`, `password`, `telefono`, `date`, `user_action`) VALUES
(54644, 'dfsdfd@gfh', 'fghdgh', 6754, '2024-03-01 00:00:00', 'CURRENT_USER_VALUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `documento` int(12) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `pin` int(10) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nitc` int(10) NOT NULL,
  `id_ti_usu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `Trigger_usuarios` AFTER DELETE ON `usuario` FOR EACH ROW INSERT INTO trigger_users (documento, correo, password, telefono, date, user_action) 
VALUES (old.documento, old.correo, old.password, old.telefono, CURDATE(), 'CURRENT_USER_VALUE')
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
