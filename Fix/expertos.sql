-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2015 a las 16:43:29
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `expertos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ccaa_mejoras`
--

CREATE TABLE IF NOT EXISTS `ccaa_mejoras` (
`ID` bigint(20) NOT NULL COMMENT 'ID de la Mejora',
  `PRODUCTOS_ID` bigint(20) NOT NULL COMMENT 'ID del Producto',
  `TITULO` varchar(100) NOT NULL COMMENT 'Titulo de la Mejora',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado de la Mejora',
  `ARBOL` varchar(100) DEFAULT NULL COMMENT 'Arbol de la Mejora',
  `FECHA_SOLICITUD` date DEFAULT NULL COMMENT 'Fecha de la Solicitud',
  `IMPLEMENTACION` date DEFAULT NULL COMMENT 'Fecha de Implementacion',
  `RESPONSABLE` varchar(100) DEFAULT NULL COMMENT 'Responsable de la Mejora'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ccaa_productos`
--

CREATE TABLE IF NOT EXISTS `ccaa_productos` (
`ID` bigint(20) NOT NULL COMMENT 'ID del Producto',
  `NOMBRE` varchar(100) NOT NULL COMMENT 'Nombre del Producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_mensaje`
--

CREATE TABLE IF NOT EXISTS `chat_mensaje` (
`ID` bigint(20) NOT NULL,
  `FECHA` datetime NOT NULL,
  `ID_USUARIO` bigint(20) NOT NULL COMMENT 'ID de Usuario',
  `IP` varchar(255) NOT NULL,
  `MENSAJE` longtext NOT NULL,
  `TIPO` int(2) NOT NULL COMMENT 'ID de Tipo de Chat',
  `ID_SALA` int(3) DEFAULT NULL COMMENT 'ID de la Sala',
  `DE` bigint(20) DEFAULT NULL COMMENT 'ID de Usuario de Fuente',
  `PARA` bigint(20) DEFAULT NULL COMMENT 'ID de Usuario de Destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_perfil`
--

CREATE TABLE IF NOT EXISTS `chat_perfil` (
`ID` int(3) NOT NULL COMMENT 'ID de  Perfil de Chat',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Perfil',
  `PERMISO_NOMBRE` bigint(20) NOT NULL COMMENT 'ID del Nombre del Permiso'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_perfil`
--

INSERT INTO `chat_perfil` (`ID`, `ESTADO`, `PERMISO_NOMBRE`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_salas`
--

CREATE TABLE IF NOT EXISTS `chat_salas` (
`ID` int(3) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL COMMENT 'Nombre de la Sala',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado de la Sala'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_salas`
--

INSERT INTO `chat_salas` (`ID`, `NOMBRE`, `ESTADO`) VALUES
(1, 'SERVICE_DESK', 1),
(2, 'APOYO_PISO', 1),
(3, 'INVITADOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_salas_has_chat_perfil`
--

CREATE TABLE IF NOT EXISTS `chat_salas_has_chat_perfil` (
  `chat_salas_ID` int(3) NOT NULL COMMENT 'ID de la Sala del Chat',
  `chat_perfil_ID` int(3) NOT NULL COMMENT 'ID del Perfil del Chat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_salas_has_chat_perfil`
--

INSERT INTO `chat_salas_has_chat_perfil` (`chat_salas_ID`, `chat_perfil_ID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_tipo`
--

CREATE TABLE IF NOT EXISTS `chat_tipo` (
`ID` int(2) NOT NULL COMMENT 'ID del Tipo de Chat',
  `NOMBRE` varchar(50) NOT NULL COMMENT 'Nombre del Tipo de Chat'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_tipo`
--

INSERT INTO `chat_tipo` (`ID`, `NOMBRE`) VALUES
(1, 'PUBLICO'),
(2, 'PRIVADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
`ID` int(2) NOT NULL COMMENT 'ID del Estado',
  `ESTADO` varchar(50) NOT NULL COMMENT 'Texto del Estado'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`ID`, `ESTADO`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO'),
(3, 'PENDIENTE'),
(4, 'FINALIZADO'),
(5, 'GUARDADO'),
(6, 'ELIMINADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_cablemodem`
--

CREATE TABLE IF NOT EXISTS `lista_cablemodem` (
`ID` int(3) NOT NULL COMMENT 'ID de Cablemodem',
  `MARCA` varchar(100) NOT NULL COMMENT 'Marca del Cablemodem',
  `REFERENCIA` varchar(250) NOT NULL COMMENT 'Referencia del Cablemodem',
  `FIRMWARE` varchar(100) NOT NULL COMMENT 'Firmware del Cablemodem',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Cablemodem'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_cablemodem`
--

INSERT INTO `lista_cablemodem` (`ID`, `MARCA`, `REFERENCIA`, `FIRMWARE`, `ESTADO`) VALUES
(1, 'Motorola', 'SBG900', '2.1.18.0-NOSH', 1),
(2, 'Motorola', 'SBG940', '2.1.18.0-NOSH', 1),
(3, 'Motorola', 'SVG1202', '05-741-LTSH', 1),
(4, 'Motorola', 'SBG901\r\n', '03-501-NOSH ', 1),
(5, 'ARRIS', '862', '7.5.125B', 1),
(6, 'ARRIS', '862', '7.5.125C', 1),
(7, 'Thomson', 'DCW725', 'ST5A.31.13', 1),
(8, 'Thomson', 'DWG849', 'STC0.01.16', 1),
(9, 'Technicolor', 'TC7110', 'STD3.31.19', 1),
(10, 'Technicolor', 'TC7300', 'STF3.31.02', 1),
(11, 'Ubee', '2608', '5,117,1007', 1),
(12, 'Ubee', '2100', '6.28.4003', 1),
(13, 'Ubee', '2110', '6.36.1005', 1),
(14, 'Cisco', 'DPC2420', '120921as', 1),
(15, 'Cisco', 'DPC2420R2', '140106as-v6', 1),
(16, 'Cisco', 'DPC2425', '120921as', 1),
(17, 'Cisco', 'DPC2434-X', '110128as', 1),
(18, 'Cisco', 'DPC3925', '131025a', 1),
(19, 'Cisco', 'DPC3925', '140829a', 1),
(20, 'Coship', 'Claro Video', 'N9085I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_cargo`
--

CREATE TABLE IF NOT EXISTS `lista_cargo` (
  `ID` int(2) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL COMMENT 'Nombre del Cargo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_cargo`
--

INSERT INTO `lista_cargo` (`ID`, `NOMBRE`) VALUES
(1, 'MEJORAMIENTO '),
(2, 'CAUSA_RAIZ'),
(3, 'SERVICE_DESK'),
(4, 'APOYO_EXPERTO'),
(5, 'LIDER'),
(6, 'TORRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_decodificadores`
--

CREATE TABLE IF NOT EXISTS `lista_decodificadores` (
`ID` int(3) NOT NULL COMMENT 'ID Decodificador',
  `MARCA` varchar(100) NOT NULL COMMENT 'Marca del Decodificador',
  `REFERENCIA` varchar(250) NOT NULL COMMENT 'Referencia del Decodificador',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Cablemodem'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_decodificadores`
--

INSERT INTO `lista_decodificadores` (`ID`, `MARCA`, `REFERENCIA`, `ESTADO`) VALUES
(1, 'Motorola', 'General', 1),
(2, 'Motorola', 'General_HD', 1),
(3, 'Motorola', 'General_SD', 1),
(4, 'Motorola', 'General_PVR', 1),
(5, 'Motorola', 'DC1', 1),
(6, 'Motorola', 'DC7', 1),
(7, 'Motorola', 'DC8', 1),
(8, 'Motorola', 'DCI', 1),
(9, 'Motorola', 'DCV', 1),
(10, 'Motorola', 'D34', 1),
(11, 'Motorola', 'DCX', 1),
(12, 'Motorola', 'DX2', 1),
(13, 'Motorola', 'DX4', 1),
(14, 'Motorola', 'DX5', 1),
(15, 'Motorola', 'DX7', 1),
(16, 'Motorola', 'Arris_X25', 1),
(17, 'DVB', 'General', 1),
(18, 'DVB', 'General_SD', 1),
(19, 'DVB', 'General_HD', 1),
(20, 'DVB', 'General_PVR', 1),
(21, 'DVB_Huawei', 'SD_HLC ', 1),
(22, 'DVB_Huawei', 'SD_WHI ', 1),
(23, 'DVB_Huawei', 'HD_HHD', 1),
(24, 'DVB_Huawei', 'PVR_HPV', 1),
(25, 'DVB_Skyworth', 'SD_SKY', 1),
(26, 'DVB_Coship', 'SD_CSH', 1),
(27, 'DVB_Coship', 'HD_CHD', 1),
(28, 'DTH', 'General', 1),
(29, 'DTH_ARION', 'ARI', 1),
(30, 'DTH_ARION', 'AF-5012S', 1),
(31, 'DTH_ARION', 'ARD-2810HP', 1),
(32, 'DTH_ARION', 'AF-5210VHD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_marcaciones`
--

CREATE TABLE IF NOT EXISTS `lista_marcaciones` (
`ID` int(3) NOT NULL COMMENT 'ID Lista de Marcaciones',
  `RAZON` varchar(3) NOT NULL COMMENT 'Razón de la Marcación',
  `MARCACION` varchar(3) NOT NULL COMMENT 'Marcación',
  `DETALLE` longtext NOT NULL COMMENT 'Detalle Marcación Servicio ',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado de la Marcación'
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_marcaciones`
--

INSERT INTO `lista_marcaciones` (`ID`, `RAZON`, `MARCACION`, `DETALLE`, `ESTADO`) VALUES
(1, 'OPE', 'COV', 'Confirmación De Visita', 1),
(2, 'OPE', 'PVM', 'Programación de Mantenimiento falla mas de un servicio ', 1),
(3, 'OPE', 'REA', 'Re-Agendamiento O Cancelación De Visita   ', 1),
(4, 'OPE', 'FTV', 'Incumplimiento De Visita de mantenimiento ', 1),
(5, 'OPE', 'IPI', 'Insatisfacción Con La Instalación', 1),
(6, 'OPE', 'IPM', 'Insatisfacción Con El Mantenimiento ', 1),
(7, 'OPE', 'FII', 'Incumplimiento Fecha Instalación ', 1),
(8, 'OPE', 'DOT', 'Daños A Terceros', 1),
(9, 'OPE', 'MTT', 'Mala Atención Del Técnico ', 1),
(10, 'OPE', 'FGV', 'Fraude Generado Por Visita De Un Técnico ', 1),
(11, 'OPE', 'ATX', 'Accidentes Causados Por Telmex', 1),
(12, 'OPE', 'RDT', 'Reporte De Delitos', 1),
(13, 'SAC', 'RAE', 'Replanteamientos de acometida', 1),
(14, 'SAC', 'TRA', 'Petición de Traslado', 1),
(15, 'SAC', 'STR', 'Seguimiento Traslado', 1),
(16, 'SOP', 'CVD', 'Soporte Claro Video', 1),
(17, 'SOP', 'PCL', 'Información  portal  Mi Claro', 1),
(18, 'SOP', 'ICV', 'Cliente sin Ingreso a Claro video', 1),
(19, 'SOP', 'PCI', 'Problema con Ingreso a mi Claro Portal', 1),
(20, 'SOP', 'DIE', 'Soporte PC DIENS', 1),
(21, 'SAC', 'SED', 'Soporte Equipo DIENS', 1),
(22, 'SOP', 'CAA', 'Soporte correo archivos Adjuntos', 1),
(23, 'SOP', 'CEI', 'Información errores comunes del Correo', 1),
(24, 'SOP', 'PDD', 'Sin internet problema con dhcp y dns', 1),
(25, 'SOP', 'ITC', 'Información tamaño correo', 1),
(26, 'DIS', 'FCI', 'Fallas con servicio de correo', 1),
(27, 'SOP', 'ZWF', 'Sin conexión a zonas WIFI', 1),
(28, 'SOP', 'MCC', 'Solicitud modificar la contraseña de correo', 1),
(29, 'SOP', 'CRN', 'Cliente no puede recibir correos', 1),
(30, 'SOP', 'COR', 'Solicitud  crear cuenta de correo', 1),
(31, 'SOP', 'CCO', 'Soporte configuración correo', 1),
(32, 'SOP', 'ENC', 'Cliente no puede enviar correos', 1),
(33, 'SOP', 'AIP', 'Solicitud asignación IP fija', 1),
(34, 'DIS', 'APW', 'Problema accesos pagina WEB', 1),
(35, 'DIS', 'LNM', 'Lentitud niveles modem', 1),
(36, 'DIS', 'WWF', 'Sin  internet WIFI  - Fallas potencia inalámbrica perdida de paquetes', 1),
(37, 'SOP', 'PIC', 'Configuración de IP Fija', 1),
(38, 'SOP', 'EDA', 'Sin internet error de aprovisionamiento', 1),
(39, 'SOP', 'ICW', 'Información Confirmación Clave WIFI', 1),
(40, 'SOP', 'SSI', 'sin internet WIFI desconfigurado SSID', 1),
(41, 'DIS', 'FMM', 'Sin Internet  Fallas MTA y/o Modem', 1),
(42, 'SOP', 'CMI', 'Solicitudes  (CMI avanzadas)', 1),
(43, 'SOP', 'IDI', 'Soporte sin internet  falla dispositivos', 1),
(44, 'SOP', 'WRC', 'Internet wifi reinicio de cm', 1),
(45, 'SOP', 'WEP', 'Solicitud Personalización Clave WIFI -WPA - SSID', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_softswich`
--

CREATE TABLE IF NOT EXISTS `lista_softswich` (
`ID` int(3) NOT NULL COMMENT 'ID Softswich',
  `MARCA` varchar(100) NOT NULL COMMENT 'Marca del Softswich',
  `REFERENCIA` varchar(250) NOT NULL COMMENT 'Referencia del Softswich',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Softswich'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_softswich`
--

INSERT INTO `lista_softswich` (`ID`, `MARCA`, `REFERENCIA`, `ESTADO`) VALUES
(1, 'SAFARI', 'BOG03', 1),
(2, 'SAFARI', 'BOG05', 1),
(3, 'SAFARI', 'BOG06', 1),
(4, 'SAFARI', 'BQA01', 1),
(5, 'SAFARI', 'BUC01', 1),
(6, 'SAFARI', 'CAL01', 1),
(7, 'SAFARI', 'MED01', 1),
(8, 'SAFARI', 'PER01', 1),
(9, 'SAFARI', 'TANDEM', 1),
(10, 'IMS', 'BOG07', 1),
(11, 'HIQ', 'TRIARA', 1),
(12, 'HIQ', 'ORTEZAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_base`
--

CREATE TABLE IF NOT EXISTS `permisos_base` (
`ID` bigint(20) NOT NULL COMMENT 'ID del Tipo de Permiso',
  `LECTURA` int(1) NOT NULL DEFAULT '0' COMMENT 'Permiso de Lectura',
  `ESCRITURA` int(1) NOT NULL DEFAULT '0' COMMENT 'Permiso de Escritura',
  `ELIMINAR` int(1) NOT NULL DEFAULT '0' COMMENT 'Permiso de Eliminacion',
  `ACTUALIZAR` int(1) NOT NULL DEFAULT '0' COMMENT 'Permiso de Actualizacion'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_base`
--

INSERT INTO `permisos_base` (`ID`, `LECTURA`, `ESCRITURA`, `ELIMINAR`, `ACTUALIZAR`) VALUES
(1, 0, 0, 0, 0),
(2, 1, 0, 0, 0),
(3, 1, 1, 0, 0),
(4, 1, 1, 1, 0),
(5, 1, 1, 1, 1),
(6, 0, 0, 0, 1),
(7, 0, 0, 1, 1),
(8, 0, 1, 1, 1),
(9, 1, 0, 0, 1),
(10, 0, 1, 1, 0),
(11, 1, 0, 1, 0),
(12, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_modulos`
--

CREATE TABLE IF NOT EXISTS `permisos_modulos` (
`ID` bigint(20) NOT NULL COMMENT 'ID del Modulo',
  `NOMBRE` varchar(50) NOT NULL COMMENT 'Nombre del Modulo',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Modulo'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_modulos`
--

INSERT INTO `permisos_modulos` (`ID`, `NOMBRE`, `ESTADO`) VALUES
(1, 'Chat', 1),
(2, 'Datos_Usuario', 1),
(3, 'HFC', 1),
(4, 'Index', 1),
(5, 'Inicio', 1),
(6, 'Matriz', 1),
(7, 'Plataforma', 1),
(8, 'Usuarios', 1),
(9, 'Dropdown', 1),
(10, 'Mantenimientos', 1),
(11, 'Mejoramiento', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_nombre`
--

CREATE TABLE IF NOT EXISTS `permisos_nombre` (
`ID` bigint(20) NOT NULL COMMENT 'ID de Nombre del Permiso',
  `NOMBRE` varchar(100) NOT NULL COMMENT 'Nombre del Permiso',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Nombre del Permiso'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_nombre`
--

INSERT INTO `permisos_nombre` (`ID`, `NOMBRE`, `ESTADO`) VALUES
(1, 'EXPERTO', 1),
(2, 'SUPERVISOR', 1),
(3, 'ADMINISTRADOR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_seleccion`
--

CREATE TABLE IF NOT EXISTS `permisos_seleccion` (
`ID` bigint(20) NOT NULL COMMENT 'ID del Permiso de Seleccion',
  `NOMBRE_ID` bigint(20) NOT NULL COMMENT 'ID del Nombre del Permiso',
  `MODULOS_ID` bigint(20) NOT NULL COMMENT 'ID de Modulo',
  `BASE_ID` bigint(20) NOT NULL COMMENT 'ID de Base de Permiso'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_seleccion`
--

INSERT INTO `permisos_seleccion` (`ID`, `NOMBRE_ID`, `MODULOS_ID`, `BASE_ID`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 5),
(3, 1, 3, 5),
(4, 1, 4, 5),
(5, 1, 5, 5),
(6, 1, 6, 5),
(7, 1, 7, 5),
(8, 1, 8, 5),
(9, 1, 9, 5),
(10, 1, 10, 5),
(11, 1, 11, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`ID` bigint(20) NOT NULL COMMENT 'ID de Usuario',
  `PASSWORD` varchar(255) NOT NULL COMMENT 'Contraseña del Usuario',
  `NOMBRE` varchar(100) NOT NULL COMMENT 'Nombre del Usuario',
  `USUARIO_RR` varchar(10) DEFAULT NULL COMMENT 'Usuario RR',
  `CORREO` varchar(150) NOT NULL COMMENT 'Correo del Usuario',
  `EMPRESA` varchar(100) NOT NULL COMMENT 'Empresa del Usuario',
  `CARGO` int(2) NOT NULL COMMENT 'ID Cargo del Usuario',
  `ESTADO` int(2) NOT NULL COMMENT 'Estado del Usuario',
  `PERMISO` bigint(20) NOT NULL COMMENT 'ID del Permiso del Usuario'
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `PASSWORD`, `NOMBRE`, `USUARIO_RR`, `CORREO`, `EMPRESA`, `CARGO`, `ESTADO`, `PERMISO`) VALUES
(1, 'cb40dd606cfa58af70d3cef46feb91e38b9c78ba', 'Súper Usuario', 'Fix', 'alejo_fix@hotmail.com', 'CLARO', 5, 1, 1),
(2, 'cb40dd606cfa58af70d3cef46feb91e38b9c78ba', 'Alejandro Montenegro', 'JMONTENEGR', 'jorge.montenegro.t@claro.com.co', 'CLARO', 1, 1, 1),
(3, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jhon Silva', 'JASILVA', 'jhon.silva@claro.com.co', 'CLARO', 5, 1, 1),
(4, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Ximena Lozano Alejo', 'XIMLOZANO', 'ximena.lozano@claro.com.co', 'CLARO', 1, 1, 1),
(5, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Mauricio Vecino', 'HVECINO', 'hector.vecino@claro.com.co', 'CLARO', 2, 1, 1),
(6, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andrei Gutierrez', 'ICF9151A', 'edinson.gutierrez@claro.com.co', 'CLARO', 1, 1, 1),
(7, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Sandra Milena Vargas ', 'SMVARGAS', 'sandra.vargas.p@claro.com.co', 'CLARO', 2, 1, 1),
(8, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Adriana Marcela Jimenez Zarante', 'AJIMENJEZZ', 'adriana.jimenez@claro.com.co', 'CLARO', 2, 1, 1),
(9, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Yeison Fabian Peña Cuevas', 'YFPENAC', 'yeison.pena@claro.com.co', 'CLARO', 2, 1, 1),
(10, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andrea Martinez', 'APMARTINEZ', 'andrea.martinez@claro.com.co', 'CLARO', 2, 1, 1),
(11, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Dora Ines Roa Celis', 'DROA', 'dora.roa@claro.com.co', 'CLARO', 3, 1, 1),
(12, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jhon Hernandez', 'JHERNAN2', 'alexander.hernandez@claro.com.co', 'CLARO', 2, 1, 1),
(13, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Juan Carlos Gonzalez Moreno', 'JGONZALEZM', 'juan.gonzalez.m@claro.com.co', 'CLARO', 1, 1, 1),
(14, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Carlos Otalvaro', 'COTALVAROV', 'carlos.otalvaro@claro.com.co', 'CLARO', 3, 1, 1),
(15, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'John Esteban Guauque', 'JGUAUQUE', 'john.guauque@claro.com.co', 'CLARO', 3, 1, 1),
(16, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Cristian Castillo', 'CRISCASTIL', 'cristian.castillo@claro.com.co', 'CLARO', 1, 1, 1),
(17, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andrea Amaya', 'LAAMAYAM', 'leidy.amayam@claro.com.co', 'CLARO', 3, 1, 1),
(18, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Carlos Roberto Castro Guzmán', 'CASTROG', 'roberto.castro@claro.com.co', 'CLARO', 3, 1, 1),
(19, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jasson Oliveros', 'ICF0255A', 'jasson.oliverosr@radiola.tv', 'CLARO', 3, 1, 1),
(20, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'John Molina', 'JOHMOLINAC', 'jhon.molina@claro.com.co', 'CLARO', 5, 1, 1),
(21, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Doris Groth', 'DGROTH', 'doris.groth@claro.com.co', 'CLARO', 3, 1, 1),
(22, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Fausto Giovanni Ortiz', 'FGORTIZ', 'giovanni.ortiz@claro.com.co', 'CLARO', 3, 1, 1),
(23, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Cristian Vesga', 'CRIVESGA', 'cristian.vesga@claro.com.co', 'CLARO', 3, 1, 1),
(24, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Ivan Garcia', 'IVGARCIA', 'ivan.garcia@claro.com.co', 'CLARO', 1, 1, 1),
(25, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Juan Díaz', 'JEDIAZ1', 'juan.diaz@claro.com.co', 'CLARO', 2, 1, 1),
(26, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Cristina Botía', 'ICF5253A', 'cristina.botia@claro.com.co', 'CLARO', 3, 1, 1),
(27, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Marcela Rangel ', 'JMRANGEL', 'jenny.rangel@claro.com.co', 'CLARO', 5, 1, 1),
(28, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Sandra Jimenez', 'ENH2108B', 'sandra.jimenez@claro.com.co', 'CLARO', 3, 1, 1),
(29, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Carolina Murcia', 'RMURCIA', 'ruth.murcia@claro.com.co', 'CLARO', 3, 1, 1),
(30, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Sergio Mora', 'EKZ8135A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(31, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Fernando Sastoque', 'EKZ7026A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(32, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Eleyder Mosquera', 'EKZ8610A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(33, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Camilo Guatame', 'CAGUATAME', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(34, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jonnathan Enciso', 'ICF7922A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(35, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Juan Camilo Martin', 'ICF9143A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(36, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jennyfer Graffi', 'ICF4550A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(37, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Diana Jimena Rivera Pineda', 'EKZ6774A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(38, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jennyfer Graffi', 'ICF4550A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(39, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jheisson Prado', 'EKZ9004B', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(40, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andres Felipe Cortes', 'ICF6541A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(41, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Juan David Cardenas', 'ICF2575A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(42, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Michael Stiven Saenz Merchan', 'ICF2365A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(43, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andrianov Waldemar', 'ICF5112A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(44, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Damian Stiven Pineda Sanchez', 'EKZ2171A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(45, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Sindy Duran', 'EKZ7440A', 'cierre.tickets@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(46, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Cesar Cardenas', 'EKZ2917A', 'control.calidad@claro.net.co', 'INTERCONTACT', 4, 1, 1),
(47, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Dayana Alexandra Bravo Medina', 'ICF7198A', 'cierre.tickets@claro.net.co ', 'SENA', 4, 1, 1),
(48, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Oscar Andrés Munar Espejo', 'ICF9229A', 'oscar.munare@claro.com.co', 'CLARO', 4, 1, 1),
(49, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Meyer Sydney Triana Beltran', 'MTRIANA', 'meyer.triana@claro.com.co', 'CLARO', 3, 1, 1),
(50, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Inírida Molano ', 'IMOLANO', 'inirida.molano@claro.com.co', 'CLARO', 3, 1, 1),
(51, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Libardo Enrique Robles Florez', 'LEROBLES1', 'libardo.robles@claro.com.co', 'CLARO', 6, 1, 1),
(52, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Mayra Franco', 'MGFRANCO', 'mayra.franco@claro.com.co', 'CLARO', 3, 1, 1),
(53, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jhon Ladino', 'ICF4542A', 'jhon.ladino@claro.com.co', 'CLARO', 3, 1, 1),
(54, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Anyi Lizeth Morales Pimentel', 'ICF9058A', 'cierre.tickets@claro.net.co ', 'SENA\r\n', 4, 1, 1),
(55, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Fernando Arias', 'FERCHO', 'fernando.arias@claro.com.co', 'CLARO', 5, 1, 1),
(56, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Paola Andrea Fory', 'PAFORYR', 'paola.fory@claro.com.co', 'CLARO', 3, 1, 1),
(57, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Carol Suarez', 'CSUAREZ1', 'carol.suarez@hotmail.com', 'CLARO', 3, 1, 1),
(58, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Diana Briñez', 'DBRINEZ', 'diana.brinez@claro.com.co', 'CLARO', 3, 1, 1),
(59, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jhonatan Andrés Llori Borja', 'ICF9182A', 'jhonatan.llori@claro.com.co', 'CLARO', 3, 1, 1),
(60, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Erick Fabian Saenz', 'EKZ1164A', 'control.calidad@claro.net.co', 'INTERCONTACT', 3, 1, 1),
(61, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Luis Alexis Castillo Beltran', 'LUICASTILL', 'luis.castillo@claro.com.co', 'CLARO', 3, 1, 1),
(62, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Yener Sanjuan', 'YSANJUAN', 'yener.sanjuan@claro.com.co', 'CLARO', 6, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ccaa_mejoras`
--
ALTER TABLE `ccaa_mejoras`
 ADD PRIMARY KEY (`ID`,`PRODUCTOS_ID`,`ESTADO`), ADD KEY `fk_CCAA_MEJORAS_ESTADOS1_idx` (`ESTADO`), ADD KEY `fk_CCAA_MEJORAS_CCAA_PRODUCTOS1_idx` (`PRODUCTOS_ID`);

--
-- Indices de la tabla `ccaa_productos`
--
ALTER TABLE `ccaa_productos`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `chat_mensaje`
--
ALTER TABLE `chat_mensaje`
 ADD PRIMARY KEY (`ID`,`ID_USUARIO`,`TIPO`), ADD KEY `fk_chat_mensaje_usuarios1_idx` (`ID_USUARIO`), ADD KEY `fk_chat_mensaje_chat_tipo1_idx` (`TIPO`), ADD KEY `fk_chat_mensaje_chat_salas1_idx` (`ID_SALA`), ADD KEY `fk_chat_mensaje_usuarios2_idx` (`DE`), ADD KEY `fk_chat_mensaje_usuarios3_idx` (`PARA`);

--
-- Indices de la tabla `chat_perfil`
--
ALTER TABLE `chat_perfil`
 ADD PRIMARY KEY (`ID`,`ESTADO`,`PERMISO_NOMBRE`), ADD KEY `fk_chat_perfil_estados1_idx` (`ESTADO`), ADD KEY `fk_chat_perfil_permisos_nombre1_idx` (`PERMISO_NOMBRE`);

--
-- Indices de la tabla `chat_salas`
--
ALTER TABLE `chat_salas`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_chat_salas_estados1_idx` (`ESTADO`);

--
-- Indices de la tabla `chat_salas_has_chat_perfil`
--
ALTER TABLE `chat_salas_has_chat_perfil`
 ADD PRIMARY KEY (`chat_salas_ID`,`chat_perfil_ID`), ADD KEY `fk_chat_salas_has_chat_perfil_chat_perfil1_idx` (`chat_perfil_ID`), ADD KEY `fk_chat_salas_has_chat_perfil_chat_salas1_idx` (`chat_salas_ID`);

--
-- Indices de la tabla `chat_tipo`
--
ALTER TABLE `chat_tipo`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `lista_cablemodem`
--
ALTER TABLE `lista_cablemodem`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_lista_cablemodem_estados1_idx` (`ESTADO`);

--
-- Indices de la tabla `lista_cargo`
--
ALTER TABLE `lista_cargo`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `lista_decodificadores`
--
ALTER TABLE `lista_decodificadores`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_lista_decodificadores_estados1_idx` (`ESTADO`);

--
-- Indices de la tabla `lista_marcaciones`
--
ALTER TABLE `lista_marcaciones`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_lista_marcaciones_estados1_idx` (`ESTADO`);

--
-- Indices de la tabla `lista_softswich`
--
ALTER TABLE `lista_softswich`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_lista_decodificadores_estados1_idx` (`ESTADO`);

--
-- Indices de la tabla `permisos_base`
--
ALTER TABLE `permisos_base`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `permisos_modulos`
--
ALTER TABLE `permisos_modulos`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_PERMISOS_MODULOS_ESTADOS1_idx` (`ESTADO`);

--
-- Indices de la tabla `permisos_nombre`
--
ALTER TABLE `permisos_nombre`
 ADD PRIMARY KEY (`ID`,`ESTADO`), ADD KEY `fk_PERMISOS_NOMBRE_ESTADOS1_idx` (`ESTADO`);

--
-- Indices de la tabla `permisos_seleccion`
--
ALTER TABLE `permisos_seleccion`
 ADD PRIMARY KEY (`ID`,`NOMBRE_ID`,`MODULOS_ID`,`BASE_ID`), ADD KEY `fk_PERMISOS_SELECCION_PERMISOS_NOMBRE1_idx` (`NOMBRE_ID`), ADD KEY `fk_PERMISOS_SELECCION_PERMISOS_MODULOS1_idx` (`MODULOS_ID`), ADD KEY `fk_PERMISOS_SELECCION_PERMISOS_BASE1_idx` (`BASE_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`ID`,`CARGO`,`ESTADO`,`PERMISO`), ADD KEY `fk_USUARIOS_ESTADOS_idx` (`ESTADO`), ADD KEY `fk_USUARIOS_PERMISOS_NOMBRE1_idx` (`PERMISO`), ADD KEY `fk_usuarios_lista_cargo1_idx` (`CARGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ccaa_mejoras`
--
ALTER TABLE `ccaa_mejoras`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID de la Mejora';
--
-- AUTO_INCREMENT de la tabla `ccaa_productos`
--
ALTER TABLE `ccaa_productos`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del Producto';
--
-- AUTO_INCREMENT de la tabla `chat_mensaje`
--
ALTER TABLE `chat_mensaje`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `chat_perfil`
--
ALTER TABLE `chat_perfil`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID de  Perfil de Chat',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `chat_salas`
--
ALTER TABLE `chat_salas`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `chat_tipo`
--
ALTER TABLE `chat_tipo`
MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'ID del Tipo de Chat',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'ID del Estado',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `lista_cablemodem`
--
ALTER TABLE `lista_cablemodem`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID de Cablemodem',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `lista_decodificadores`
--
ALTER TABLE `lista_decodificadores`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Decodificador',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `lista_marcaciones`
--
ALTER TABLE `lista_marcaciones`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Lista de Marcaciones',AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `lista_softswich`
--
ALTER TABLE `lista_softswich`
MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Softswich',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `permisos_base`
--
ALTER TABLE `permisos_base`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del Tipo de Permiso',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `permisos_modulos`
--
ALTER TABLE `permisos_modulos`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del Modulo',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `permisos_nombre`
--
ALTER TABLE `permisos_nombre`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID de Nombre del Permiso',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `permisos_seleccion`
--
ALTER TABLE `permisos_seleccion`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del Permiso de Seleccion',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID de Usuario',AUTO_INCREMENT=63;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ccaa_mejoras`
--
ALTER TABLE `ccaa_mejoras`
ADD CONSTRAINT `fk_CCAA_MEJORAS_CCAA_PRODUCTOS1` FOREIGN KEY (`PRODUCTOS_ID`) REFERENCES `ccaa_productos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_CCAA_MEJORAS_ESTADOS1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `chat_mensaje`
--
ALTER TABLE `chat_mensaje`
ADD CONSTRAINT `fk_chat_mensaje_chat_salas1` FOREIGN KEY (`ID_SALA`) REFERENCES `chat_salas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_mensaje_chat_tipo1` FOREIGN KEY (`TIPO`) REFERENCES `chat_tipo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_mensaje_usuarios1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_mensaje_usuarios2` FOREIGN KEY (`DE`) REFERENCES `usuarios` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_mensaje_usuarios3` FOREIGN KEY (`PARA`) REFERENCES `usuarios` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `chat_perfil`
--
ALTER TABLE `chat_perfil`
ADD CONSTRAINT `fk_chat_perfil_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_perfil_permisos_nombre1` FOREIGN KEY (`PERMISO_NOMBRE`) REFERENCES `permisos_nombre` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `chat_salas`
--
ALTER TABLE `chat_salas`
ADD CONSTRAINT `fk_chat_salas_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `chat_salas_has_chat_perfil`
--
ALTER TABLE `chat_salas_has_chat_perfil`
ADD CONSTRAINT `fk_chat_salas_has_chat_perfil_chat_perfil1` FOREIGN KEY (`chat_perfil_ID`) REFERENCES `chat_perfil` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_chat_salas_has_chat_perfil_chat_salas1` FOREIGN KEY (`chat_salas_ID`) REFERENCES `chat_salas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lista_cablemodem`
--
ALTER TABLE `lista_cablemodem`
ADD CONSTRAINT `fk_lista_cablemodem_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lista_decodificadores`
--
ALTER TABLE `lista_decodificadores`
ADD CONSTRAINT `fk_lista_decodificadores_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lista_marcaciones`
--
ALTER TABLE `lista_marcaciones`
ADD CONSTRAINT `fk_lista_marcaciones_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lista_softswich`
--
ALTER TABLE `lista_softswich`
ADD CONSTRAINT `fk_lista_softswich_estados1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos_modulos`
--
ALTER TABLE `permisos_modulos`
ADD CONSTRAINT `fk_PERMISOS_MODULOS_ESTADOS1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos_nombre`
--
ALTER TABLE `permisos_nombre`
ADD CONSTRAINT `fk_PERMISOS_NOMBRE_ESTADOS1` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos_seleccion`
--
ALTER TABLE `permisos_seleccion`
ADD CONSTRAINT `fk_PERMISOS_SELECCION_PERMISOS_BASE1` FOREIGN KEY (`BASE_ID`) REFERENCES `permisos_base` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_PERMISOS_SELECCION_PERMISOS_MODULOS1` FOREIGN KEY (`MODULOS_ID`) REFERENCES `permisos_modulos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_PERMISOS_SELECCION_PERMISOS_NOMBRE1` FOREIGN KEY (`NOMBRE_ID`) REFERENCES `permisos_nombre` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
ADD CONSTRAINT `fk_USUARIOS_ESTADOS` FOREIGN KEY (`ESTADO`) REFERENCES `estados` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_USUARIOS_PERMISOS_NOMBRE1` FOREIGN KEY (`PERMISO`) REFERENCES `permisos_nombre` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_usuarios_lista_cargo1` FOREIGN KEY (`CARGO`) REFERENCES `lista_cargo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
