-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Libro` (
  `libro_id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NOT NULL,
  `isbn` VARCHAR(20) NULL,
  `precio` FLOAT NOT NULL,
  `paginas` INT NULL,
  `editorial` VARCHAR(45) NULL,
  `autor_id` INT NOT NULL,
  PRIMARY KEY (`libro_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Inventario` (
  `inventario_id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL DEFAULT 0,
  `libro_id` INT NOT NULL,
  PRIMARY KEY (`inventario_id`, `libro_id`),
  INDEX `fk_Inventario_Libro_idx` (`libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inventario_Libro`
    FOREIGN KEY (`libro_id`)
    REFERENCES `new_schema1`.`Libro` (`libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `RFC` VARCHAR(20) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `Libro_libro_id` INT NOT NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `fk_Cliente_Libro1_idx` (`Libro_libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Libro1`
    FOREIGN KEY (`Libro_libro_id`)
    REFERENCES `new_schema1`.`Libro` (`libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Empleado` (
  `genero` VARCHAR(15) NOT NULL,
  `horario` VARCHAR(10) NULL,
  `salario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `Emleadocol` VARCHAR(45) NULL,
  `Cliente_cliente_id` INT NOT NULL,
  PRIMARY KEY (`Cliente_cliente_id`),
  CONSTRAINT `fk_Empleado_Cliente1`
    FOREIGN KEY (`Cliente_cliente_id`)
    REFERENCES `new_schema1`.`Cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Venta` (
  `empleado_id` VARCHAR(25) NOT NULL,
  `venta_id` INT NOT NULL,
  `Inventario_inventario_id` INT NOT NULL,
  `Inventario_libro_id` INT NOT NULL,
  `Cliente_cliente_id` INT NOT NULL,
  PRIMARY KEY (`empleado_id`, `venta_id`, `Cliente_cliente_id`),
  INDEX `fk_Venta_Inventario1_idx` (`Inventario_inventario_id` ASC, `Inventario_libro_id` ASC) VISIBLE,
  INDEX `fk_Venta_Cliente1_idx` (`Cliente_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_Inventario1`
    FOREIGN KEY (`Inventario_inventario_id` , `Inventario_libro_id`)
    REFERENCES `new_schema1`.`Inventario` (`inventario_id` , `libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Cliente1`
    FOREIGN KEY (`Cliente_cliente_id`)
    REFERENCES `new_schema1`.`Cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Compra` (
  `compra_id` INT NOT NULL AUTO_INCREMENT,
  `precio` FLOAT NULL,
  `cantidad` INT NULL,
  `descuento` FLOAT NULL,
  `Inventario_inventario_id` INT NOT NULL,
  `Inventario_libro_id` INT NOT NULL,
  PRIMARY KEY (`compra_id`),
  INDEX `fk_Compra_Inventario1_idx` (`Inventario_inventario_id` ASC, `Inventario_libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Inventario1`
    FOREIGN KEY (`Inventario_inventario_id` , `Inventario_libro_id`)
    REFERENCES `new_schema1`.`Inventario` (`inventario_id` , `libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Proveedor` (
  `provedor_id` INT NOT NULL AUTO_INCREMENT,
  `RFC` VARCHAR(50) NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `numero de cuenta` VARCHAR(45) NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `Libro_libro_id` INT NOT NULL,
  `Compra_compra_id` INT NOT NULL,
  PRIMARY KEY (`provedor_id`, `Libro_libro_id`, `Compra_compra_id`),
  INDEX `fk_Proveedor_Libro1_idx` (`Libro_libro_id` ASC) VISIBLE,
  INDEX `fk_Proveedor_Compra1_idx` (`Compra_compra_id` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_Libro1`
    FOREIGN KEY (`Libro_libro_id`)
    REFERENCES `new_schema1`.`Libro` (`libro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_Compra1`
    FOREIGN KEY (`Compra_compra_id`)
    REFERENCES `new_schema1`.`Compra` (`compra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Detallede la compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`Detallede la compra` (
  `libro` INT NULL,
  `precio` FLOAT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATETIME NULL,
  `Compra_compra_id` INT NOT NULL,
  PRIMARY KEY (`Compra_compra_id`),
  CONSTRAINT `fk_Detallede la compra_Compra1`
    FOREIGN KEY (`Compra_compra_id`)
    REFERENCES `new_schema1`.`Compra` (`compra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`detalle de la venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`detalle de la venta` (
  `libro` VARCHAR(50) NOT NULL,
  `precio` FLOAT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `Venta_empleado_id` VARCHAR(25) NOT NULL,
  `Venta_venta_id` INT NOT NULL,
  `Venta_Cliente_cliente_id` INT NOT NULL,
  PRIMARY KEY (`Venta_empleado_id`, `Venta_venta_id`, `Venta_Cliente_cliente_id`),
  CONSTRAINT `fk_detalle de la venta_Venta1`
    FOREIGN KEY (`Venta_empleado_id` , `Venta_venta_id` , `Venta_Cliente_cliente_id`)
    REFERENCES `new_schema1`.`Venta` (`empleado_id` , `venta_id` , `Cliente_cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`lista de precio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`lista de precio` (
  `libro` VARCHAR(50) NOT NULL,
  `precio` FLOAT NOT NULL,
  `vigencia` DATETIME NOT NULL,
  `detalle de la venta_Venta_empleado_id` VARCHAR(25) NOT NULL,
  `detalle de la venta_Venta_venta_id` INT NOT NULL,
  `detalle de la venta_Venta_Cliente_cliente_id` INT NOT NULL,
  PRIMARY KEY (`detalle de la venta_Venta_empleado_id`, `detalle de la venta_Venta_venta_id`, `detalle de la venta_Venta_Cliente_cliente_id`),
  CONSTRAINT `fk_lista de precio_detalle de la venta1`
    FOREIGN KEY (`detalle de la venta_Venta_empleado_id` , `detalle de la venta_Venta_venta_id` , `detalle de la venta_Venta_Cliente_cliente_id`)
    REFERENCES `new_schema1`.`detalle de la venta` (`Venta_empleado_id` , `Venta_venta_id` , `Venta_Cliente_cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
