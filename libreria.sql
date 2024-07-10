/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 8.0.13 : Database - libreria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`libreria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `libreria`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cliente` */

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  PRIMARY KEY (`compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `compra` */

/*Table structure for table `detalle de la venta` */

DROP TABLE IF EXISTS `detalle de la venta`;

CREATE TABLE `detalle de la venta` (
  `libro` varchar(50) NOT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `Venta_empleado_id` varchar(25) NOT NULL,
  `Venta_venta_id` int(11) NOT NULL,
  `Venta_Cliente_cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`Venta_empleado_id`,`Venta_venta_id`,`Venta_Cliente_cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `detalle de la venta` */

/*Table structure for table `detallede la compra` */

DROP TABLE IF EXISTS `detallede la compra`;

CREATE TABLE `detallede la compra` (
  `libro` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `detallede la compra` */

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `genero` varchar(15) NOT NULL,
  `horario` varchar(10) DEFAULT NULL,
  `salario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `Emleadocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `empleado` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`inventario_id`,`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `inventario` */

/*Table structure for table `libro` */

DROP TABLE IF EXISTS `libro`;

CREATE TABLE `libro` (
  `libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `precio` float NOT NULL,
  `paginas` int(11) DEFAULT NULL,
  `editorial` varchar(45) DEFAULT NULL,
  `autor_id` int(11) NOT NULL,
  PRIMARY KEY (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `libro` */

/*Table structure for table `lista de precio` */

DROP TABLE IF EXISTS `lista de precio`;

CREATE TABLE `lista de precio` (
  `libro` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `vigencia` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `lista de precio` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `provedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `RFC` varchar(50) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `numero de cuenta` varchar(45) NOT NULL,
  `material` varchar(45) NOT NULL,
  PRIMARY KEY (`provedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proveedor` */

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `empleado_id` varchar(25) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `Cliente_cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`empleado_id`,`venta_id`,`Cliente_cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `venta` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
