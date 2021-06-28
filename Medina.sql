-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-02-2021 a las 19:14:40
-- Versión del servidor: 10.3.27-MariaDB-cll-lve
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bpfsmx_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_categoria`
--

CREATE TABLE `bas_categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bas_categoria`
--

INSERT INTO `bas_categoria` (`id_categoria`, `descripcion`, `estatus`) VALUES
(1, 'Laminas', 'Disponible'),
(2, 'LETRAS 3D', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_direcion`
--

CREATE TABLE `bas_direcion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `num_ext` varchar(5) DEFAULT NULL,
  `num_int` varchar(5) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `cp` varchar(6) DEFAULT NULL,
  `municipio` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `referencia` text DEFAULT NULL,
  `estatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_empresa`
--

CREATE TABLE `bas_empresa` (
  `id_bas_empresa` int(11) NOT NULL,
  `nombre_corto` varchar(50) DEFAULT NULL,
  `empresa` varchar(150) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `tel_fijo` varchar(15) DEFAULT NULL,
  `tel_movil` varchar(15) DEFAULT NULL,
  `tipo_persona` varchar(15) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `id_bas_direccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bas_empresa`
--

INSERT INTO `bas_empresa` (`id_bas_empresa`, `nombre_corto`, `empresa`, `mail`, `tel_fijo`, `tel_movil`, `tipo_persona`, `estatus`, `id_bas_direccion`) VALUES
(3, 'NUEVA', 'NUEVA', 'NUEVA@GMAIL.COM', '4578', '7895', 'Física', 'Activo', 0),
(4, '', '', '', '', '', 'Moral', 'Activo', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_metas`
--

CREATE TABLE `bas_metas` (
  `id_meta` int(11) NOT NULL,
  `meta` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_permisos`
--

CREATE TABLE `bas_permisos` (
  `id_bas_permisos` int(11) NOT NULL,
  `permiso` varchar(50) DEFAULT NULL,
  `creacion` date DEFAULT NULL,
  `expiracion` date DEFAULT NULL,
  `id_bas_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_regalo`
--

CREATE TABLE `bas_regalo` (
  `id_regalo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `condiciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_unidad_medida`
--

CREATE TABLE `bas_unidad_medida` (
  `id_unidad_medidia` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bas_unidad_medida`
--

INSERT INTO `bas_unidad_medida` (`id_unidad_medidia`, `descripcion`, `estatus`) VALUES
(1, 'Metros cuadrados', 'Disponible'),
(2, 'METROS', 'Activo'),
(3, 'CM', 'Activo'),
(4, 'METRO LINEAL', 'Activo'),
(5, 'PIEZAS', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bas_usuario`
--

CREATE TABLE `bas_usuario` (
  `id_bas_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ape_paterno` varchar(50) DEFAULT NULL,
  `ape_materno` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `tel_fijo` varchar(15) DEFAULT NULL,
  `tel_movil` varchar(15) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_bas_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_cliente`
--

CREATE TABLE `cli_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_corto` varchar(100) DEFAULT NULL,
  `empresa` text DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `tel_fijo` varchar(15) DEFAULT NULL,
  `tel_movil` varchar(15) DEFAULT NULL,
  `tipo_persona` varchar(15) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `id_bas_usuario` int(11) DEFAULT NULL,
  `id_bas_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_cotizacion`
--

CREATE TABLE `cli_cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `atencion` text DEFAULT NULL,
  `mail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cli_cotizacion`
--

INSERT INTO `cli_cotizacion` (`id_cotizacion`, `id_empresa`, `id_cliente`, `id_usuario`, `id_proyecto`, `atencion`, `mail`) VALUES
(1, 3, NULL, NULL, NULL, 'Angel Medina', 'amedina@bpfs.com.mx'),
(2, 3, NULL, NULL, NULL, 'LA MISS ', 'erickolaff@gmail.com'),
(3, 3, NULL, NULL, NULL, 'jonatan', ''),
(4, 3, NULL, NULL, NULL, 'marco', 'correo@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_direccion`
--

CREATE TABLE `cli_direccion` (
  `id_direccion` int(11) NOT NULL,
  `tipo_direccion` varchar(15) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `id_bas_direccion` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_item`
--

CREATE TABLE `cli_item` (
  `id_item` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `medida` double DEFAULT NULL,
  `importe_siniva` double DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_cotizacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cli_item`
--

INSERT INTO `cli_item` (`id_item`, `descuento`, `cantidad`, `medida`, `importe_siniva`, `id_producto`, `id_cotizacion`) VALUES
(1, 10, 10, 20, 9000, 1, 1),
(2, 0, 1, 100, 5000, 1, 2),
(3, 10, 2, 6, 540, 1, 3),
(4, 0, 0, 0, 0, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_proyecto`
--

CREATE TABLE `cli_proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `avance` double DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_entradas`
--

CREATE TABLE `inv_entradas` (
  `id_entrada` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_inventario`
--

CREATE TABLE `inv_inventario` (
  `id_inventario` int(11) NOT NULL,
  `costo_medio` double DEFAULT NULL,
  `debe` double DEFAULT NULL,
  `haber` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `mes` int(3) DEFAULT NULL,
  `anio` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_producto`
--

CREATE TABLE `inv_producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `medida` varchar(15) DEFAULT NULL,
  `precio_unidad` double DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad_medidia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inv_producto`
--

INSERT INTO `inv_producto` (`id_producto`, `nombre`, `descripcion`, `medida`, `precio_unidad`, `estatus`, `existencia`, `id_categoria`, `id_unidad_medidia`) VALUES
(1, 'Alumninio', 'Lamina de aluminio', '120', 50, 'Disponible', 5, 1, 1),
(2, '1', '1', '1', 1, 'Activo', 1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_salidas`
--

CREATE TABLE `inv_salidas` (
  `id_salida` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_fiscal`
--

CREATE TABLE `pro_fiscal` (
  `id_pro_fiscal` int(11) NOT NULL,
  `rfc` int(11) NOT NULL,
  `uso_cfdi` int(11) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_proveedor`
--

CREATE TABLE `pro_proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `razon_social` text DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `sector_comercial` varchar(50) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bas_categoria`
--
ALTER TABLE `bas_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `bas_direcion`
--
ALTER TABLE `bas_direcion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `bas_empresa`
--
ALTER TABLE `bas_empresa`
  ADD PRIMARY KEY (`id_bas_empresa`);

--
-- Indices de la tabla `bas_metas`
--
ALTER TABLE `bas_metas`
  ADD PRIMARY KEY (`id_meta`);

--
-- Indices de la tabla `bas_permisos`
--
ALTER TABLE `bas_permisos`
  ADD PRIMARY KEY (`id_bas_permisos`),
  ADD KEY `bas_permisos-bas_usuario_idx` (`id_bas_usuario`);

--
-- Indices de la tabla `bas_regalo`
--
ALTER TABLE `bas_regalo`
  ADD PRIMARY KEY (`id_regalo`);

--
-- Indices de la tabla `bas_unidad_medida`
--
ALTER TABLE `bas_unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medidia`);

--
-- Indices de la tabla `bas_usuario`
--
ALTER TABLE `bas_usuario`
  ADD PRIMARY KEY (`id_bas_usuario`),
  ADD KEY `bas_usuario-bas_direccion_idx` (`id_direccion`),
  ADD KEY `bas_usuario-bas_empresa_idx` (`id_bas_empresa`);

--
-- Indices de la tabla `cli_cliente`
--
ALTER TABLE `cli_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `cli_cliente-bas_usuario_idx` (`id_bas_usuario`),
  ADD KEY `cli_cliente-bas_empresa_idx` (`id_bas_empresa`);

--
-- Indices de la tabla `cli_cotizacion`
--
ALTER TABLE `cli_cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `cli_cotizacion-bas_empresa_idx` (`id_empresa`),
  ADD KEY `cli_cotizacion-bas_usuario_idx` (`id_usuario`),
  ADD KEY `cli_cotizacion-cli_proyecto_idx` (`id_proyecto`),
  ADD KEY `cli_cotizacion-cli_cliente_idx` (`id_cliente`);

--
-- Indices de la tabla `cli_direccion`
--
ALTER TABLE `cli_direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `cli_direccion-bas_direccion_idx` (`id_bas_direccion`),
  ADD KEY `cli_direccion-cli_cliente_idx` (`id_cliente`);

--
-- Indices de la tabla `cli_item`
--
ALTER TABLE `cli_item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `cli_item-inv_producto_idx` (`id_producto`),
  ADD KEY `cli_item-cli_cotizacion_idx` (`id_cotizacion`);

--
-- Indices de la tabla `cli_proyecto`
--
ALTER TABLE `cli_proyecto`
  ADD PRIMARY KEY (`id_proyecto`);

--
-- Indices de la tabla `inv_entradas`
--
ALTER TABLE `inv_entradas`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `inv_entradas-inv_inventario_idx` (`id_inventario`),
  ADD KEY `inv_entradas-inv_producto_idx` (`id_producto`);

--
-- Indices de la tabla `inv_inventario`
--
ALTER TABLE `inv_inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `inv_producto`
--
ALTER TABLE `inv_producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `inv_producto-bas_categoria_idx` (`id_categoria`),
  ADD KEY `inv_producto-bas_unidad_medida_idx` (`id_unidad_medidia`);

--
-- Indices de la tabla `inv_salidas`
--
ALTER TABLE `inv_salidas`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `inv_salidas-inv_producto_idx` (`id_producto`),
  ADD KEY `inv_salidas-inv_inventario_idx` (`id_inventario`);

--
-- Indices de la tabla `pro_fiscal`
--
ALTER TABLE `pro_fiscal`
  ADD PRIMARY KEY (`id_pro_fiscal`);

--
-- Indices de la tabla `pro_proveedor`
--
ALTER TABLE `pro_proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `pro_proveedor-inv_producto_idx` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bas_categoria`
--
ALTER TABLE `bas_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bas_direcion`
--
ALTER TABLE `bas_direcion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bas_empresa`
--
ALTER TABLE `bas_empresa`
  MODIFY `id_bas_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bas_metas`
--
ALTER TABLE `bas_metas`
  MODIFY `id_meta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bas_permisos`
--
ALTER TABLE `bas_permisos`
  MODIFY `id_bas_permisos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bas_regalo`
--
ALTER TABLE `bas_regalo`
  MODIFY `id_regalo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bas_unidad_medida`
--
ALTER TABLE `bas_unidad_medida`
  MODIFY `id_unidad_medidia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bas_usuario`
--
ALTER TABLE `bas_usuario`
  MODIFY `id_bas_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cli_cliente`
--
ALTER TABLE `cli_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cli_cotizacion`
--
ALTER TABLE `cli_cotizacion`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cli_direccion`
--
ALTER TABLE `cli_direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cli_item`
--
ALTER TABLE `cli_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cli_proyecto`
--
ALTER TABLE `cli_proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inv_entradas`
--
ALTER TABLE `inv_entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inv_inventario`
--
ALTER TABLE `inv_inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inv_producto`
--
ALTER TABLE `inv_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pro_fiscal`
--
ALTER TABLE `pro_fiscal`
  MODIFY `id_pro_fiscal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pro_proveedor`
--
ALTER TABLE `pro_proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bas_permisos`
--
ALTER TABLE `bas_permisos`
  ADD CONSTRAINT `bas_permisos-bas_usuario` FOREIGN KEY (`id_bas_usuario`) REFERENCES `bas_usuario` (`id_bas_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bas_usuario`
--
ALTER TABLE `bas_usuario`
  ADD CONSTRAINT `bas_usuario-bas_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `bas_direcion` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bas_usuario-bas_empresa` FOREIGN KEY (`id_bas_empresa`) REFERENCES `bas_empresa` (`id_bas_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cli_cliente`
--
ALTER TABLE `cli_cliente`
  ADD CONSTRAINT `cli_cliente-bas_empresa` FOREIGN KEY (`id_bas_empresa`) REFERENCES `bas_empresa` (`id_bas_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_cliente-bas_usuario` FOREIGN KEY (`id_bas_usuario`) REFERENCES `bas_usuario` (`id_bas_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cli_cotizacion`
--
ALTER TABLE `cli_cotizacion`
  ADD CONSTRAINT `cli_cotizacion-bas_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `bas_empresa` (`id_bas_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_cotizacion-bas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `bas_usuario` (`id_bas_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_cotizacion-cli_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cli_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_cotizacion-cli_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `cli_proyecto` (`id_proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cli_direccion`
--
ALTER TABLE `cli_direccion`
  ADD CONSTRAINT `cli_direccion-bas_direccion` FOREIGN KEY (`id_bas_direccion`) REFERENCES `bas_direcion` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_direccion-cli_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cli_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cli_item`
--
ALTER TABLE `cli_item`
  ADD CONSTRAINT `cli_item-cli_cotizacion` FOREIGN KEY (`id_cotizacion`) REFERENCES `cli_cotizacion` (`id_cotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cli_item-inv_producto` FOREIGN KEY (`id_producto`) REFERENCES `inv_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inv_entradas`
--
ALTER TABLE `inv_entradas`
  ADD CONSTRAINT `inv_entradas-inv_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inv_inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inv_entradas-inv_producto` FOREIGN KEY (`id_producto`) REFERENCES `inv_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inv_producto`
--
ALTER TABLE `inv_producto`
  ADD CONSTRAINT `inv_producto-bas_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `bas_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inv_producto-bas_unidad_medida` FOREIGN KEY (`id_unidad_medidia`) REFERENCES `bas_unidad_medida` (`id_unidad_medidia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inv_salidas`
--
ALTER TABLE `inv_salidas`
  ADD CONSTRAINT `inv_salidas-inv_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inv_inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inv_salidas-inv_producto` FOREIGN KEY (`id_producto`) REFERENCES `inv_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pro_proveedor`
--
ALTER TABLE `pro_proveedor`
  ADD CONSTRAINT `pro_proveedor-inv_producto` FOREIGN KEY (`id_producto`) REFERENCES `inv_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
