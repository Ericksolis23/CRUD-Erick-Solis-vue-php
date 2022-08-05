-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2022 a las 06:53:19
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crudvuejs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(30) NOT NULL,
  `Nombre` varchar(300) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Descripcion` varchar(300) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fecha_ingreso` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fecha_vencimiento` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingrediente`, `Nombre`, `Descripcion`, `Fecha_ingreso`, `Fecha_vencimiento`) VALUES
(1, 'Chocolate', 'Chocolate 100% natural', '15/01/2022', '20/01/2023'),
(2, 'Crema', 'Natural ', '10/02/2022', '10/03/2022'),
(3, 'Fresas', 'Deliciosas ', '10/03/2022', '15/03/2022'),
(4, 'Zanahoria', 'Deliciosa y nutritiva ', '10/02/2022', '20/02/2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastel`
--

CREATE TABLE `pastel` (
  `id_pastel` int(30) NOT NULL,
  `Nombre` varchar(300) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Descripcion` varchar(300) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Preparado_por` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fecha_creacion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Fecha_vencimiento` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pastel`
--

INSERT INTO `pastel` (`id_pastel`, `Nombre`, `Descripcion`, `Preparado_por`, `Fecha_creacion`, `Fecha_vencimiento`) VALUES
(1, 'Chocolate ', 'Delicioso pastel ', 'Patsy ', '10/03/2022', '20/03/2022'),
(2, 'Fresas Con Chocolate', 'Delicioso pastel elaborado con productos de alta calidad', 'Patsy ', '12/04/2022', '25/04/2022'),
(3, 'Chocolate Con Menta', 'Exquisito ', 'Holandesa ', '15/05/2022', '25/05/2022'),
(4, 'Zanahoria ', 'Saludable ', 'Patsy ', '15/03/2022', '28/03/2022'),
(5, 'Fresas Con Crema', 'Delicioso', 'Anfora', '10/06/2022', '20/06/2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastel_ingredientes`
--

CREATE TABLE `pastel_ingredientes` (
  `id_pastel_ingredientes` int(30) NOT NULL,
  `id_pastel` int(30) NOT NULL,
  `id_ingrediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pastel`
--
ALTER TABLE `pastel`
  ADD PRIMARY KEY (`id_pastel`);

--
-- Indices de la tabla `pastel_ingredientes`
--
ALTER TABLE `pastel_ingredientes`
  ADD PRIMARY KEY (`id_pastel_ingredientes`,`id_pastel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
