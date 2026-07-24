-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2025 a las 18:36:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `EquiposDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_equipoinfo`
--

CREATE TABLE `api_equipoinfo` (
  `id` bigint(20) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `sede` varchar(100) NOT NULL,
  `nombre_equipo` varchar(150) NOT NULL,
  `codigo_inventario` varchar(50) NOT NULL,
  `codigo_ips` varchar(50) NOT NULL,
  `codigo_ecri` varchar(50) NOT NULL,
  `responsable_proceso` varchar(150) NOT NULL,
  `ubicacion_fisica` varchar(150) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `serie` varchar(100) NOT NULL,
  `clasificacion_eje_misional` varchar(150) NOT NULL,
  `clasificacion_ips` varchar(50) NOT NULL,
  `clasificacion_riesgo` varchar(50) NOT NULL,
  `registro_invima` varchar(150) NOT NULL,
  `tiempo_vida_util` varchar(50) NOT NULL,
  `fecha_adquisicion` varchar(20) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `fecha_fabricacion` varchar(20) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `proveedor_equipo` varchar(150) NOT NULL,
  `garantia` varchar(10) NOT NULL,
  `fecha_fin_garantia` varchar(20) NOT NULL,
  `forma_adquisicion` varchar(50) NOT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `hoja_vida` varchar(10) NOT NULL,
  `registro_importacion` varchar(10) NOT NULL,
  `manual_operacion` varchar(10) NOT NULL,
  `manual_servicio` varchar(200) NOT NULL,
  `guia_rapida_uso` varchar(10) NOT NULL,
  `instructivo_manejo_rapido` varchar(10) NOT NULL,
  `protocolo_mantenimiento_preventivo` varchar(10) NOT NULL,
  `frecuencia_metrologica_fabricante` varchar(100) NOT NULL,
  `mantenimiento` varchar(10) NOT NULL,
  `frecuencia_mantenimiento` varchar(10) NOT NULL,
  `calibracion` varchar(10) NOT NULL,
  `frecuencia_calibracion` varchar(50) NOT NULL,
  `magnitud` varchar(100) NOT NULL,
  `rango_equipo` varchar(150) NOT NULL,
  `resolucion` varchar(100) NOT NULL,
  `rango_trabajo` varchar(150) NOT NULL,
  `error_max_permitido` varchar(100) NOT NULL,
  `voltaje` varchar(50) NOT NULL,
  `corriente` varchar(50) NOT NULL,
  `humedad_relativa` varchar(50) NOT NULL,
  `temperatura_maxima` varchar(50) NOT NULL,
  `dimensiones` varchar(150) NOT NULL,
  `peso` varchar(50) NOT NULL,
  `otros` varchar(150) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `motivo_baja` varchar(300) NOT NULL,
  `fecha_baja` varchar(20) NOT NULL,
  `justificacion_traslado` varchar(300) NOT NULL,
  `justificacion_baja` varchar(300) NOT NULL,
  `valor_compra` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `api_equipoinfo`
--

INSERT INTO `api_equipoinfo` (`id`, `servicio`, `sede`, `nombre_equipo`, `codigo_inventario`, `codigo_ips`, `codigo_ecri`, `responsable_proceso`, `ubicacion_fisica`, `marca`, `modelo`, `serie`, `clasificacion_eje_misional`, `clasificacion_ips`, `clasificacion_riesgo`, `registro_invima`, `tiempo_vida_util`, `fecha_adquisicion`, `propietario`, `fecha_fabricacion`, `nit`, `proveedor_equipo`, `garantia`, `fecha_fin_garantia`, `forma_adquisicion`, `tipo_documento`, `numero_documento`, `hoja_vida`, `registro_importacion`, `manual_operacion`, `manual_servicio`, `guia_rapida_uso`, `instructivo_manejo_rapido`, `protocolo_mantenimiento_preventivo`, `frecuencia_metrologica_fabricante`, `mantenimiento`, `frecuencia_mantenimiento`, `calibracion`, `frecuencia_calibracion`, `magnitud`, `rango_equipo`, `resolucion`, `rango_trabajo`, `error_max_permitido`, `voltaje`, `corriente`, `humedad_relativa`, `temperatura_maxima`, `dimensiones`, `peso`, `otros`, `estado`, `motivo_baja`, `fecha_baja`, `justificacion_traslado`, `justificacion_baja`, `valor_compra`) VALUES
(1, 'LIME', 'Prado', 'Congelador', '135306', 'Pendiente', '15 - 583', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion C', 'Challenger', 'CV420', '9053127', 'Extensión', 'IND', 'NI', 'NI', 'NI', '10/12/2009', 'UdeA', 'NI', '890.934.939-8', 'Almacén Navarro Ospina S.A.', 'NI', 'NI', 'Compra', 'Factura', '47736', 'SI', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1 (Calificación)', 'Temperatura', 'T -18', 'NI', '0 a - 33 ° C', 'NI', '115 VAC', 'NI', 'NI', 'Max 38°C', '53,5 x 53 x 142 cm', '55,5 kg', 'NI', 'baja', 'Daño', '2025-12-04', 'NI', 'Ruptura tubos de gas', 'NI'),
(2, 'LIME', 'Prado', 'Agregometro', '119325', 'BIO-12183', 'NT', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion A', 'Helena Laboratories', 'AGGRAM', '630604801', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2019DM-0019614', 'NI', '30/03/2006', 'UdeA', 'NI', '830.064.712-1', 'Helena Laboratories INC. (exportador)                  Labtronics S.A.S    ', 'NI', 'NI', 'Compra', 'Factura', '96442', 'SI', 'SI', 'SI (ing)', 'Carta de proveedor de no entrega de manual', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'Absorbancia', '0 - 2 DE ', 'NI', '0 - 2 DE ', 'NI', '110 VAC', 'NI', 'NI', '15 - 30 °C', '15,24 cm x 25,40 cm x 43,18 cm (alto x ancho x profundidad)', '6,75 Kg', 'Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(3, 'LIME', 'Prado', 'Centrífuga refrigerada', '130937', 'BIO-12186', '10 - 780', 'Gloria Zapata / Gloria Zapata', 'Área centrífugas', 'BOECO - HETTICH', 'U-320R', '0000189', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2014DM-0011507', 'NI', '02/12/2008', 'UdeA', '01/01/1970', '811.033.098-5', 'Importecnical Ltda.', 'NI', 'NI', 'Compra', 'Factura', '006093', 'SI', 'NI', 'NI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '2', 'Si', '2', 'vacio', 'Max. 15000 rpm (según folleto)               Max. 5000 rpm (evidencia)                             T -20 a 40°C', '10 rpm                    1°C                                                                       ', '1000 - 4500 rpm', 'NI', '200 - 240 V', '4 A', 'NI', 'NI', '346 x 401 x 695 mm', '53 kg', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(4, 'LIME', 'Prado', 'Analizador de coagulación automatizado - Equipo de Hemostasia', 'LIME 378', 'BIO-16281', '15 - 098', 'Gloria Zapata / Andres Zuluaga', 'Procesamiento Seccion A', 'SYSMEX', 'CS2500', '25407', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2016DM-0015107', 'NI', '28/06/2021 (Facturad', 'UT LIME', 'NI', '900.931.305-0', 'SIEMENS', 'NI', '15/07/2022', 'Compra', 'Factura', 'TE57569', 'SI', 'SI', 'SI', 'SI (CAP)', 'SI', 'SI', 'SI', 'Semestral', 'Si', '2', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100 - 240 VAC', 'NI', '30 - 85 %HR', '15 - 30 °C', 'Unidad principal                           775 x 895 x 685 mm                        Unidad neumática                             280 x 355 x 400 mm', 'Unidad principal                           110 kg ', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(5, 'LIME', 'Prado', 'Micropipeta ', '160517', 'BIO-12193', '15 - 166', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion A', 'Thermo Scientific', 'Finnpipette F1', 'MH12168', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 Septiembre 17 de 2014', 'NI', '19/01/2016', 'UdeA', 'NI', '900.355.024-5', 'Equipos y Laboratorio', 'NI', 'NI', 'Compra', 'Factura', 'C7206', 'SI', 'NI', 'SI', 'SI (CAP)', 'SI', 'NI', 'SI', 'Trimestral', 'Si', '1', 'Si', '1', 'Volumen', '100 - 1000 uL', '1 uL', '100 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(6, 'LIME', 'Prado', 'Micropipeta ', '160516', 'BIO-12194', '15 - 166', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion A', 'Thermo Scientific', 'Finnpipette F1', 'MH12173', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 Septiembre 17 de 2014', 'NI', '19/01/2016', 'UdeA', 'NI', '900.355.024-5', 'Equipos y Laboratorio', 'NI', 'NI', 'Compra', 'Factura', 'C7206', 'SI', 'NI', 'SI', 'SI (CAP)', 'SI', 'NI', 'SI', 'Trimestral', 'Si', '1', 'Si', '1', 'Volumen', '100 - 1000 uL', '1 uL', '100 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(7, 'LIME', 'Prado', 'Micropipeta ', '160515', 'BIO-12198', '15 - 166', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion A', 'Thermo Scientific', 'Finnpipette F1', 'MH12148', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 Septiembre 17 de 2014', 'NI', '19/01/2016', 'UdeA', 'NI', '900.355.024-5', 'Equipos y Laboratorio', 'NI', 'NI', 'Compra', 'Factura', 'C7206', 'SI', 'NI', 'SI', 'SI (CAP)', 'SI', 'NI', 'SI', 'Trimestral', 'Si', '1', 'Si', '1', 'Volumen', '20 - 200 uL', '0,2 uL', '20 - 200 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(8, 'LIME', 'Prado', 'Agitador Vórtex', '150955', 'BIO-12129', '15 - 651', 'Gloria Zapata / Vanessa Santiago (Patologa)', 'Procesamiento Seccion A', 'Boeco', 'Vortex V1 Plus', '1020313061616', 'Extensión', 'BIO', 'NI', 'ACTA No. 07 Junio 10 de 2009 indica que no requiere registro sanitario, y se rectifica en ACTA No. 03 Abril 10 de 2013 ', 'NI', '03/02/2014', 'UdeA', 'NI', '890.912.308-6', 'Laboratorios Ltda.', 'NI', 'NI', 'Compra', 'Factura', 'CR 00080017', 'SI', 'NI', 'SI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'Velocidad', '750 - 3000 rpm', 'Perilla sin indicación', '750 - 3000 rpm', 'NI', '100 - 240 VAC', 'NI', '80% max. con T hasta 31°C     50% con T hasta 40°C', '4 - 40 °C', '90 x 150 x 80 mm', '0,8 kg', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(9, 'LIME', 'Prado', 'Baño María', '150712', 'BIO-12130', '16 - 861', 'Gloria Zapata / Vanessa Santiago (Patologa)', 'Procesamiento Seccion B', 'Indulab', '09-A', '13834', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009 indica que no requiere registro sanitario, y se rectifica en ACTA No. 03 Abril 10 de 2013 ', 'NI', '24/01/2014', 'UdeA', 'NI', '811.013.926-3', 'Indulab S.A.', 'NI', 'NI', 'Compra', 'Factura', '6142', 'SI', 'SI (Regist', 'SI', 'SI', 'SI', 'SI', 'NI', 'Semestral', 'Si', '2', 'Si', '2', 'Temperatura', '37 - 90°C', '0,1 °C', '37 - 90 °C', 'Rango error +/- 1°C', '110 VAC', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(10, 'LIME', 'Prado', 'Centrífuga', '151362', 'BIO-12131', '10 - 778', 'Gloria Zapata / Vanessa Santiago (Patologa)', 'Área centrífugas', 'Hettich', 'Rotofix 32A', '006965-04', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2013DM-0010231', 'NI', '18/03/2014', 'UdeA', 'NI', '890.912.308-6', 'Laboratorios Ltda.', 'NI', 'NI', 'Compra', 'Factura', 'CR 00081028', 'SI', 'SI', 'SI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Velocidad', '500rpm - maximo hasta 6000 rpm (depende del rotor)\r\n1 - 99 minutos', '100 rpm\r\n1 min', 'NI', 'NI', '100 - 127 V', '3 A', '80% max. con T hasta 31°C     50% con T hasta 40°C', '2 - 40 °C', '366 x 430 x 257 mm', '23 kg', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(11, 'LIME', 'Prado', 'Microcentrifuga refrigerada', 'LIME 360', 'BIO-16289', '17 - 452', 'Estefania Vasco', 'Área centrífugas', 'HERMLE', 'Z 216 MK', '61165050', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2015DM-0013425', 'NI', '31/03/2020', 'UT LIME', '01/01/1970', '811.026.956-0', 'MR y Cia S.A.S', 'NI', '01/03/2021', 'Compra', 'Factura', 'MRE 10890', 'SI', 'NI', 'SI (ING)', 'NI', 'NI', 'NI', 'NI', 'Semestral', 'Si', '2', 'Si', '2', 'Velocidad/ Tiempo / Temperatura', 'Velocidad: 200 - 15000 rpm (la velocidad maxima varia dependindo del rotor 13500, 14500 o 15000)\r\nTiempo: 10 seg hasta 99 horas 59 min.\r\nTemperatura: ', 'Temperatura : 1°C', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', '29155000'),
(12, 'LIME', 'Prado', 'Congelador', 'LIME 642', 'Pendiente', '15 - 583', 'Duvan Gallego', 'Hospital Alma Mater de antioquia, sede ambulatoria Prado, Bloque B, segundo piso, Almacen', 'Infrico', 'LTF40SD', '3000957831', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2023DM-0026731', 'NI', 'Entrega 13/12/2024 \r', 'UT LIME', 'NI', '800.154.351-3', 'BLAMIS DOTACIONES LABORATORIO S.A.S', 'Si', '11/12/2025', 'Compra', 'Factura', 'E 160790', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '2', 'Si', '2 (Calificación)', 'Temperatura', '2 - 8 °C', '1 °C', '2 - 8 °C', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', '18203002'),
(13, 'LIME', 'Prado', 'Fonendoscopio', 'LIME 121', 'BIO-16800', '13 - 750', 'Medicos / Andres Zuluaga', 'Recepcion', 'GMD', 'GMD30-DCK', 'IMP-1163', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2015DM-0014070', 'NI', '18/01/2023', 'UT LIME', 'NI', '717890804', 'MILTON VLADIMIR MARIN JARAMILLO Top medicos', 'NI', 'NI', 'Compra', 'Factura', 'FE-7405', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', '104000'),
(14, 'LIME', 'Prado', 'Centrífuga refrigerada', '117104', 'BIO-12250', '18 - 270', 'Gloria Ramírez / Carlos Muñeton', 'Biologia Molecular (Extraccion)', 'Sigma', '3-16K', '110639', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2015DM-0012550', 'NI', '16/06/2005', 'UdeA', '01/01/2005', '800.240.039-8', 'Sigma Laborzentrifugen                                            Anditécnica', 'NI', 'NI', 'Compra', 'Factura', '2005-32874', 'SI', 'SI', 'SI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '2', 'Si', '2', 'Temperatura                                           Tiempo                                        ', 'T -10 a 40°C                                             0 - 30 min/funcionamiento continuo/\r\noperación de corta duración                             ', '1°C                                                                                                 ', '18 a 22°C                                                          15 a 25 min                                                                     120', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(15, 'LIME', 'Prado', 'Balanza Analítica', '189604', 'BIO-16749', '18 - 449', 'Ivone Jimenez / Andres Zuluaga', 'BSL3 (Procesamiento)', 'ViBRA', 'HT224CEN', '215022050', 'Extensión e Investigación', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009', 'NI', '18/11/2021', 'UdeA', 'NI', '811.026.956-0', 'MR Y CIA S.A.S', 'NI', 'NI', 'Compra', 'Factura', 'MRE14352', 'SI', 'SI', 'SI (físico', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Peso', '0,01 - 220 g', 'NI', 'NI', 'NI', 'Adaptador entreda            100 - 240 VAC        ', 'NI', 'Máx. 80%HR', '10 - 30 °C', '213 x 314 x 395,3 mm (Ancho x Alto x Profundo)', '2,5kg', 'Frecuencia 50 - 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(16, 'LIME', 'Prado', 'Incubadora', '134788', 'BIO-12256', '18 - 013', 'Gloria Garcia / Gloria Ramírez', 'Citogenomica (Preanalitica)', 'Binder', 'BD53-UL', '908707', 'Extensión', 'BIO', 'NI', 'Certificación de No Requiere 2014010943', 'NI', '24/11/2009', 'UdeA', 'NI', '890.912.308-6', 'Laboratorios Ltda.', 'NI', 'NI', 'Compra', 'Factura', 'CR 00049421', 'SI', 'NI', 'SI', 'NI', 'SI', 'SI', 'Anual', 'NI', 'Si', '1', 'Si', '1 (Calificación)', 'Temperatura', '5 °C por \r\nencima de la temperatura ambiente - 100 °C', '0,1 °C', '36,5°C-37,5°C', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(17, 'LIME', 'Prado', 'Filmarray', '187250', 'BIO-16698', 'NI', 'Enith Knuth / Andres Zuluaga', 'Microbiología 1', 'BIOFIRE', 'FilmArray Torch (ref: HTFA-ASY-0104)', 'TB03545', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2014DM-0011912', 'NI', 'Factura 22/07/2021 R', 'UdeA', '01/03/2021', '830.023.844-1', 'Biomérieux', 'No tiene g', 'NI', 'Compra', 'Factura                        Reporte de instalac', 'FE23094 00728988', 'SI', 'SI', 'SI', 'Carta de no requiere', 'SI (provee', 'NI', 'NR', 'NI', 'NI', 'NR', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '120 VAC', '3,2 A (2 modulos)', '20 - 80 %HR', '15 - 30 °C', '458 x 737 x 292 mm', '29,9 kg', 'Frecuencia 50 - 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(18, 'LIME', 'Prado', 'Maglumi', 'A-LIME-003', 'BIO-16303', 'NI', 'Juan Carlos Herrera / MyM Diagnostics', 'Procesamiento Seccion B', 'SNIBE', 'MAGLUMI 600', '0101010003022000165', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2012DM-0009229	', 'NI', '31/08/2021', 'Arriendo MYM', '14/12/2020', '900.228.842-1', 'MyMDiagnostics', 'NI', 'NI', 'Apoyo tecnológico', 'Acta de entrega', '2930', 'SI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '2', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100 - 240 VAC', 'NI', 'NI', 'NI', 'NI', 'NI', 'Frecuencia 50/60 Hz Potencia 350 VA', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(19, 'LIME', 'Prado', 'Micropipeta', 'LIME 001', 'BIO-12177', '15 - 166', 'Andres Hincapie', 'Procesamiento Seccion C', 'Corning', 'Lambda Plus', '658220168', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 Septiembre 17 de 2014', 'NI', '12/10/2016', 'UdeA', 'NI', '811.026.956-0', 'MR Y Cia S.A.S', 'NI', 'NI', 'Compra', 'Factura', 'MRC2303', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '0,5 - 10 ul', '0,02 uL', '0,5- 10 µl', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', '788800'),
(20, 'Centro de resonancia', 'Prado', 'Resonador magnetico', '207255', 'BIO-15348', 'NT', 'Pablo Patiño Grajales /Isabella Ariza', 'Hospital Alma Mater de Antioquia, Bloque B, primer piso, Centro de resonancia', 'PHILIPS', 'INGENIA ELITION X', '45555', 'Extensión e Investigación', 'BIO', 'Clase IIa', 'INVIMA 2018EBC-0017485', '10 años', '23/09/2022', 'UdeA', 'NI', '860.005.396-4', 'PHILIPS COLOMBIANA S.A.S', 'NI', '23/09/2024', 'Compra', 'Contrato y Acta de entrega del bien mueble', 'LATAM_109371', 'SI', 'SI', 'SI', 'Carta de proveedor de no entrega de manual', 'NI', 'NI', 'NI', 'Semestral', 'Si', '2', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', '$1.957.500 USD más IVA'),
(21, 'Fotodermatología', 'Prado', 'CAMARA DE FOTOTERAPIA', '128568', 'BIO-100561', '13-037', 'Jhon Frank Villa', 'Hospital Alma Mater de Antioquia, Bloque A, segundo piso, FOTOTERAPIA', 'DAAVLIN', 'P3251-SNBPC-0048', '3SERIES PC31148', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2009EBC-0003822', 'NI', 'NI', 'UdeA', 'NI', 'NI', 'NI', 'NI', 'NI', 'Compra', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '4', 'Si', '1 Timer', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(22, 'Fotodermatología', 'Prado', 'CAMARA DE FOTOTERAPIA', '151197', 'BIO-102003', '13-037', 'Jhon Frank Villa', 'Hospital Alma Mater de Antioquia, Bloque A, segundo piso, FOTOTERAPIA', 'DAAVLIN', 'P3526A1X4800', '3SERIES X350-48', 'Extensión', 'BIO', 'Clase I', 'INVIMA 2009EBC-0003822', 'NI', 'NI', 'UdeA', 'NI', 'NI', 'NI', 'NI', 'NI', 'Compra', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '4', 'Si', '1 Timer', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(23, 'Trasplantes GICIG', 'SIU', 'Agitador vortex', '116989 / 008819', 'BIO-16857', '15-651', 'Juan Jose Serrano / Gloria Vasquez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'SCIENTIFIC INDUSTRIES /GENIE 2', 'G-560', '2-374976', 'Extensión', 'BIO', 'NI', 'Antes de 2007', 'NI', '12/05/2005', 'UdeA', 'NI', '811.033.098-5', 'Importecnical Ltda.', 'NI', 'NI', 'Compra', 'Factura', '001807', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'Velocidad', 'Perilla de posiciones (1 a 10)', 'NI', 'NI', 'NI', '120 VAC', '0,65 A', 'Máx. 95%HR', '0 - 38 °C', '165 x 122 x 165 mm (profundo x ancho x alto)', '4 kg', 'Frecuencia 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '1276000'),
(24, 'Trasplantes GICIG', 'SIU', 'Balanza analítica', '164386', 'BIO-16858', '18-449', 'Juan Jose Serrano / Cristiam Alvarez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'PRECISA', 'LS220A', '7001460', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 03 Abril 10 de 2013', 'NI', '01/08/2016', 'UdeA', 'NI', '860.536.024-8', 'Wacol S.A.', 'NI', '01/08/2018', 'Compra', 'Factura', '144593', 'SI', 'NI', 'SI (ING)', 'SI (ING - CAP)', 'SI (Fabric', 'SI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Masa', 'Máx. 220 g', '0,1 mg', 'NI', 'NI', 'Entrada adaptador 90 - 264 VAC Entrada equipo desd', 'Entrada equipo desde adaptador 1,5 A', '25% a 85% (sin condensar)', '0°C a 40°C', '228 x 381 x 345 mm (ancho x largox alto)', '6,6 kg', 'Frecuencia de entrada a adaptador 47 - 63 Hz   ', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(25, 'Trasplantes GICIG', 'SIU', 'Cabina de extracción', 'C481 (E-20702301-2-004)', 'BIO-16859', 'NT', 'Juan Jose Serrano', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'C4', 'CEX 120', '100406', 'Extensión', 'BIO', 'NI', 'No requiere, Adquirido antes de 2007', 'NI', '01/01/1970', 'UdeA', 'NI', '805.016.686-2', 'C4 Pascal', 'NI', 'NI', 'Compra', 'Histórico de reportes de mantenimiento', 'NI', 'SI', 'NI', 'SI', 'SI (CAP)', 'SI', 'SI', 'Se describ', 'Semestral', 'Si', '1', 'Si', '1 (calificación)', 'NI', 'NI', 'NI', 'NI', 'NI', '110 VAC', 'NI', 'NI', 'NI', '1200 X 1800 X 1519 cm \r\n(ancho x fondo x alto)', 'NI', 'Frecuencia 50 / 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(26, 'Trasplantes GICIG', 'SIU', 'Calentador seco', '108942 / 008843', 'BIO-16860', 'NT', 'Juan Jose Serrano / Gloria Vasquez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'BOEKEL', '113002', '0233 12871', 'Extensión', 'BIO', 'Clase I ', 'Antes de 2007', 'NI', '01/10/2002', 'UdeA', 'NI', 'NI ', 'BIOLOGIA MOLECULAR', 'NI', 'NI', 'Compra', 'Histórico de reportes de mantenimiento y hojas de ', 'NI', 'SI', 'NI', 'NI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'Temperatura', '5 - 120 °C', '5 - 120 °C', 'NI', 'NI', '115 VAC', '1,75 A', 'NI', 'NI', 'NI', 'NI', 'Potencia 200 W Frecuencia 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(27, 'Trasplantes GICIG', 'SIU', 'Incubadora', '34022 / 008808', 'BIO-16868', '18-013', 'Juan Jose Serrano / Gloria Vasquez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'MEMMERT', 'TV10', '599033', 'Extensión', 'BIO', 'NI', 'Adquirido antes de 2007', '10 años', 'Antes de 2003', 'UdeA', 'NI', 'NI', 'NI', 'NI', 'NI', 'Compra', 'Histórico de reportes de mantenimiento', 'NI', 'SI', 'NI', 'NI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'Si', '1 (calificación)', 'Temperatura', 'NI', 'NI', 'NI', 'NI', '120 VAC', 'NI', 'NI', 'NI', 'NI', 'NI', 'Potencia 1400 W', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(28, 'Trasplantes GICIG', 'SIU', 'Luminex', '180235 / 008811', 'BIO-16869', 'NT', 'Juan Jose Serrano / Cristiam Alvarez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410', 'LUMINEX', 'Luminex LX 100/ 200', 'LX10017065423', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2020DM-0022003', '10 años', 'Fecha de compra: 29/', 'UdeA', '06/03/2017', '900.222.640-1', 'BIOSCIENCES S.A.S.', 'NI', 'NI', 'Compra', 'Factura', '5220', 'SI', 'SI', 'SI', 'SI (CAP)', 'SI', 'SI', 'NI', 'Semestral', 'Si', '2', 'NI', 'NI', 'Longitud de onda', 'laser reportero 532nm y laser clasficador 635nm', 'NI', 'NI', 'NI', '100 - 120 VAC / 200 - 240 VAC', '1,4 A / 0,8 A', '20 % A 80% HR, sin condensación', '15 - 30 °C', '43 x 50,5 x 24,5 cm (ancho x profundidad x alto)', '25 kg', 'Frecuencia 47 - 63 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '292320000'),
(29, 'Trasplantes GICIG', 'SIU', 'Micropipeta', '12 / 3 - 058976 - 02', 'BIO-16875', '15-166', 'Juan Jose Serrano ', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410 - (Post-PCR) ', 'GILSON', 'P-1000', 'Y51513C', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 17 de Septiembre de 2014', 'NI', '01/01/1970', 'UdeA', 'NI', '811.026.956-0', 'MR Y CIA S.A.S', 'NI', 'NI', 'Compra', 'Hojas de vida anteriores', 'NI', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '200 - 1000 ul', '2 uL', '200 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(30, 'Trasplantes GICIG', 'SIU', 'Micropipeta', '18 / 59470', 'BIO-16876', '15-166', 'Juan Jose Serrano ', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410 - (PRE-PCR) Backup1', 'GILSON', 'P-1000', 'X63933E', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 17 de Septiembre de 2014', 'NI', 'Antes de 2005', 'UdeA', 'NI', '	800.160.884-1', 'FILTRACIÓN Y ANÁLISIS', 'NI', 'NI', 'Compra', 'Histórico de reportes de mantenimiento', 'NI', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '200 - 1000 ul', '2 uL', '200 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(31, 'Trasplantes GICIG', 'SIU', 'Micropipeta', '8 / 3.060881.00', 'BIO-16877', '15-166', 'Juan Jose Serrano / Gloria Vasquez', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410 - (PRE-PCR) Backup2', 'GILSON', 'P-1000', 'CB63839', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 17 de Septiembre de 2014', 'NI', 'Antes de 2018', 'UdeA', 'NI', 'NI', 'ND', 'NI', 'NI', 'Compra', 'Histórico de reportes de mantenimiento', 'NI', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '200 - 1000 ul', '2 uL', '200 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(32, 'Trasplantes GICIG', 'SIU', 'Micropipeta', '4 / 3 - 059471 - 00 / 011919', 'BIO-16878', '15-166', 'Juan Jose Serrano ', 'SIU - Laboratorio trasplantes - Torre 1, Lab 410 -  (PRE-PCR)', 'GILSON', 'P-1000', 'X62492E', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 17 de Septiembre de 2014', 'NI', 'NI', 'UdeA', 'NI', '	800.160.884-1', 'FILTRACIÓN Y ANÁLISIS', 'NI', 'NI', 'Compra', 'NI', 'NI', 'SI', 'NI', 'SI (ING)', 'NI', 'SI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '200 - 1000 ul', '2 uL', '200 - 1000 ul', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(33, 'Inmunodeficiencias Primarias', 'SIU', 'Refrigerador', '132496 / 008721', 'Pendiente', '17-157', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'FAGOR', 'AFP701', '06060075M', 'Extensión', 'IND', 'NI', 'NI', 'NI', '31/07/2009', 'UdeA', 'NI', '811.014.137-3', 'Fagor Industrial S.A.', 'NI', 'Julio de 2010', 'Compra', 'Factura', '010190', 'SI', 'NI', 'SI (Ficha ', 'NI', 'NI', 'NI', 'NI', 'NI', 'SI', '1', 'SI', '1 (calificación)', 'Temperatura', 'T - 2 a 8 °C', 'NI', 'NI', 'NI', '220 VAC', 'NI', 'NI', 'Máx. 43°C', '693 x 726 x 2067 mm', '110 kg', 'Potencia 208 W Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(34, 'Inmunodeficiencias Primarias', 'SIU', 'Lector de platos ELISA', '146231', 'BIO-16759', '16-979', 'Diana Arboleda / Juan Álvaro López Quintero', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'BioRad', 'iMark', '15486', 'Extensión', 'BIO', 'Clase IIa', 'Comprado en Febrero de 2013 y el INVIMA lo clasificó como dispositivo médico en Acta No. 08 septiembre 11 de  2013', 'NI', '02/06/2013', 'UdeA', 'NI', '830.034.233-7', 'AM LTDA.', 'NI', 'Febrero de 2014', 'Compra', 'Factura', '12-065', 'SI', 'NI', 'SI', 'SI', 'NI', 'NI', 'SI', 'Anual', 'SI', '1', 'NI', 'NI', 'Longitud de onda', '400 - 750 nm', 'NI', 'NI', 'NI', '120 VAC', 'NI', 'Máx. 90%HR', '15 - 40 °C', '346 mm x 377 mm x 164 mm (ancho x profundidad x altura)', '5,5 kg', 'Frecuencia 50/60 Hz Potencia 100 VA', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(35, 'Inmunodeficiencias Primarias', 'SIU', 'Lavador de platos de ELISA', '140119 / 008685', 'BIO-16760', '17-489', 'Diana Arboleda /Monica Lucia Giraldo Restrepo', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'Awareness Technology', 'Stat Fax 2600', '2600-7447', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2018DM-0018956', 'NI', '06/07/2011', 'UdeA', 'NI', '830.025.281-2', 'ANNAR', 'NI', 'Julio de 2012', 'Compra', 'Factura', 'SAS-144963', 'SI', 'NI', 'SI', 'SI (CAP MANT)', 'NI', 'NI', 'SI (parcia', 'Semestral', 'SI', '1', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '110-120 / 220-240 VAC', 'NI', '80%HR para temperaturas de hasta 31 ° C, disminuye', '5 - 40 °C', '34,3 cm x 40,6 cm x 19 cm', '10 kg', 'Potencia 70 W Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(36, 'Inmunodeficiencias Primarias', 'SIU', 'Microscopio', '132498 / 040037', 'BIO-16761', '12-536', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'OLYMPUS', 'CX21FS1', ' 8D07016', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009, en esta acta el Invima indica que los microscopios no requieren registro sanitario, hasta el ACTA No. 09 Octubre 17 de 2', 'NI', 'Factura 24/07/2009  ', 'UdeA', 'NI', '811.033.098-5', 'Importecnical', 'NI', '31/07/2010', 'Compra', 'Factura', '006823', 'SI', 'NI', 'SI (ING)', 'SI (ING)', 'SI', 'NI', 'SI', 'Anual', 'SI', '1', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100-120/220-240 VAC', '0,42/0,25 A', '80%HR para temperaturas de hasta 31 ° C, disminuye', '5 - 40 °C', '154 x 391 x 238 mm', '5,9 kg', 'Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(37, 'Inmunodeficiencias Primarias', 'SIU', 'Microscopio', '132499 / 008680', 'BIO-16811', '12-536', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Cuarto de cultivo', 'OLYMPUS', 'CX21FS1', ' 8F11617', 'Extensión e investigación', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009, en esta acta el Invima indica que los microscopios no requieren registro sanitario, hasta el ACTA No. 09 Octubre 17 de 2', 'NI', 'Factura 24/07/2009  ', 'UdeA', 'NI', '811.033.098-5', 'Importecnical', 'NI', '31/07/2010', 'Compra', 'Factura', '006823', 'SI', 'NI', 'SI (ING)', 'SI (ING)', 'SI', 'NI', 'SI', 'Anual', 'SI', '1', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100-120/220-240 VAC', '0,42/0,25 A', '80%HR para temperaturas de hasta 31 ° C, disminuye', '5 - 40 °C', '154 x 391 x 238 mm', '5,9 kg', 'Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(38, 'Inmunodeficiencias Primarias', 'SIU', 'Baño María', '143436 / 008689', 'BIO-16307', '16-861', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'Memmert', 'WNB 7', 'L211.1357', 'Extensión  ', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009 indica que no requiere registro sanitario, y se rectifica en ACTA No. 09 Octubre 17 de 2012', 'NI', '22/05/2012', 'UdeA', 'NI', '811.033.098-5', 'Importecnical', 'NI', 'Mayo de 2013', 'Compra', 'Factura', 'IM011571', 'SI', 'NI', 'SI', 'SI (CAP MANT)', 'SI', 'SI', 'SI', 'NI', 'SI', '1', 'SI', '1', 'Temperatura         Tiempo', '10 - 95 °C         99:59 hrs:min', '0,1 °C', 'NI', 'FLUCTUACION DE CONTROL/VARIACION DE TEMPERATURA: +/-0.1 ºC /+/-0.25 ºC', '115 VAC', '10,4 A', 'Máx. 80% HR', '5 - 40 °C', 'Altura 337 mm X  Largo 468 mm X Ancho 356 mm', '11 kg', 'Potencia 1200 W                                                                              Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '2648280'),
(39, 'Inmunodeficiencias Primarias', 'SIU', 'Baño María', '143437 / 040042', 'BIO-16755', '16-861', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530', 'Memmert', 'WNB 7', 'L211.1359', 'Extensión e investigación', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009 indica que no requiere registro sanitario, y se rectifica en ACTA No. 09 Octubre 17 de 2012', 'NI', '22/05/2012', 'UdeA', 'NI', '811.033.098-5', 'Importecnical', 'NI', 'Mayo de 2013', 'Compra', 'Factura', 'IM011571', 'SI', 'NI', 'SI', 'SI (CAP MANT)', 'SI', 'SI', 'SI', 'NI', 'SI', '1', 'SI', '1', 'Temperatura         Tiempo', '10 - 95 °C         99:59 hrs:min', '0,1 °C', 'NI', 'FLUCTUACION DE CONTROL/VARIACION DE TEMPERATURA: +/-0.1 ºC /+/-0.25 ºC', '115 VAC', '10,4 A', 'Máx. 80% HR', '5 - 40 °C', 'Altura 337 mm X  Largo 468 mm X Ancho 356 mm', '11 kg', 'Potencia 1200 W                                                                              Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '2648280'),
(40, 'Inmunodeficiencias Primarias', 'SIU', 'Incubadora CO2', 'No tiene', 'BIO-16311', '18-013', 'Diana Arboleda / Claudia Milena Trujillo Vargas', 'SIU - Cuarto de cultivo', 'Thermo Scientific', 'Series 8000 WJ 3428', '181988-102', 'Extensión e investigación', 'BIO', 'Clase IIa', 'INVIMA 2017DM-0016578', 'NI', '29/10/2013', 'Comprado por fundación', '08/08/2013', '860.072.122-9', 'G&G Sucesores', 'NI', 'Octubre de 2014', 'Donación', 'Factura', 'F-8502', 'SI', 'NI', 'SI (ING Y ', 'SI (CAP MANT ING Y TRADUCIDO)', 'SI', 'SI', 'NI', 'Anual', 'SI', '1', 'SI', '1 (calificación)', 'Temperatura         %CO2', '5ºC sobre la temperatura ambiente hasta 55ºC                             0 - 20 %CO2', '0,1 °C / 0,1 %CO2', 'NI', 'NI', '115 VAC', '3,60 A', '80 %HR hasta 31 °C, decreciendo linealmente hasta ', '5 - 40 °C', '66,8cm x 100,3cm x 635cm', '120,2 kg', 'Frecuencia 50/60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '17933600'),
(41, 'Inmunodeficiencias Primarias', 'SIU', 'Agitador Vortex', '151664', 'BIO-16308', '15-651', 'Diana Arboleda / Jose Luis Franco', 'SIU - Laboratorio de Inmunodeficiencias primarias - Torre 2, Lab 530 ', 'Labnet', 'S0200', 'Z3121820', 'Extensión  ', 'BIO', 'NI', 'ACTA No. 07 Junio 10 de 2009 indica que no requiere registro sanitario, y se rectifica en ACTA No. 03 Abril 10 de 2013 ', 'NI', '22/04/2014', 'UdeA', 'NI', '860.521.570-2', 'Biodiagnóstica Ltda', 'NI', 'Abril de 2015', 'Compra', 'Factura', '16028', 'SI', 'NI', 'SI', 'SI (CAP MANT)', 'SI', 'SI', 'NI', 'NI', 'SI', '1', 'NI', 'NI', 'Velocidad               ', 'Máx. 3400 rpm (60 Hz) / 2850 rpm (50 Hz)', 'NI', 'NI', 'NI', '120 VAC', '0,6 A', 'NI', '4 - 65 °C', '14 x 16 x 12 cm', '2,2 kg', 'Frecuencia 60 Hz', 'activo', 'NI', 'NI', 'NI', 'NI', '501120'),
(42, 'Inmunodeficiencias Primarias', 'SIU', 'Centrífuga refrigerada', '119807 / 000791', 'BIO-16756', '18-265', 'Diana Arboleda / Jose Luis Franco', 'SIU - Cuarto de cultivo', 'Eppendorf', ' 5810R ', '0033896', 'Extensión e investigación', 'BIO', 'Clase I', 'INVIMA 2014DM-0011801', 'NI', '01/01/2006', 'UdeA', '01/01/1970', '811.033.098-5', 'Importecnical', 'NI', 'Mayo de 2007', 'Compra', 'NI', 'NI', 'SI', 'NI', 'SI', 'SI (CAP MANT)', 'SI', 'SI', 'NI', 'Anual', 'SI', '1', 'SI', '1', 'Velocidad         Temperatura      Tiempo', '200 - 14000 rpm                                                T -9 - 40 °C                                                    1 - 99 min', '10 rpm hasta 5000 rpm, en adelante 100 rpm                                           1°C            ', 'NI', 'NI', '120 VAC', '12 A', 'Máx. 75 %HR', '10 - 35 °C', '700 x 608 x 345 mm', '99 kg', 'Frecuencia 60 Hz  Potencia 1300 W', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(43, 'Grupo Reproducción', 'SIU', 'Balanza Analitica', '038547', 'BIO-16846', '10-261', 'Carolina Navarro', 'SIU - Laboratorio Reproducción - Torre 2, Lab 534', 'Adam Equipment', 'NBL 124e', 'AE9UT335', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 07 Junio 10 de 2009', 'NI', 'NI', 'UdeA', 'NI', '900.355.024-5', 'Equipos y laboratorio', 'NI', 'NI', 'Compra', 'Factura', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Peso', 'carga max. 120 g', '0,0001 g', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(44, 'Grupo Reproducción', 'SIU', 'Micropipeta', '023117', 'BIO-17234', '15-166', 'Carolina Navarro', 'SIU - Laboratorio Reproducción - Torre 2, Lab 534', 'Nichirio', 'Nichipet Explus', 'H38014182', 'Extensión', 'BIO', 'Clase I', 'ACTA No. 09 17 de Septiembre de 2014', 'NI', 'NI', 'UdeA', 'NI', 'NI', 'GENTECH', 'NI', 'NI', 'Compra', 'Factura', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '2 - 20 uL', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(45, 'Patología', 'San Vicente', 'Micropipeta', 'LIME 541', 'BIO-16512', '15-166', 'Martha Londoño', 'Inmunohistoquímica', 'Sartorius', 'Tacta', '42186226', 'Extensión e Investigación', 'BIO', 'Clase I', 'Certificación No requiere N° 2016020596', 'NI', 'Factura 08/09/2023', 'UdeA', 'NI', '860.001.911-1', 'Kaika', 'Si', '08/09/2024', 'Compra', 'Factura', '00KK1915', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Volumen', '10 - 100 uL', '0,1 uL', '10 - 100 uL', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(46, 'Patología', 'San Vicente', 'Procesador de tejidos', '119420', 'BIO-16504', '15-190', 'Juliana', 'Histotécnica', 'Leica', 'TP1020-1-1', '42231412', 'Extensión e Investigación', 'BIO', 'Clase I', 'INVIMA 2015DM-0013758', 'NI', '01/01/1970', 'UdeA', 'NI', '860.000.648-2', 'Sanitas', 'NI', 'NI', 'Compra', 'NI', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Semestral', 'Si', '2', 'Si', '2', 'Temperatura', '45 - 65 °C', '1 °C', 'NI', 'NI', '100 -120 VAC', 'NI', '20 - 80 %HR', '5 - 40 °C', 'Altura 595 - 780 mm            Diametro tapa 820 mm', '60 kg', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(47, 'Patología', 'San Vicente', 'Criostato', '187701', 'BIO-16464', '15-157', 'Juliana', 'Cuarto criostato', 'Leica', 'CM1860 UV', '00000005299', 'Extensión e Investigación', 'BIO', 'Clase I', 'INVIMA 2015DM-0013759', 'NI', '12/02/2021', 'UdeA', 'Diciembre 2020', '860.000.648-2', 'Sanitas ', 'NI', '12/02/2022', 'Compra', 'Factura', 'FE 46070', 'SI', 'SI', 'SI', 'SI (ING)', 'SI (PROV)', 'NI', 'NI', 'Semestral', 'Si', '2', 'NI', 'NI', 'Temperatura', '0 a -35 °C', '1 °C', 'T -20 a -22 °C', 'NI', '120 - 127 VAC', 'NI', '20 - 60 %HR', '18 - 35 °C', '730 x 730 x 1140 mm', '135 kg', 'Frecuencia: 60 Hz  Potencia: 1440 VA ', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(48, 'Patología', 'San Vicente', 'Estación de Corte Macro', '189565', 'BIO-16466', 'NT', 'Juliana', 'Corte macro', 'Kugel Medical', 'GP 1500', '20.206422.01', 'Extensión e Investigación', 'BIO', 'NI', 'Certificación No requiere N° 2018003889', 'NI', '05/04/2021', 'UdeA', 'NI', '860.000.648-2', 'Sanitas ', 'NI', '05/04/2022', 'Compra', 'Acta de entrega', 'NT', 'SI', 'SI', 'SI (ING)', 'NI', 'NI', 'NI', 'NI', 'Anual', 'Si', '1', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '110 VAC', 'NI', 'Menor 75 %HR', 'Menor a 25 °C', '1500 x 800 x 850/1950 mm', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(49, 'Patología', 'San Vicente', 'Estación de inclusión', '178684 / 061551', 'BIO-16467', 'NT', 'Juliana', 'Histotécnica', 'Leica', 'HistoCore Arcadia H / Arcadia C', '1671 / 2048', 'Extensión e Investigación', 'BIO', 'NI', 'No requiere INVIMA', 'NI', 'NI', 'UdeA', 'Diciembre 2017', '860.000.648-2', 'Sanitas', 'NI', '06/02/2019', 'Compra', 'NI', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Semestral', 'Si', '2', 'NI', 'NI', 'Temperatura', 'Arcadia H: 50 - 75°C                                            Arcadia C: - 6°C', 'Arcadia H: 1 °C', 'Arcadia H: 54 - 60°C                                           Arcadia C: - 6°C', 'Arcadia H: 1,2 °C', '100 - 120 VAC', 'Arcadia H: 10 A máx.                         Arcad', '20 - 80 %HR', '20 - 30 °C', 'Arcadia H: 384 x 560 x 636 mm Arcadia C: 384 x 400 x 636 mm (Alto x Ancho x Profundo)', 'Arcadia H: 27 kg Arcadia C: 32 kg', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(50, 'Dermatopatología', 'San Vicente', 'Refrigerador-congelador mixto', '209912', 'Pendiente', 'NT', 'Diana Meneses', 'Hospital Universitario San Vicente Fundación, Bloque 7, Laboratorio de Dermatopatología, Área de procesamiento - Baño de flotación', 'MELING BIOMEDICAL', 'YCD-EL450', '220702139', 'Extensión e Investigación', 'BIO', 'Clase IIa', 'INVIMA 2022DM-0025849', 'NI', '12/07/2024', 'UdeA ', '01/07/2022', '900355024-5', 'Equipos y laboratorio', 'NI', '12/07/2025', 'Compra', 'Factura', 'FE13533', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'Temperatura', 'Refrigeración \r\n2 a 8 °C\r\nCongelación\r\n- 10 a -26 °C', 'NI', 'NI', 'NI', '110 VAC', '3,23 A', 'NI', 'NI', 'NI', '144 Kg', 'Frecuencia  60Hz\r\nVolumen 450 L', 'activo', 'NI', 'NI', 'NI', 'NI', '16592631'),
(51, 'Dermatopatología', 'San Vicente', 'Baño de flotación', '209557', 'BIO-16666', '15 - 107', 'Diana Meneses', 'Hospital Universitario San Vicente Fundación, Bloque 7, Laboratorio de Dermatopatología, Área de procesamiento - Baño de flotación', 'KEDEE', 'KD-P', '51A638', 'Extensión e Investigación', 'BIO', 'NI', 'No requiere INVIMA', '7 Años', '19/07/2024', 'UdeA ', '01/04/2024', '901.633.213-7', 'Mercilab S.A.S', 'Si', '01/07/2025', 'Compra', 'Factura', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1', 'NI', 'NI', 'NI', 'NI', 'NI', '110 VAC', 'NI', 'NI', 'NI', 'NI', 'NI', 'Frecuencia  60Hz\r\nPotencia 200 W', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(52, 'Dermatopatología', 'San Vicente', 'Termohigrómetro digital', '2 (TH-DP-01)', 'BIO-16685', 'NT', 'Diana Meneses', 'Hospital Universitario San Vicente Fundación, Bloque 7, Laboratorio de Dermatopatología, Cuarto de inmunofluorecencia', 'Clock-Humidity', 'HTC-2', 'N/I', 'Extensión e Investigación', 'BIO', 'Clase I', 'ACTA No. 03 Abril 10 de 2013', 'NI', 'NI', 'UdeA ', 'NI', 'NI', 'NI', 'NI', 'NI', 'Compra', 'NI', 'NI', 'Si', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Temperatura/Humedad', 'T -10 - 50 °C / 10 - 99 %HR', '0,1 °C / 1% HR', '18°C a 25°C / 40% a 67%.', '0,01 °C / -0,4 %HR', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(53, 'Dermatopatología', 'San Vicente', 'Termohigrómetro digital', '1 (01A10)', 'BIO-16686', 'NT', 'Diana Meneses', 'Hospital Universitario San Vicente Fundación, Bloque 7, Laboratorio de Dermatopatología, Área de procesamiento', 'BOECO Germany', 'BOE330', 'N/I', 'Extensión e investigación', 'BIO', 'Clase I', 'ACTA No. 03 Abril 10 de 2013', 'NI', 'NI', 'UdeA ', 'NI', 'NI', 'NI', 'NI', 'NI', 'Compra', 'NI', 'NI', 'Si', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Temperatura/Humedad', '0 - 50 °C / 25 - 95 %HR', '1 °C / 1%HR', '18 a 25 °C / 40 a 67 %HR', '0,24 °C / -0,7 %HR', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(54, 'Dermatopatología', 'San Vicente', 'Microscopio y Cámara Leica', '164367', 'BIO-16681', '15 - 156', 'Diana Meneses', 'Hospital Universitario San Vicente Fundación, Bloque 7, Laboratorio de Dermatopatología, Cuarto de inmunofluorecencia', 'Leica', 'DM500', 'C540242931LS0390', 'Investigación, docencia y extensión', 'BIO', 'Clase I', 'INVIMA 2014DM-0011844', 'NI', '01/01/1970', 'UdeA ', '01/05/2016', '860.000.648-2', 'Sanitas S.A.S', 'NI', 'NI', 'Compra', 'NI', 'NI', 'Si', 'NI', 'Si', 'Si', 'NI', 'NI', 'NI', 'NI', 'Si', '2', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100 - 240 VAC', 'NI', 'NI', 'NI', 'NI', 'NI', 'Frecuenia 50/60 Hz\r\nPotencia 17W', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(55, 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(56, 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'activo', 'NI', 'NI', 'NI', 'NI', 'NI'),
(57, 'LIME', 'Prado', 'Beaker', '051103', 'Pendiente', '15 - 583', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion C', 'Challenger', 'CV430', '9053127', 'Extensión', 'IND', 'NI', 'NI', 'NI', '10/12/2009', 'UdeA', 'NI', '890.934.939-8', 'Almacén Navarro Ospina S.A.', 'NI', 'NI', 'Compra', 'Factura', '47736', 'SI', 'NI', 'SI', 'NI', 'NI', 'NI', 'NI', 'NI', 'Si', '1', 'Si', '1 (Calificación)', 'Temperatura', 'T -18', 'NI', '0 a - 33 ° C', 'NI', '115 VAC', 'NI', 'NI', 'Max 38°C', '53,5 x 53 x 142 cm', '55,5 kg', 'NI', 'inactivo', 'mantenimiento', '12/12/12', '0', '0', 'NI'),
(58, 'LIME', 'Prado', 'Pinzas', '110703', 'BIO-12183', 'NT', 'Gloria Zapata / Gloria Zapata', 'Procesamiento Seccion A', 'Helena Laboratories', 'AGGRAM', '630604801', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2019DM-0019614', 'NI', '30/03/2006', 'UdeA', 'NI', '830.064.712-1', 'Helena Laboratories INC. (exportador)                  Labtronics S.A.S    ', 'NI', 'NI', 'Compra', 'Factura', '96442', 'SI', 'SI', 'SI (ing)', 'Carta de proveedor de no entrega de manual', 'SI', 'SI', 'NI', 'NI', 'Si', '1', 'NI', 'NI', 'Absorbancia', '0 - 2 DE ', 'NI', '0 - 2 DE ', 'NI', '110 VAC', 'NI', 'NI', '15 - 30 °C', '15,24 cm x 25,40 cm x 43,18 cm (alto x ancho x profundidad)', '6,75 Kg', 'Frecuencia 50/60 Hz', 'inactivo', 'transporte', '12/11/10', '0', '0', 'NI'),
(59, 'LIME', 'Prado', 'Compensador de Adelanto', '120700', 'BIO-12186', '10 - 780', 'Gloria Zapata / Gloria Zapata', 'Área centrífugas', 'BOECO - HETTICH', 'U-320R', '0000189', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2014DM-0011507', 'NI', '02/12/2008', 'UdeA', '01/01/1970', '811.033.098-5', 'Importecnical Ltda.', 'NI', 'NI', 'Compra', 'Factura', '006093', 'SI', 'NI', 'NI', 'NI', 'SI', 'SI', 'NI', 'NI', 'Si', '2', 'Si', '2', 'vacio', 'Max. 15000 rpm (según folleto)               Max. 5000 rpm (evidencia)                             T -20 a 40°C', '10 rpm                    1°C                                                                       ', '1000 - 4500 rpm', 'NI', '200 - 240 V', '4 A', 'NI', 'NI', '346 x 401 x 695 mm', '53 kg', 'NI', 'baja', 'fin de vida util', '12/12/12', '0', 'fin de vida util', 'NI'),
(60, 'LIME', 'Prado', 'Compensador de Atraso', '230285', 'BIO-16281', '15 - 098', 'Gloria Zapata / Andres Zuluaga', 'Procesamiento Seccion A', 'SYSMEX', 'CS2500', '25407', 'Extensión', 'BIO', 'Clase IIa', 'INVIMA 2016DM-0015107', 'NI', '28/06/2021 (Facturad', 'UT LIME', 'NI', '900.931.305-0', 'SIEMENS', 'NI', '15/07/2022', 'Compra', 'Factura', 'TE57569', 'SI', 'SI', 'SI', 'SI (CAP)', 'SI', 'SI', 'SI', 'Semestral', 'Si', '2', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', 'NI', '100 - 240 VAC', 'NI', '30 - 85 %HR', '15 - 30 °C', 'Unidad principal                           775 x 895 x 685 mm                        Unidad neumática                             280 x 355 x 400 mm', 'Unidad principal                           110 kg ', 'NI', 'baja', 'dañado', '12/12/12', '0', 'dañado', 'NI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add equipo info', 7, 'add_equipoinfo'),
(26, 'Can change equipo info', 7, 'change_equipoinfo'),
(27, 'Can delete equipo info', 7, 'delete_equipoinfo'),
(28, 'Can view equipo info', 7, 'view_equipoinfo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'equipoinfo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-11-22 04:16:39.850550'),
(2, 'auth', '0001_initial', '2025-11-22 04:16:40.369605'),
(3, 'admin', '0001_initial', '2025-11-22 04:16:40.485155'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-11-22 04:16:40.495560'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-22 04:16:40.516333'),
(6, 'api', '0001_initial', '2025-11-22 04:16:40.538853'),
(7, 'contenttypes', '0002_remove_content_type_name', '2025-11-22 04:16:40.642942'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-11-22 04:16:40.734926'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-11-22 04:16:40.762691'),
(10, 'auth', '0004_alter_user_username_opts', '2025-11-22 04:16:40.770829'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-11-22 04:16:40.846651'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-11-22 04:16:40.850864'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-11-22 04:16:40.862508'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-11-22 04:16:40.875930'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-11-22 04:16:40.904863'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-11-22 04:16:40.920580'),
(17, 'auth', '0011_update_proxy_permissions', '2025-11-22 04:16:40.939347'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-11-22 04:16:40.966912'),
(19, 'sessions', '0001_initial', '2025-11-22 04:16:41.002037'),
(20, 'api', '0002_equipoinfo_valor_compra', '2025-11-22 23:12:07.324681');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api_equipoinfo`
--
ALTER TABLE `api_equipoinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api_equipoinfo`
--
ALTER TABLE `api_equipoinfo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
