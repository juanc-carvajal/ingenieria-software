-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2025 a las 03:43:33
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
  `nombre` varchar(50) NOT NULL,
  `serial` varchar(20) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ubicacion` int(20) NOT NULL,
  `responsable` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos_medicos`
--

INSERT INTO `equipos_medicos` (`id`, `codigo`, `nombre`, `serial`, `marca`, `modelo`, `ubicacion`, `responsable`) VALUES
(64, 'EQ-001', 'Monitor de Signos Vitales', 'SN-MV-2023-001', 'Philips', 'IntelliVue MX40', 1, 1),
(65, 'EQ-002', 'Electrocardiografo', 'SN-ECG-2023-002', 'GE Healthcare', 'MAC 2000', 2, 1),
(66, 'EQ-003', 'Desfibrilador', 'SN-DEF-2023-003', 'ZOLL', 'R Series', 3, 2),
(67, 'EQ-004', 'Ventilador Mecánico', 'SN-VM-2023-004', 'Dräger', 'Evita V300', 1, 1),
(68, 'EQ-005', 'Bomba de Infusión', 'SN-BI-2023-005', 'B.Braun', 'Perfusor Space', 2, 2),
(69, 'EQ-006', 'Oxímetro de Pulso', 'SN-OXI-2023-006', 'Masimo', 'Radical-7', 1, 1),
(70, 'EQ-007', 'Cama Hospitalaria Eléctrica', 'SN-CH-2023-007', 'Hill-Rom', 'Advanta 2', 4, 3),
(71, 'EQ-008', 'Lámpara Quirúrgica', 'SN-LQ-2023-008', 'Trumpf', 'iLED 5', 3, 2),
(72, 'EQ-009', 'Mesa Quirúrgica', 'SN-MQ-2023-009', 'Steris', 'AMSCO 3085', 3, 2),
(73, 'EQ-010', 'Ultrasonido Doppler', 'SN-USD-2023-010', 'GE Healthcare', 'Voluson E10', 5, 1),
(74, 'EQ-011', 'Equipo de Rayos X Portátil', 'SN-RXP-2023-011', 'Siemens', 'Mobilett XP', 2, 1),
(75, 'EQ-012', 'Incubadora Neonatal', 'SN-INC-2023-012', 'Dräger', 'Isolette C2000', 4, 3),
(76, 'EQ-013', 'Nebulizador', 'SN-NEB-2023-013', 'Omron', 'NE-C801', 2, 2),
(77, 'EQ-014', 'Aspirador Quirúrgico', 'SN-ASQ-2023-014', 'Medela', 'Dominant 50', 3, 2),
(78, 'EQ-015', 'Esterilizador Autoclave', 'SN-EST-2023-015', 'Tuttnauer', '3870ELV', 3, 2),
(79, 'EQ-016', 'Tensiómetro Digital', 'SN-TEN-2023-016', 'Omron', 'HEM-7120', 1, 1),
(80, 'EQ-017', 'Glucómetro', 'SN-GLU-2023-017', 'Accu-Chek', 'Guide', 2, 1),
(81, 'EQ-018', 'Termómetro Infrarrojo', 'SN-TER-2023-018', 'Braun', 'ThermoScan 7', 1, 1),
(82, 'EQ-019', 'Centrífuga de Laboratorio', 'SN-CEN-2023-019', 'Hettich', 'EBA 200', 5, 1),
(83, 'EQ-020', 'Microscopio Binocular', 'SN-MIC-2023-020', 'Olympus', 'CX23', 5, 1),
(84, 'EQ-021', 'Analizador de Química Sanguínea', 'SN-AQS-2023-021', 'Abbott', 'Architect c4000', 18, 1),
(85, 'EQ-022', 'Baño María', 'SN-BM-2023-022', 'Memmert', 'WNB 7', 5, 1),
(86, 'EQ-023', 'Refrigerador Médico', 'SN-REF-2023-023', 'Thermo Scientific', 'TSX Series', 5, 3),
(87, 'EQ-024', 'Lámpara de Fototerapia', 'SN-LFT-2023-024', 'Dräger', 'BiliLux', 4, 3),
(88, 'EQ-025', 'Monitor Fetal', 'SN-MF-2023-025', 'Philips', 'Avalon FM30', 4, 3),
(89, 'EQ-026', 'Silla de Ruedas Manual', 'SN-SRM-2023-026', 'Invacare', 'Tracer EX2', 1, 3),
(90, 'EQ-027', 'Camilla de Transporte', 'SN-CT-2023-027', 'Stryker', 'Big Wheel', 1, 3),
(91, 'EQ-028', 'Electrocauterio', 'SN-ELC-2023-028', 'Valleylab', 'Force FX', 3, 2),
(92, 'EQ-029', 'Laringoscopio', 'SN-LAR-2023-029', 'Welch Allyn', 'Green System 69000', 3, 2),
(93, 'EQ-030', 'Otoscopio', 'SN-OTO-2023-030', 'Riester', 'ri-scope L2', 2, 1),
(94, 'EQ-031', 'Oftalmoscopio', 'SN-OFT-2023-031', 'Heine', 'BETA 200', 2, 1),
(95, 'EQ-032', 'Estetoscopio Electrónico', 'SN-EST-2023-032', 'Littmann', '3200', 2, 1),
(96, 'EQ-033', 'Nebulizador Ultrasónico', 'SN-NEU-2023-033', 'Beurer', 'IH 50', 2, 2),
(97, 'EQ-034', 'Carro de Paro', 'SN-CP-2023-034', 'Metro', 'Lifeline', 3, 2),
(98, 'EQ-035', 'Concentrador de Oxígeno', 'SN-CO-2023-035', 'Philips', 'EverFlo', 1, 1),
(99, 'EQ-036', 'CPAP', 'SN-CPAP-2023-036', 'ResMed', 'AirSense 10', 1, 1),
(100, 'EQ-037', 'Colchón Antiescaras', 'SN-CAE-2023-037', 'Invacare', 'microAIR MA55', 4, 3),
(101, 'EQ-038', 'Grúa para Pacientes', 'SN-GP-2023-038', 'Arjo', 'Maxi Sky 2', 4, 3),
(102, 'EQ-039', 'Balanza Digital', 'SN-BAL-2023-039', 'Seca', '354', 2, 1),
(103, 'EQ-040', 'Tallímetro', 'SN-TAL-2023-040', 'Seca', '216', 2, 1),
(104, 'EQ-041', 'Equipo de Óxido Nitroso', 'SN-EON-2023-041', 'Porter', 'Matrix', 3, 2),
(105, 'EQ-042', 'Monitor Multiparamétrico', 'SN-MMP-2023-042', 'Mindray', 'BeneView T5', 1, 1),
(106, 'EQ-043', 'Doppler Vascular', 'SN-DV-2023-043', 'Newman Medical', 'ePad', 5, 1),
(107, 'EQ-044', 'Dermatoscopio', 'SN-DER-2023-044', 'Heine', 'DELTA 20 T', 2, 1),
(108, 'EQ-045', 'Fonendoscopio Doppler', 'SN-FD-2023-045', 'Sonotrax', 'Basic', 2, 1),
(109, 'EQ-046', 'Equipo de Diálisis', 'SN-DIA-2023-046', 'Fresenius', '5008S', 1, 1),
(110, 'EQ-047', 'Holter de Presión', 'SN-HP-2023-047', 'Spacelabs', '90217A', 2, 1),
(111, 'EQ-048', 'Espirometro', 'SN-ESP-2023-048', 'Vyaire', 'Vyntus SPIRO', 2, 2),
(112, 'EQ-049', 'Pulsioximetro de Mesa', 'SN-POM-2023-049', 'Nonin', 'Onyx Vantage 9590', 1, 1),
(113, 'EQ-050', 'Capnógrafo', 'SN-CAP-2023-050', 'Medtronic', 'Microstream', 3, 2);

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
(1, 'RESP-01', 1011234567, 'Laura Lucía', 'Castro Carmona', 'Enfermera Jefe', '3101234567'),
(2, 'RESP-02', 1012234568, 'Andrés', 'Moreno', 'Médico Intensivista', '3102234568'),
(3, 'RESP-03', 1013234569, 'Sofía', 'Rojas', 'Ingeniera Biomédica', '3103234569'),
(4, 'RESP-04', 1014234570, 'Diego', 'Hernández', 'Técnico Biomédico', '3104234570'),
(5, 'RESP-05', 1015234571, 'Camila', 'Suárez', 'Jefa de Mantenimiento', '3105234571'),
(7, 'R001', 1003004001, 'Carlos', 'García', 'Médico', '3101111111'),
(8, 'R002', 1003004002, 'Ana', 'Martínez', 'Enfermera', '3101111112'),
(9, 'R003', 1003004003, 'Jorge', 'López', 'Técnico Biomédico', '3101111113'),
(10, 'R004', 1003004004, 'María', 'Hernández', 'Médico', '3101111114'),
(11, 'R005', 1003004005, 'Andrés', 'Ramírez', 'Enfermero', '3101111115'),
(12, 'R006', 1003004006, 'Lucía', 'Pérez', 'Técnico Biomédico', '3101111116'),
(13, 'R007', 1003004007, 'Sofía', 'Moreno', 'Médico', '3101111117'),
(14, 'R008', 1003004008, 'Felipe', 'Torres', 'Enfermero', '3101111118'),
(15, 'R009', 1003004009, 'Paula', 'Castro', 'Enfermera', '3101111119'),
(16, 'R010', 1003004010, 'Mateo', 'Rojas', 'Médico', '3101111120'),
(17, 'R011', 1003004011, 'Camila', 'Jiménez', 'Enfermera', '3101111121'),
(18, 'R012', 1003004012, 'David', 'Cruz', 'Técnico Biomédico', '3101111122'),
(19, 'R013', 1003004013, 'Laura', 'Gómez', 'Médico', '3101111123'),
(20, 'R014', 1003004014, 'Valentina', 'Suárez', 'Enfermera', '3101111124'),
(22, 'R016', 1003004016, 'Manuel', 'Ortega', 'Enfermero', '3101111126'),
(23, 'R017', 1003004017, 'Carolina', 'Córdoba', 'Médico', '3101111127'),
(24, 'R018', 1003004018, 'Esteban', 'Muñoz', 'Técnico Biomédico', '3101111128'),
(25, 'R019', 1003004019, 'Natalia', 'Reyes', 'Enfermera', '3101111129'),
(26, 'R020', 1003004020, 'Simón', 'Díaz', 'Médico', '3101111130');

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
(10, 'UB001', 'Sala de Urgencias', 'Piso 1 - Ala Norte', '3001234567'),
(11, 'UB002', 'Quirófano 1', 'Piso 2 - Sector A', '3001234568'),
(12, 'UB003', 'Quirófano 2', 'Piso 2 - Sector B', '3001234569'),
(13, 'UB004', 'UCI Adultos', 'Piso 3 - Ala Este', '3001234570'),
(14, 'UB005', 'UCI Neonatal', 'Piso 3 - Ala Oeste', '3001234571'),
(15, 'UB006', 'Hospitalización A', 'Piso 4 - Sector A', '3001234572'),
(16, 'UB007', 'Hospitalización B', 'Piso 4 - Sector B', '3001234573'),
(17, 'UB008', 'Imagenología', 'Piso 1 - Ala Sur', '3001234574'),
(18, 'UB009', 'Laboratorio Clínico', 'Piso 1 - Ala Este', '3001234575'),
(19, 'UB010', 'Farmacia', 'Piso 1 - Ala Central', '3001234576');

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
