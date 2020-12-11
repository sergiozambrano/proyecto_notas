-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2020 a las 01:48:53
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_notas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `nombre_area` varchar(45) NOT NULL,
  `estado_are` tinyint(4) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `nombre_asig` varchar(45) NOT NULL,
  `estado_asig` tinyint(4) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asig_curso`
--

CREATE TABLE `asig_curso` (
  `id_asig_curso` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_jornada` int(11) NOT NULL,
  `num_curso` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_usuario`
--

CREATE TABLE `curso_usuario` (
  `id_curso_usuario` int(11) NOT NULL,
  `id_usu_doc` int(11) NOT NULL COMMENT 'identificador de usuario con rol docente',
  `id_usu_est` int(11) NOT NULL COMMENT 'identificador de usuario con rol estudiante',
  `id_curso` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `num_grado` int(11) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id_jornada` int(11) NOT NULL,
  `nombre_jor` varchar(45) NOT NULL,
  `estado_jor` tinyint(1) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_sis_eva` int(11) NOT NULL COMMENT 'identificador del sistema de evaluacion',
  `id_usu_est` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `observacion` mediumtext NOT NULL,
  `nota` varchar(45) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fechac_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `num_periodo` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre_per` varchar(45) NOT NULL,
  `apellido_per` varchar(45) NOT NULL,
  `tipo_doc_per` varchar(45) NOT NULL,
  `num_doc_per` varchar(10) NOT NULL,
  `num_cel_per` varchar(12) NOT NULL,
  `corre_per` varchar(50) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_per`, `apellido_per`, `tipo_doc_per`, `num_doc_per`, `num_cel_per`, `corre_per`, `id_usuario_creacion`, `fecha_creacion`) VALUES
(1, 'Sergio Andrés', 'Zambrano Morales', 'Cédula de Ciudadanía', '1234567890', '3158843018', 'sergio@gmail.com', 0, '2020-12-09 01:07:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_eva`
--

CREATE TABLE `sistema_eva` (
  `id_sistema_eva` int(11) NOT NULL,
  `nombre_sis_eva` varchar(45) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sis_eva_usu`
--

CREATE TABLE `sis_eva_usu` (
  `id_sis_eva_usu` int(11) NOT NULL,
  `id_sis_eva` int(11) NOT NULL,
  `id_usu_doc` int(11) NOT NULL,
  `porcentaje` varchar(3) NOT NULL,
  `id_usuario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `rol_usu` enum('Administrador','Docente') NOT NULL,
  `pass_usu` varchar(255) NOT NULL,
  `estado_usu` tinyint(1) NOT NULL,
  `id_usario_creacion` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_persona`, `rol_usu`, `pass_usu`, `estado_usu`, `id_usario_creacion`, `fecha_creacion`) VALUES
(1, 1, 'Administrador', '$2y$10$gSZf9nVek/NRU99Q6pC9/uOK.PAUHpKKkRgWNddWeitP3L/192KBe', 0, 0, '2020-12-09 01:55:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `fk_asignatura_are` (`id_area`);

--
-- Indices de la tabla `asig_curso`
--
ALTER TABLE `asig_curso`
  ADD PRIMARY KEY (`id_asig_curso`),
  ADD KEY `fk_asig_curso_asignatura` (`id_asignatura`),
  ADD KEY `fk_asig_curso_curso` (`id_curso`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_curso_jornada` (`id_jornada`),
  ADD KEY `fk_curso_grado` (`id_grado`);

--
-- Indices de la tabla `curso_usuario`
--
ALTER TABLE `curso_usuario`
  ADD PRIMARY KEY (`id_curso_usuario`),
  ADD KEY `fk_curso_usuario_usuario_doc` (`id_usu_doc`),
  ADD KEY `fk_curso_usuario_usuario_est` (`id_usu_est`),
  ADD KEY `fk_curso_usuario_curso` (`id_curso`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_periodo` (`id_periodo`),
  ADD KEY `fk_nota_asi_eva` (`id_sis_eva`),
  ADD KEY `fk_nota_usu_est` (`id_usu_est`),
  ADD KEY `fk_nota_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `sistema_eva`
--
ALTER TABLE `sistema_eva`
  ADD PRIMARY KEY (`id_sistema_eva`);

--
-- Indices de la tabla `sis_eva_usu`
--
ALTER TABLE `sis_eva_usu`
  ADD PRIMARY KEY (`id_sis_eva_usu`),
  ADD KEY `fk_sisEva_usuario_doc` (`id_usu_doc`),
  ADD KEY `fk_sis_eva_sistema` (`id_sis_eva`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_persona` (`id_persona`),
  ADD KEY `fk_usuario_rol` (`rol_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asig_curso`
--
ALTER TABLE `asig_curso`
  MODIFY `id_asig_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_usuario`
--
ALTER TABLE `curso_usuario`
  MODIFY `id_curso_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `id_jornada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sistema_eva`
--
ALTER TABLE `sistema_eva`
  MODIFY `id_sistema_eva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sis_eva_usu`
--
ALTER TABLE `sis_eva_usu`
  MODIFY `id_sis_eva_usu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `fk_asignatura_are` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asig_curso`
--
ALTER TABLE `asig_curso`
  ADD CONSTRAINT `fk_asig_curso_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_asig_curso_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso_jornada` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso_usuario`
--
ALTER TABLE `curso_usuario`
  ADD CONSTRAINT `fk_curso_usuario_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso_usuario_usuario_doc` FOREIGN KEY (`id_usu_doc`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso_usuario_usuario_est` FOREIGN KEY (`id_usu_est`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_asi_eva` FOREIGN KEY (`id_sis_eva`) REFERENCES `sistema_eva` (`id_sistema_eva`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_usu_est` FOREIGN KEY (`id_usu_est`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sis_eva_usu`
--
ALTER TABLE `sis_eva_usu`
  ADD CONSTRAINT `fk_sisEva_usuario_doc` FOREIGN KEY (`id_usu_doc`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sis_eva_sistema` FOREIGN KEY (`id_sis_eva`) REFERENCES `sistema_eva` (`id_sistema_eva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
