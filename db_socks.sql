-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 02:52:25
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_socks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `name`) VALUES
(1, 'Elemento'),
(2, 'Adidas'),
(3, 'Pirulo'),
(4, 'Floyd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sock`
--

CREATE TABLE `sock` (
  `id_sock` int(250) NOT NULL,
  `model` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `size` int(10) NOT NULL,
  `price` int(50) NOT NULL,
  `id_brand` int(250) NOT NULL,
  `sale` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sock`
--

INSERT INTO `sock` (`id_sock`, `model`, `color`, `size`, `price`, `id_brand`, `sale`) VALUES
(1, 'rombos', 'azul', 1, 600, 1, 'no'),
(2, 'alien', 'negro', 2, 600, 1, 'si'),
(3, 'flores', 'amarillo', 3, 700, 2, 'no'),
(4, 'Floyd', 'rojo', 2, 500, 1, 'no'),
(5, 'flores', 'naranja', 1, 700, 3, 'si'),
(6, 'bananas', 'azul', 2, 500, 3, 'no'),
(7, 'flores', 'celeste', 2, 500, 4, 'si'),
(8, 'rombos', 'verde', 2, 500, 4, 'no'),
(9, 'futbol', 'azul', 3, 600, 2, 'si'),
(10, 'perritos', 'azul', 1, 700, 4, 'si'),
(11, 'rombos', 'negro', 3, 250, 3, 'no'),
(12, 'perritos', 'verde', 2, 370, 3, 'si'),
(13, 'nuevo', 'gris', 1, 321, 2, 'no'),
(14, 'argentina', 'blanco', 1, 100, 2, 'si'),
(15, 'argentina', 'celeste', 3, 100, 2, 'si'),
(16, 'gatos', 'verde', 1, 200, 4, 'no'),
(17, 'mundial22', 'verde', 1, 150, 4, 'no'),
(18, 'mundial22', 'azul', 3, 150, 4, 'no'),
(20, 'prueba', 'azul', 3, 150, 3, 'si'),
(23, 'gatos', 'negro', 1, 700, 4, 'si'),
(24, 'mundial', 'blanco', 3, 220, 3, 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `name`, `password`) VALUES
(1, 'soledad', '$2y$10$JLJtm16hqhT9cQwnhH2GiOBNg7JwLXndyUIkeuu5k4/Zy9L5i8.yu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `sock`
--
ALTER TABLE `sock`
  ADD PRIMARY KEY (`id_sock`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sock`
--
ALTER TABLE `sock`
  MODIFY `id_sock` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sock`
--
ALTER TABLE `sock`
  ADD CONSTRAINT `sock_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
