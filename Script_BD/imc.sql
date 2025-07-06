-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2025 a las 19:42:51
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
-- Base de datos: `imc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `cedula` varchar(20) NOT NULL,
  `fecha_reg` date NOT NULL,
  `peso` double(11,3) NOT NULL,
  `estatura` double(11,3) NOT NULL,
  `edad` int(11) NOT NULL,
  `imc` double(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `salud`
--

INSERT INTO `salud` (`cedula`, `fecha_reg`, `peso`, `estatura`, `edad`, `imc`) VALUES
('10000040', '2025-05-28', 79.000, 1.760, 35, 25.508),
('10000039', '2025-05-29', 66.000, 1.680, 32, 23.377),
('10000038', '2025-05-30', 68.000, 1.700, 30, 23.529),
('10000037', '2025-05-31', 65.000, 1.660, 60, 23.592),
('10000036', '2025-06-01', 63.000, 1.650, 59, 23.140),
('10000035', '2025-06-02', 70.000, 1.740, 58, 23.097),
('10000034', '2025-06-03', 82.000, 1.810, 57, 25.001),
('10000033', '2025-06-04', 84.000, 1.830, 56, 25.079),
('10000032', '2025-06-05', 76.000, 1.800, 55, 23.457),
('10000031', '2025-06-06', 73.000, 1.770, 54, 23.275),
('10000030', '2025-06-07', 81.000, 1.820, 53, 24.436),
('10000029', '2025-06-08', 77.000, 1.790, 52, 24.031),
('10000028', '2025-06-09', 69.000, 1.730, 51, 23.049),
('10000027', '2025-06-10', 61.000, 1.610, 50, 23.529),
('10000026', '2025-06-11', 59.000, 1.580, 49, 23.648),
('10000025', '2025-06-12', 64.000, 1.600, 48, 25.000),
('10000024', '2025-06-13', 88.000, 1.850, 47, 25.708),
('10000023', '2025-06-14', 90.000, 1.880, 46, 25.464),
('10000022', '2025-06-15', 74.000, 1.750, 45, 24.163),
('10000021', '2025-06-16', 67.000, 1.690, 44, 23.459),
('10000020', '2025-06-17', 83.000, 1.800, 43, 25.617),
('10000019', '2025-06-18', 79.000, 1.780, 42, 24.939),
('10000018', '2025-06-19', 71.000, 1.720, 41, 23.994),
('10000017', '2025-06-20', 69.000, 1.700, 40, 23.877),
('10000016', '2025-06-21', 80.000, 1.750, 20, 26.122),
('10000015', '2025-06-22', 62.000, 1.650, 21, 22.775),
('10000014', '2025-06-23', 58.000, 1.600, 22, 22.656),
('10000013', '2025-06-24', 78.000, 1.850, 23, 22.789),
('10000012', '2025-06-25', 66.000, 1.650, 24, 24.242),
('10000011', '2025-06-26', 75.000, 1.800, 25, 23.148),
('10000010', '2025-06-27', 85.000, 1.820, 26, 25.679),
('10000009', '2025-06-28', 65.000, 1.680, 27, 23.030),
('10000008', '2025-06-29', 77.000, 1.760, 28, 24.857),
('10000007', '2025-06-30', 72.000, 1.780, 29, 22.724),
('10000006', '2025-07-01', 68.000, 1.700, 30, 23.529),
('10000005', '2025-07-02', 90.000, 1.850, 31, 26.296),
('10000004', '2025-07-03', 55.000, 1.600, 32, 21.484),
('10000003', '2025-07-04', 60.000, 1.650, 33, 22.038),
('10000002', '2025-07-05', 80.000, 1.800, 34, 24.691),
('10000001', '2025-07-06', 70.000, 1.750, 35, 22.857);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `nacionalidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `apellidos`, `fecha_nac`, `nacionalidad`) VALUES
('10000001', 'Usuario1', 'Apellido1', '1990-01-01', 'Colombiana'),
('10000002', 'Usuario2', 'Apellido2', '1991-02-02', 'Mexicana'),
('10000003', 'Usuario3', 'Apellido3', '1992-03-03', 'Colombiana'),
('10000004', 'Usuario4', 'Apellido4', '1993-04-04', 'Mexicana'),
('10000005', 'Usuario5', 'Apellido5', '1994-05-05', 'Colombiana'),
('10000006', 'Usuario6', 'Apellido6', '1995-06-06', 'Mexicana'),
('10000007', 'Usuario7', 'Apellido7', '1996-07-07', 'Colombiana'),
('10000008', 'Usuario8', 'Apellido8', '1997-08-08', 'Mexicana'),
('10000009', 'Usuario9', 'Apellido9', '1998-09-09', 'Colombiana'),
('10000010', 'Usuario10', 'Apellido10', '1999-10-10', 'Mexicana'),
('10000011', 'Usuario11', 'Apellido11', '1990-11-11', 'Colombiana'),
('10000012', 'Usuario12', 'Apellido12', '1991-12-12', 'Mexicana'),
('10000013', 'Usuario13', 'Apellido13', '1992-01-13', 'Colombiana'),
('10000014', 'Usuario14', 'Apellido14', '1993-02-14', 'Mexicana'),
('10000015', 'Usuario15', 'Apellido15', '1994-03-15', 'Colombiana'),
('10000016', 'Usuario16', 'Apellido16', '1995-04-16', 'Mexicana'),
('10000017', 'Usuario17', 'Apellido17', '1996-05-17', 'Colombiana'),
('10000018', 'Usuario18', 'Apellido18', '1997-06-18', 'Mexicana'),
('10000019', 'Usuario19', 'Apellido19', '1998-07-19', 'Colombiana'),
('10000020', 'Usuario20', 'Apellido20', '1999-08-20', 'Mexicana'),
('10000021', 'Usuario21', 'Apellido21', '1990-09-21', 'Colombiana'),
('10000022', 'Usuario22', 'Apellido22', '1991-10-22', 'Mexicana'),
('10000023', 'Usuario23', 'Apellido23', '1992-11-23', 'Colombiana'),
('10000024', 'Usuario24', 'Apellido24', '1993-12-24', 'Mexicana'),
('10000025', 'Usuario25', 'Apellido25', '1994-01-25', 'Colombiana'),
('10000026', 'Usuario26', 'Apellido26', '1995-02-26', 'Mexicana'),
('10000027', 'Usuario27', 'Apellido27', '1996-03-27', 'Colombiana'),
('10000028', 'Usuario28', 'Apellido28', '1997-04-28', 'Mexicana'),
('10000029', 'Usuario29', 'Apellido29', '1998-05-29', 'Colombiana'),
('10000030', 'Usuario30', 'Apellido30', '1999-06-30', 'Mexicana'),
('10000031', 'Usuario31', 'Apellido31', '1990-07-31', 'Colombiana'),
('10000032', 'Usuario32', 'Apellido32', '1991-08-01', 'Mexicana'),
('10000033', 'Usuario33', 'Apellido33', '1992-09-02', 'Colombiana'),
('10000034', 'Usuario34', 'Apellido34', '1993-10-03', 'Mexicana'),
('10000035', 'Usuario35', 'Apellido35', '1994-11-04', 'Colombiana'),
('10000036', 'Usuario36', 'Apellido36', '1995-12-05', 'Mexicana'),
('10000037', 'Usuario37', 'Apellido37', '1996-01-06', 'Colombiana'),
('10000038', 'Usuario38', 'Apellido38', '1997-02-07', 'Mexicana'),
('10000039', 'Usuario39', 'Apellido39', '1998-03-08', 'Colombiana'),
('10000040', 'Usuario40', 'Apellido40', '1999-04-09', 'Mexicana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`fecha_reg`,`cedula`),
  ADD KEY `fk_cedula_usuario` (`cedula`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `salud`
--
ALTER TABLE `salud`
  ADD CONSTRAINT `fk_cedula_usuario` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
