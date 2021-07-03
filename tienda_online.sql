/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 127.0.0.1:3306
 Source Schema         : tienda_online

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 16/06/2021 20:03:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cate_produ
-- ----------------------------
DROP TABLE IF EXISTS `cate_produ`;
CREATE TABLE `cate_produ`  (
  `idCate_Produ` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idCate_Produ`) USING BTREE,
  INDEX `fk_cat_prod`(`idCategoria`) USING BTREE,
  INDEX `fk_prod_cat`(`idProducto`) USING BTREE,
  CONSTRAINT `fk_cat_prod` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_cat` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cate_produ
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idCategoria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of categorias
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apeliido2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `comentario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idCliente`) USING BTREE,
  INDEX `fk_usuario`(`idUsuario`) USING BTREE,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cliente
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `cliente_pedidos`;
CREATE TABLE `cliente_pedidos`  (
  `idCliente_Pedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idPedidos` int NOT NULL,
  PRIMARY KEY (`idCliente_Pedido`) USING BTREE,
  INDEX `fk_cliente`(`idCliente`) USING BTREE,
  INDEX `fk_pedidos`(`idPedidos`) USING BTREE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_pedidos` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cliente_pedidos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for detalle_pedido
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE `detalle_pedido`  (
  `idDetalle_Pedido` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio` float(6, 2) NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idDetalle_Pedido`) USING BTREE,
  INDEX `fk_producto`(`idProducto`) USING BTREE,
  CONSTRAINT `fk_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of detalle_pedido
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ped_detalleped
-- ----------------------------
DROP TABLE IF EXISTS `ped_detalleped`;
CREATE TABLE `ped_detalleped`  (
  `idped_detalleped` int NOT NULL AUTO_INCREMENT,
  `idPedidos` int NOT NULL,
  `idDetallePedido` int NOT NULL,
  PRIMARY KEY (`idped_detalleped`) USING BTREE,
  INDEX `fk_pedido`(`idPedidos`) USING BTREE,
  INDEX `id_detallePedido`(`idDetallePedido`) USING BTREE,
  CONSTRAINT `fk_pedido` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_detallePedido` FOREIGN KEY (`idDetallePedido`) REFERENCES `detalle_pedido` (`idDetalle_Pedido`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ped_detalleped
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `idPedidos` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total` float(10, 2) NOT NULL,
  PRIMARY KEY (`idPedidos`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` float(7, 2) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha` date NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idProducto`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of producto
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for producto_pedido
-- ----------------------------
DROP TABLE IF EXISTS `producto_pedido`;
CREATE TABLE `producto_pedido`  (
  `idProd_Ped` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `idPedidos` int NOT NULL,
  PRIMARY KEY (`idProd_Ped`) USING BTREE,
  INDEX `fk_Pro_Ped`(`idProducto`) USING BTREE,
  INDEX `fk_Ped_Pro`(`idPedidos`) USING BTREE,
  CONSTRAINT `fk_Ped_Pro` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Pro_Ped` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of producto_pedido
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `clave` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idUsuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
