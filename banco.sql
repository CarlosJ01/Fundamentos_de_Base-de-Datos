/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 8.0.13 : Database - banco
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `banco`;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `nombre_cliente` char(20) NOT NULL,
  `calle_cliente` char(30) DEFAULT NULL,
  `ciudad_cliente` char(30) DEFAULT NULL,
  PRIMARY KEY (`nombre_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`nombre_cliente`,`calle_cliente`,`ciudad_cliente`) values 
('Bryan Alejandro','Braulio Franco','Morelia'),
('Carlos Jahir','Realito','Morelia'),
('Cesar Eduardo','Downtown','Morelia'),
('Diana paulina','Manuel Zepeda','Morelia'),
('Juan Brayan','Realito','Morelia'),
('Ricardo','Manuel','Morelia'),
('Ricardo Giron','Hidalgo','Morelia'),
('Salomon Gomez','Calle 1','Morelia'),
('Victor Hugo','Pedregal','Morelia');

/*Table structure for table `cuentas` */

DROP TABLE IF EXISTS `cuentas`;

CREATE TABLE `cuentas` (
  `numero_cuenta` char(10) NOT NULL,
  `nombre_cuenta` char(15) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`numero_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cuentas` */

/*Table structure for table `impositores` */

DROP TABLE IF EXISTS `impositores`;

CREATE TABLE `impositores` (
  `nombre_cliente` char(20) NOT NULL,
  `numero_cuenta` char(10) NOT NULL,
  PRIMARY KEY (`nombre_cliente`,`numero_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `impositores` */

/*Table structure for table `prestamos` */

DROP TABLE IF EXISTS `prestamos`;

CREATE TABLE `prestamos` (
  `numero_prestamo` char(10) NOT NULL,
  `nombre_sucursal` char(15) DEFAULT NULL,
  `importe` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`numero_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prestamos` */

/*Table structure for table `prestatarios` */

DROP TABLE IF EXISTS `prestatarios`;

CREATE TABLE `prestatarios` (
  `nombre_cliente` char(20) NOT NULL,
  `numero_prestamo` char(10) NOT NULL,
  PRIMARY KEY (`nombre_cliente`,`numero_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prestatarios` */

/*Table structure for table `sucursales` */

DROP TABLE IF EXISTS `sucursales`;

CREATE TABLE `sucursales` (
  `nombre_sucursal` char(15) NOT NULL,
  `ciudad_sucursal` char(30) DEFAULT NULL,
  `activos` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`nombre_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sucursales` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
