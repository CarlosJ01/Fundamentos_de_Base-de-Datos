/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 8.0.13 : Database - neo_libreria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`neo_libreria` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `neo_libreria`;

/*Table structure for table `autor` */

DROP TABLE IF EXISTS `autor`;

CREATE TABLE `autor` (
  `autor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`autor_id`,`libro_id`),
  KEY `fk_Autor_Libro_idx` (`libro_id`),
  CONSTRAINT `fk_Autor_Libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `autor` */

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_paterno` varchar(45) NOT NULL,
  `a_materno` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cliente` */

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`compra_id`,`proveedor_id`,`empleado_id`),
  KEY `fk_Compra_Proveedor1_idx` (`proveedor_id`),
  KEY `fk_Compra_Empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_Compra_Empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  CONSTRAINT `fk_Compra_Proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `compra` */

/*Table structure for table `detalle_compra` */

DROP TABLE IF EXISTS `detalle_compra`;

CREATE TABLE `detalle_compra` (
  `detalle_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT '1',
  `precio` double DEFAULT NULL,
  `compra_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`detalle_compra_id`,`compra_id`,`libro_id`),
  KEY `fk_Detalle_compra_Compra1_idx` (`compra_id`),
  KEY `fk_Detalle_compra_Libro1_idx` (`libro_id`),
  CONSTRAINT `fk_Detalle_compra_Compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_Detalle_compra_Libro1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalle_compra` */

/*Table structure for table `detalle_venta` */

DROP TABLE IF EXISTS `detalle_venta`;

CREATE TABLE `detalle_venta` (
  `detalle_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT '1',
  `precio` double DEFAULT NULL,
  `venta_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`detalle_venta_id`,`venta_id`,`libro_id`),
  KEY `fk_Detalle_venta_Venta1_idx` (`venta_id`),
  KEY `fk_Detalle_venta_Libro1_idx` (`libro_id`),
  CONSTRAINT `fk_Detalle_venta_Libro1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`),
  CONSTRAINT `fk_Detalle_venta_Venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalle_venta` */

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_paterno` varchar(45) NOT NULL,
  `a_materno` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `sueldo` double DEFAULT NULL,
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `empleado` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT '0',
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`inventario_id`,`libro_id`),
  KEY `fk_Inventario_Libro1_idx` (`libro_id`),
  CONSTRAINT `fk_Inventario_Libro1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventario` */

/*Table structure for table `libro` */

DROP TABLE IF EXISTS `libro`;

CREATE TABLE `libro` (
  `libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `isbn` varchar(15) DEFAULT NULL,
  `edicion` varchar(15) NOT NULL,
  `editorial` varchar(60) NOT NULL,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `libro` */

/*Table structure for table `precio` */

DROP TABLE IF EXISTS `precio`;

CREATE TABLE `precio` (
  `precio_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date DEFAULT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`precio_id`,`libro_id`),
  KEY `fk_Precio_Libro1_idx` (`libro_id`),
  CONSTRAINT `fk_Precio_Libro1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `precio` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_paterno` varchar(45) NOT NULL,
  `a_materno` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `proveedor` */

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`venta_id`,`cliente_id`,`empleado_id`),
  KEY `fk_Venta_Cliente1_idx` (`cliente_id`),
  KEY `fk_Venta_Empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_Venta_Cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `fk_Venta_Empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `venta` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
