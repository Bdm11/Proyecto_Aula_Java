-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BasedeDatos_Ferreteria
-- -----------------------------------------------------
#DROP SCHEMA IF EXISTS `BasedeDatos_Ferreteria` ;

-- -----------------------------------------------------
-- Schema BasedeDatos_Ferreteria
-- -----------------------------------------------------
#CREATE SCHEMA IF NOT EXISTS `BasedeDatos_Ferreteria` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
#USE `BasedeDatos_Ferreteria` ;

-- -----------------------------------------------------
-- Table `CLIENTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CLIENTES` ;

CREATE TABLE IF NOT EXISTS `CLIENTES` (
  `idCliente` CHAR(6) NOT NULL,
  `nomCliente` VARCHAR(25) NULL,
  `apeCliente` VARCHAR(25) NULL,
  `dniCliente` INT NOT NULL,
  `telCliente` INT NULL,
  `rucCliente` INT NULL,
  `dirCliente` VARCHAR(30) NULL,
  `emailCliente` VARCHAR(30) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COMPROBANTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPROBANTES` ;

CREATE TABLE IF NOT EXISTS `COMPROBANTES` (
  `idComprobante` CHAR(6) NOT NULL,
  `fechaComprobante` DATE NULL,
  `tipoComprobante` CHAR(10) NULL,
  `numComprobante` INT NULL,
  `idCliente` CHAR(6) NOT NULL,
  PRIMARY KEY (`idComprobante`),
  INDEX `fk_COMPROBANTES_CLIENTES1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_COMPROBANTES_CLIENTES1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `CLIENTES` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PRODUCTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCTOS` ;

CREATE TABLE IF NOT EXISTS `PRODUCTOS` (
  `idProducto` CHAR(6) NOT NULL,
  `nomProducto` VARCHAR(30) NULL,
  `stockProducto` INT NULL,
  `desProducto` VARCHAR(30) NULL,
  `precioUnitarioProducto` DOUBLE NULL,
  `ubicacionProducto` VARCHAR(30) NULL,
  `tipoProducto` VARCHAR(30) NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLEADOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EMPLEADOS` ;

CREATE TABLE IF NOT EXISTS `EMPLEADOS` (
  `idEmpleado` CHAR(6) NOT NULL,
  `nomEmpleado` VARCHAR(30) NULL,
  `apeEmpleado` VARCHAR(30) NULL,
  `dniEmpleado` INT NOT NULL,
  `dirEmpleado` VARCHAR(30) NULL,
  `emailEmpleado` VARCHAR(30) NULL DEFAULT 'NO TIENE',
  `userEmpleado` CHAR(10) NULL,
  `claveEmpleado` CHAR(10) NULL,
  `cargoEmpleado` VARCHAR(30) NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NOTADEPEDIDOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NOTADEPEDIDOS` ;

CREATE TABLE IF NOT EXISTS `NOTADEPEDIDOS` (
  `idNotaPedido` CHAR(6) NOT NULL,
  `idEmpleado` CHAR(6) NOT NULL,
  PRIMARY KEY (`idNotaPedido`),
  INDEX `fk_NOTADEPEDIDOS_EMPLEADOS1_idx` (`idEmpleado` ASC),
  CONSTRAINT `fk_NOTADEPEDIDOS_EMPLEADOS1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `EMPLEADOS` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DETALLECOMPROBANTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLECOMPROBANTES` ;

CREATE TABLE IF NOT EXISTS `DETALLECOMPROBANTES` (
  `idComprobante` CHAR(6) unique,
  `idNotaPedido` CHAR(6) unique,
  `montoTotal` DOUBLE NULL,
  `montoIgv` DOUBLE NULL,
  `montoNeto` DOUBLE NULL,
  INDEX `fk_COMPROBANTES_has_NOTADEPEDIDOS_NOTADEPEDIDOS1_idx` (`idNotaPedido` ASC),
  INDEX `fk_COMPROBANTES_has_NOTADEPEDIDOS_COMPROBANTES_idx` (`idComprobante` ASC),
  PRIMARY KEY  (`idComprobante`, `idNotaPedido`),
  CONSTRAINT `fk_COMPROBANTES_has_NOTADEPEDIDOS_COMPROBANTES`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `COMPROBANTES` (`idComprobante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPROBANTES_has_NOTADEPEDIDOS_NOTADEPEDIDOS1`
    FOREIGN KEY (`idNotaPedido`)
    REFERENCES `NOTADEPEDIDOS` (`idNotaPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DETALLENOTADEPEDIDOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLENOTADEPEDIDOS` ;

CREATE TABLE IF NOT EXISTS `DETALLENOTADEPEDIDOS` (
  `idProducto` CHAR(6) NOT NULL,
  `idNotaPedido` CHAR(6) NOT NULL,
  `unidadesNotaPedido` INT NULL,
  INDEX `fk_PRODUCTOS_has_NOTADEPEDIDOS_NOTADEPEDIDOS1_idx` (`idNotaPedido` ASC),
  INDEX `fk_PRODUCTOS_has_NOTADEPEDIDOS_PRODUCTOS1_idx` (`idProducto` ASC),
  PRIMARY KEY (`idProducto`, `idNotaPedido`),
  CONSTRAINT `fk_PRODUCTOS_has_NOTADEPEDIDOS_PRODUCTOS1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `PRODUCTOS` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_has_NOTADEPEDIDOS_NOTADEPEDIDOS1`
    FOREIGN KEY (`idNotaPedido`)
    REFERENCES `NOTADEPEDIDOS` (`idNotaPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GUARDARNOTAPEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GUARDARNOTAPEDIDO` ;

CREATE TABLE IF NOT EXISTS `GUARDARNOTAPEDIDO` (
  `cantidadProdu` DOUBLE NULL,
  `descripProduc` VARCHAR(25) NULL,
  `precioProduc` DOUBLE NULL,
  `valorProducto` DOUBLE NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
