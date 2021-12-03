-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 21:34:08
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `daewoo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destacados`
--

CREATE TABLE `destacados` (
  `id_destacado` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `alt` varchar(127) DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `detalle_principal` text NOT NULL,
  `imagenBanner` varchar(255) NOT NULL,
  `detalle_secundario` text DEFAULT NULL,
  `iframe` varchar(255) NOT NULL,
  `fecha_publicacion` datetime DEFAULT current_timestamp(),
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(10) UNSIGNED NOT NULL,
  `marca` varchar(120) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `alt` varchar(127) DEFAULT NULL,
  `imagenBanner` varchar(255) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `detalle_principal` text NOT NULL,
  `detalle_secundario` text DEFAULT NULL,
  `precio` varchar(60) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_marca` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_prod`
--

CREATE TABLE `prueba_prod` (
  `titulo` varchar(100) NOT NULL,
  `detalle_principal` varchar(100) NOT NULL,
  `precio` int(10) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prueba_prod`
--

INSERT INTO `prueba_prod` (`titulo`, `detalle_principal`, `precio`, `fecha_publicacion`, `id`, `id_usuario`) VALUES
('123', 'asd', 123, '2021-12-01 01:00:49', 25, 0),
('producto pedro', 'hola', 500, '2021-12-02 05:01:49', 27, 27),
('aqsd', '123', 123, '2021-12-02 05:33:35', 29, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('4Id3DiSAy-e_cW8G5uPxZv4KMglbR9tE', 1638493386, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":18}}'),
('K18cLzgvFNcUWP8Cmh29imgYd4Wgn1YS', 1638509622, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('dUAcrHjLiEyzd-xkJHvm4aOaJ6rMi4o0', 1638563384, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":26}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`) VALUES
(1, 'Juan', 'Sanchez', 'hola.jmdg@gmail.com', 'JuanMa123'),
(9, 'asd', '', 'asd@gmail.com', '$2a$10$qGDA8phs8fXT7oXLYg4SgumfB8X.XhKSUzKRhWGfrbM1YNCYtDIsm'),
(10, 'prueba', '', 'hola.jmdddg@gmail.com', '$2a$10$fVBeWXT9limP6prZS5zBE.ffQulFZ8N3bNt6XQsZigQ5RrLQqikXK'),
(11, 'prueba', '', 'hola.jmdddg@gmail.com', '$2a$10$rVt0hr77xdfcn8iHZzKaBOplJtnDSvm/pd4Ct9OujxuoP5ml/jmsi'),
(12, 'prueba', '', 'hola.jmdddg@gmail.com', '$2a$10$8/NIQGKVJk1x/HkzIsMRWujpUdpF3EOl1spEIo812vb5PD1jA/fiC'),
(13, 'prueba', '', 'hola.1@gmail.com', '$2a$10$9M654p35GBW7BrAyERtgo.c6tNoewAgyuL.Prp5sJnMV5Q7zCp7Iq'),
(14, 'prueba', '', 'hola.1@gmail.com', '$2a$10$4u198YEnI/VshD/gw8snKOG1TSnaDYTn977ktfAtdount95gDl0cO'),
(15, 'Juan', '', 'hola.jmdg@gmail.com', '$2a$10$9yfl8MRyKuH2AXJDQsPgJu/YmxoWa0YUqExwc1SxlwGUXnegKtvwa'),
(16, 'juanmanuel', '', 'hola.gm@gmail.com', '$2a$10$GxwUwDeiHHDBcRCO5PNFouCvO6AgaPUJmSgG5/fIYQKGL9IRuo04G'),
(17, 'juance', '', 'asdasdads@gmail.com', '$2a$10$9huhJP8kNWZgrxoUnbc05O2QHr3N3/14zmSTXTRA8ZuoZ1Y9oPhDq'),
(18, 'prueba', '', 'prueba@gmail.com', '$2a$10$tF9R1SlxwOFiAYzku6Dmr.aWLZIhpv8AYRHM2p6WbPr04RqAxb4Ma'),
(19, 'juanmaa', '', 'juanma123', '$2a$10$7Vty3CWTB7bJgV7uoXJ/E.HR3yjyQfuPy/c0JOR3PGm6VdIQYHJ8S'),
(20, 'juan1', '', 'asdasd', '$2a$10$P2r2bQfhE01ma6PB6Ayw5OJ0Yj2gmMrpFqHEu90QGXwnR1CYtg0om'),
(21, 'juan1', '', 'asdasd', '$2a$10$gvrVufe4Kxo8JwjD/S9dNOQ827p4Hv8CEqELpdF7Cv0/5aY7BCkM2'),
(22, '', '', 'holis', '$2a$10$ABoDx0Ka/v6vtkyDWE5Qa.aCD.VUL7PMO.H98fS1WtXlwO0N781n6'),
(23, 'hola2', '', 'hola', '$2a$10$NOxabLQoVlRI/C2/fWQHOeD2IYOBAQPeuMEry8lSIOrLeIgbAxwAe'),
(24, 'holu', '', 'holu@gmail.com', '$2a$10$KBOWzL0IsH5U/G1qjn39hODbBAPr.UyO0wc7lh83NRtbI9rlStwpu'),
(25, 'asd1', '', '', '$2a$10$yvB2lEJWcnFwK5ArJRKShuTox4EDmm/QoiPBfaw3cu8M87ZUzMpIa'),
(26, 'final', '', '', '$2a$10$kq0qutZ.VOI2Xtl/YF.PcOEu6Z0S1W77Ynmr2r/qpDquiFiNaPnhq'),
(27, 'PEDRO', '', 'chupa@gmail.com', '$2a$10$1dryqo5xzOSaWVebsvB.d.H5YtrK.AI6kzKYE99i8b9Lu5CxMK55e'),
(28, 'caro', '', 'caro@gmail.com', '$2a$10$a5zKUv1rPQv0odDARnPQoOtKhvR.ui6llOxPZ8KshcAytSzx.8GLe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destacados`
--
ALTER TABLE `destacados`
  ADD PRIMARY KEY (`id_destacado`),
  ADD KEY `fk_destacados_usuarios1_idx` (`id_usuario`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_productos_usuarios_idx` (`id_usuario`),
  ADD KEY `fk_productos_marcas1_idx` (`id_marca`);

--
-- Indices de la tabla `prueba_prod`
--
ALTER TABLE `prueba_prod`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destacados`
--
ALTER TABLE `destacados`
  MODIFY `id_destacado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `prueba_prod`
--
ALTER TABLE `prueba_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `destacados`
--
ALTER TABLE `destacados`
  ADD CONSTRAINT `fk_destacados_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_marcas1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
