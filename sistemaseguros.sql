-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2026 a las 06:29:45
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
-- Base de datos: `sistemaseguros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`) VALUES
(1, 'Karem', 'Martinez', 'karem@gmail.com', '3001234567'),
(2, 'Juan', 'Perez', 'juan@gmail.com', '3112223344');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobertura`
--

CREATE TABLE `cobertura` (
  `id_cobertura` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cobertura`
--

INSERT INTO `cobertura` (`id_cobertura`, `nombre`, `descripcion`) VALUES
(1, 'Vehiculo', 'Proteccion total para vehiculos'),
(2, 'Vida', 'Seguro de vida familiar'),
(3, 'Hogar', 'Proteccion contra incendios y robos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_poliza` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'PAGADO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_poliza`, `monto`, `fecha_pago`, `metodo_pago`, `estado`) VALUES
(1, 1, 500000.00, '2026-03-01', 'Tarjeta', 'PAGADO'),
(2, 2, 350000.00, '2026-03-05', 'Transferencia', 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poliza`
--

CREATE TABLE `poliza` (
  `id_poliza` int(11) NOT NULL,
  `numero_poliza` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(20) DEFAULT 'ACTIVA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `poliza`
--

INSERT INTO `poliza` (`id_poliza`, `numero_poliza`, `id_cliente`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 'POL-2026-001', 1, '2026-01-01', '2026-12-31', 'ACTIVA'),
(2, 'POL-2026-002', 2, '2026-02-01', '2026-11-30', 'ACTIVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poliza_cobertura`
--

CREATE TABLE `poliza_cobertura` (
  `id_poliza` int(11) NOT NULL,
  `id_cobertura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `poliza_cobertura`
--

INSERT INTO `poliza_cobertura` (`id_poliza`, `id_cobertura`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siniestro`
--

CREATE TABLE `siniestro` (
  `id_siniestro` int(11) NOT NULL,
  `id_poliza` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_siniestro` date NOT NULL,
  `estado` varchar(20) DEFAULT 'PENDIENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `siniestro`
--

INSERT INTO `siniestro` (`id_siniestro`, `id_poliza`, `descripcion`, `fecha_siniestro`, `estado`) VALUES
(1, 1, 'Choque menor en via principal', '2026-04-15', 'PENDIENTE'),
(2, 2, 'Daño por incendio', '2026-05-10', 'APROBADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  ADD PRIMARY KEY (`id_cobertura`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_poliza` (`id_poliza`);

--
-- Indices de la tabla `poliza`
--
ALTER TABLE `poliza`
  ADD PRIMARY KEY (`id_poliza`),
  ADD UNIQUE KEY `numero_poliza` (`numero_poliza`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `poliza_cobertura`
--
ALTER TABLE `poliza_cobertura`
  ADD PRIMARY KEY (`id_poliza`,`id_cobertura`),
  ADD KEY `id_cobertura` (`id_cobertura`);

--
-- Indices de la tabla `siniestro`
--
ALTER TABLE `siniestro`
  ADD PRIMARY KEY (`id_siniestro`),
  ADD KEY `id_poliza` (`id_poliza`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id_cobertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `poliza`
--
ALTER TABLE `poliza`
  MODIFY `id_poliza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `siniestro`
--
ALTER TABLE `siniestro`
  MODIFY `id_siniestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_poliza`) REFERENCES `poliza` (`id_poliza`);

--
-- Filtros para la tabla `poliza`
--
ALTER TABLE `poliza`
  ADD CONSTRAINT `poliza_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `poliza_cobertura`
--
ALTER TABLE `poliza_cobertura`
  ADD CONSTRAINT `poliza_cobertura_ibfk_1` FOREIGN KEY (`id_poliza`) REFERENCES `poliza` (`id_poliza`),
  ADD CONSTRAINT `poliza_cobertura_ibfk_2` FOREIGN KEY (`id_cobertura`) REFERENCES `cobertura` (`id_cobertura`);

--
-- Filtros para la tabla `siniestro`
--
ALTER TABLE `siniestro`
  ADD CONSTRAINT `siniestro_ibfk_1` FOREIGN KEY (`id_poliza`) REFERENCES `poliza` (`id_poliza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
