-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2025 a las 23:34:00
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
-- Base de datos: `laboratoriodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_laboratorist`
--

CREATE TABLE `api_laboratorist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `cod_int` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `api_laboratorist`
--

INSERT INTO `api_laboratorist` (`id`, `name`, `lastname`, `cod_int`, `titulo`, `telefono`) VALUES
(1, 'Maria', 'del Barrio', '1245ss', 'Biologo', '10245000'),
(2, 'Ana', 'Torres', 'LAB001', 'Bacteriólogo', '3005671234'),
(3, 'Julián', 'Velásquez', 'LAB002', 'Microbiólogo', '3016782345'),
(4, 'Camila', 'Cifuentes', 'LAB003', 'Biólogo', '3107893456'),
(5, 'Esteban', 'Mora', 'LAB004', 'Bacteriólogo', '3128904567'),
(6, 'Daniela', 'García', 'LAB005', 'Bacteriólogo', '3149015678'),
(7, 'Mauricio', 'Rincón', 'LAB006', 'Microbiólogo', '3150126789'),
(8, 'Sara', 'Jiménez', 'LAB007', 'Biólogo', '3161237890'),
(9, 'Juan', 'Castaño', 'LAB008', 'Bacteriólogo', '3172348901'),
(10, 'Laura', 'Naranjo', 'LAB009', 'Microbiólogo', '3183459012'),
(11, 'Carlos', 'Mejía', 'LAB010', 'Bacteriólogo', '3194560123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_labresults`
--

CREATE TABLE `api_labresults` (
  `id` bigint(20) NOT NULL,
  `col_tot` varchar(100) NOT NULL,
  `col_hdl` varchar(100) NOT NULL,
  `col_ldl` varchar(100) NOT NULL,
  `trig` varchar(100) NOT NULL,
  `cod_ing_r` varchar(100) NOT NULL,
  `cedula` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `api_labresults`
--

INSERT INTO `api_labresults` (`id`, `col_tot`, `col_hdl`, `col_ldl`, `trig`, `cod_ing_r`, `cedula`) VALUES
(1, 'malo', 'bueno', 'menos', 'negativo', '1', '1'),
(2, '190', '50', '110', '150', 'ING001', '1023456789'),
(3, '200', '55', '120', '160', 'ING001-B', '1023456789'),
(4, '205', '45', '130', '170', 'ING002', '1034567890'),
(5, '180', '55', '100', '120', 'ING003', '1045678901'),
(6, '250', '35', '160', '220', 'ING004', '1056789012'),
(7, '245', '37', '155', '210', 'ING004-B', '1056789012'),
(8, '175', '60', '90', '100', 'ING005', '1067890123'),
(9, '210', '48', '130', '160', 'ING006', '1078901234'),
(10, '195', '52', '115', '140', 'ING007', '1089012345'),
(11, '205', '54', '118', '135', 'ING007-B', '1089012345'),
(12, '220', '40', '145', '200', 'ING008', '1090123456'),
(13, '165', '65', '80', '90', 'ING009', '1101234567'),
(14, '230', '38', '150', '210', 'ING010', '1112345678'),
(15, '240', '42', '155', '205', 'ING010-B', '1112345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_patient`
--

CREATE TABLE `api_patient` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `documento` int(10) UNSIGNED NOT NULL CHECK (`documento` >= 0),
  `cod_ing` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `api_patient`
--

INSERT INTO `api_patient` (`id`, `name`, `lastname`, `documento`, `cod_ing`, `direccion`, `telefono`) VALUES
(1, 'Marianito', 'Fulanito', 1520354, '5412segeg', 'aaaaaaaaaaaaa', '11111111'),
(2, 'Salchi', 'Lindrina 1', 5463111, 'a1as22s', '2s13s5s4', '55555555'),
(4, 'Laura', 'Gómez', 1023456789, 'ING001', 'Cra 45 #12-56', '3004567890'),
(5, 'Carlos', 'Pérez', 1034567890, 'ING002', 'Cl 10 #8-20', '3112345678'),
(6, 'Andrés', 'Ramírez', 1045678901, 'ING003', 'Av 30 #22-11', '3129876543'),
(7, 'Sofía', 'Martínez', 1056789012, 'ING004', 'Cl 60 #5-33', '3019988776'),
(8, 'Diego', 'Castaño', 1067890123, 'ING005', 'Cra 20 #9-15', '3051234567'),
(9, 'Isabella', 'Morales', 1078901234, 'ING006', 'Cl 33 #44-77', '3145678901'),
(10, 'Juan', 'López', 1089012345, 'ING007', 'Av 80 #14-20', '3122233445'),
(11, 'Valentina', 'Rojas', 1090123456, 'ING008', 'Cra 15 #45-19', '3204455667'),
(12, 'Mariana', 'Restrepo', 1101234567, 'ING009', 'Cl 5 #30-60', '3103344556'),
(13, 'Felipe', 'Ospina', 1112345678, 'ING010', 'Cra 40 #90-10', '3001122334');

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
(25, 'Can add laboratorist', 7, 'add_laboratorist'),
(26, 'Can change laboratorist', 7, 'change_laboratorist'),
(27, 'Can delete laboratorist', 7, 'delete_laboratorist'),
(28, 'Can view laboratorist', 7, 'view_laboratorist'),
(29, 'Can add lab results', 8, 'add_labresults'),
(30, 'Can change lab results', 8, 'change_labresults'),
(31, 'Can delete lab results', 8, 'delete_labresults'),
(32, 'Can view lab results', 8, 'view_labresults'),
(33, 'Can add patient', 9, 'add_patient'),
(34, 'Can change patient', 9, 'change_patient'),
(35, 'Can delete patient', 9, 'delete_patient'),
(36, 'Can view patient', 9, 'view_patient');

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
(7, 'api', 'laboratorist'),
(8, 'api', 'labresults'),
(9, 'api', 'patient'),
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
(1, 'contenttypes', '0001_initial', '2025-10-25 23:27:45.960152'),
(2, 'auth', '0001_initial', '2025-10-25 23:27:46.437823'),
(3, 'admin', '0001_initial', '2025-10-25 23:27:46.560225'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-25 23:27:46.577034'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-25 23:27:46.589242'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-25 23:27:46.663630'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-25 23:27:46.706489'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-25 23:27:46.720543'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-25 23:27:46.728761'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-25 23:27:46.776683'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-25 23:27:46.792387'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-25 23:27:46.803512'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-25 23:27:46.818015'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-25 23:27:46.834572'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-25 23:27:46.852119'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-25 23:27:46.861330'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-25 23:27:46.877024'),
(18, 'sessions', '0001_initial', '2025-10-25 23:27:46.912463'),
(19, 'api', '0001_initial', '2025-10-25 23:29:36.428370'),
(20, 'api', '0002_labresults_cod_ing_r', '2025-11-02 17:16:54.051192'),
(21, 'api', '0003_labresults_cedula', '2025-11-02 17:24:40.511279');

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
-- Indices de la tabla `api_laboratorist`
--
ALTER TABLE `api_laboratorist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_labresults`
--
ALTER TABLE `api_labresults`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_patient`
--
ALTER TABLE `api_patient`
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
-- AUTO_INCREMENT de la tabla `api_laboratorist`
--
ALTER TABLE `api_laboratorist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `api_labresults`
--
ALTER TABLE `api_labresults`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `api_patient`
--
ALTER TABLE `api_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
