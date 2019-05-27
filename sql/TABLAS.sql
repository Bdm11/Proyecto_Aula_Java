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
    `idCliente` VARCHAR(30) NOT NULL,
    `nomCliente` VARCHAR(25) NULL,
    `apeCliente` VARCHAR(25) NULL,
    `dniCliente` INT NOT NULL,
    `telCliente` INT NULL,
    `rucCliente` INT NULL,
    `dirCliente` VARCHAR(30) NULL,
    `emailCliente` VARCHAR(30) NULL,
    PRIMARY KEY (`idCliente`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `COMPROBANTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPROBANTES` ;

CREATE TABLE IF NOT EXISTS `COMPROBANTES` (
  `idComprobante` VARCHAR(30) NOT NULL,
  `fechaComprobante` DATE NULL,
  `tipoComprobante` VARCHAR(30) NULL,
  `numComprobante` INT NULL,
  `idCliente` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idComprobante`),
    FOREIGN KEY (`idCliente`)
    REFERENCES `CLIENTES` (`idCliente`)   
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PRODUCTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUCTOS` ;

CREATE TABLE IF NOT EXISTS `PRODUCTOS` (
  `idProducto` VARCHAR(30) NOT NULL,
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
  `idEmpleado` VARCHAR(30) NOT NULL,
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
  `idNotaPedido` VARCHAR(30) NOT NULL,
  `idEmpleado` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idNotaPedido`),
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `EMPLEADOS` (`idEmpleado`)    
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DETALLECOMPROBANTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLECOMPROBANTES` ;

CREATE TABLE IF NOT EXISTS `DETALLECOMPROBANTES` (
  `idComprobante` VARCHAR(30) unique,
  `idNotaPedido` VARCHAR(30) unique,
  `montoTotal` DOUBLE NULL,
  `montoIgv` DOUBLE NULL,
  `montoNeto` DOUBLE NULL,
  PRIMARY KEY  (`idComprobante`, `idNotaPedido`),
    FOREIGN KEY (`idComprobante`)
    REFERENCES `COMPROBANTES` (`idComprobante`),
    FOREIGN KEY (`idNotaPedido`)
    REFERENCES `NOTADEPEDIDOS` (`idNotaPedido`)
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DETALLENOTADEPEDIDOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DETALLENOTADEPEDIDOS` ;

CREATE TABLE IF NOT EXISTS `DETALLENOTADEPEDIDOS` (
  `idProducto` VARCHAR(30) NOT NULL,
  `idNotaPedido` VARCHAR(30) NOT NULL,
  `unidadesNotaPedido` INT NULL, 
  PRIMARY KEY (`idProducto`, `idNotaPedido`), 
    FOREIGN KEY (`idProducto`)
    REFERENCES `PRODUCTOS` (`idProducto`), 
    FOREIGN KEY (`idNotaPedido`)
    REFERENCES `NOTADEPEDIDOS` (`idNotaPedido`)
    )
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
