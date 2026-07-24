-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2025 a las 01:47:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_medicos`
--

CREATE TABLE `equipos_medicos` (
  `id` int(5) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ubicacion` int(20) NOT NULL,
  `responsable` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos_medicos`
--

INSERT INTO `equipos_medicos` (`id`, `codigo`, `marca`, `modelo`, `ubicacion`, `responsable`) VALUES
(1, 'EQ-001', 'Philips', 'HeartStart XL', 10, 112),
(2, 'EQ-002', 'GE', 'B105', 11, 113),
(3, 'EQ-003', 'Siemens', 'Somatom Go', 9, 115),
(4, 'EQ-004', 'Mindray', 'BeneVision N22', 5, 150),
(5, 'EQ-005', 'Medtronic', 'Puritan Bennett 840', 10, 58);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(2) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `documento`, `nombre`, `apellido`) VALUES
(1, '1012164555', 'Juanito', 'Jimenez'),
(2, '4678154630', 'Maria Mercedez', 'Mesa Mejia'),
(5, '52164', 'Armando ', 'Mesa'),
(6, '546481', 'Sofia', 'Sarosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `id` int(5) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `documento` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`id`, `codigo`, `documento`, `nombre`, `apellido`, `cargo`, `telefono`) VALUES
(1, 'RESP-01', 1011234567, 'Laura', 'Castro', 'Enfermera Jefe', '3101234567'),
(2, 'RESP-02', 1012234568, 'Andrés', 'Moreno', 'Médico Intensivista', '3102234568'),
(3, 'RESP-03', 1013234569, 'Sofía', 'Rojas', 'Ingeniera Biomédica', '3103234569'),
(4, 'RESP-04', 1014234570, 'Diego', 'Hernández', 'Técnico Biomédico', '3104234570'),
(5, 'RESP-05', 1015234571, 'Camila', 'Suárez', 'Jefa de Mantenimiento', '3105234571');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(5) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `codigo`, `nombre`, `ubicacion`, `telefono`) VALUES
(1, 'UC-01', 'Urgencias Adultos', 'Piso 1 - Bloque A', '6041234567'),
(2, 'UC-02', 'Urgencias Pediátricas', 'Piso 1 - Bloque B', '6042234567'),
(3, 'UC-03', 'Unidad de Cuidados Intensivos', 'Piso 2 - Bloque A', '6043234567'),
(4, 'UC-04', 'Hospitalización General', 'Piso 3 - Bloque C', '6044234567'),
(5, 'UC-05', 'Quirófanos', 'Piso 2 - Bloque D', '6045234567');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos_medicos`
--
ALTER TABLE `equipos_medicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos_medicos`
--
ALTER TABLE `equipos_medicos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
