-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clases` (
  `idclases` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_clase` VARCHAR(45) NOT NULL,
  `costo_diario_persona` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idclases`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`decoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`decoracion` (
  `id_decoracion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_decoracion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_decoracion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habitaciones` (
  `numero_habitacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clases_idclases` INT UNSIGNED NOT NULL,
  `decoracion_iddecoracion` INT UNSIGNED NOT NULL,
  `cantidad_maxima` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`numero_habitacion`),
  INDEX `fk_habitaciones_clases_idx` (`clases_idclases` ASC) VISIBLE,
  INDEX `fk_habitaciones_decoracion1_idx` (`decoracion_iddecoracion` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_clases`
    FOREIGN KEY (`clases_idclases`)
    REFERENCES `mydb`.`clases` (`idclases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_decoracion1`
    FOREIGN KEY (`decoracion_iddecoracion`)
    REFERENCES `mydb`.`decoracion` (`id_decoracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paises` (
  `idpaises` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idpaises`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sector` (
  `idsector` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idsector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleados` (
  `legajo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `numero_documento` INT UNSIGNED NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `paises_empleados_idpaises_empleados` INT UNSIGNED NOT NULL,
  `status` TINYINT UNSIGNED NOT NULL,
  `sector_idsector` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`legajo`),
  INDEX `fk_empleados_paises_empleados1_idx` (`paises_empleados_idpaises_empleados` ASC) VISIBLE,
  INDEX `fk_empleados_sector1_idx` (`sector_idsector` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_paises_empleados1`
    FOREIGN KEY (`paises_empleados_idpaises_empleados`)
    REFERENCES `mydb`.`paises` (`idpaises`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_sector1`
    FOREIGN KEY (`sector_idsector`)
    REFERENCES `mydb`.`sector` (`idsector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`huespedes` (
  `idhuespedes` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `pasaporte` INT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  `celular` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `paises_idpaises` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idhuespedes`),
  INDEX `fk_huespedes_paises1_idx` (`paises_idpaises` ASC) VISIBLE,
  CONSTRAINT `fk_huespedes_paises1`
    FOREIGN KEY (`paises_idpaises`)
    REFERENCES `mydb`.`paises` (`idpaises`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`forma_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`forma_pago` (
  `idforma_pago` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `metodo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idforma_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`check_in` (
  `idcheck_in` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_entrada` DATE NOT NULL,
  `fecha_salida` DATE NOT NULL,
  `importe` FLOAT NOT NULL,
  `habitaciones_numero_habitacion` INT UNSIGNED NOT NULL,
  `forma_pago_idforma_pago` INT UNSIGNED NOT NULL,
  `huespedes_idhuespedes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idcheck_in`, `forma_pago_idforma_pago`),
  INDEX `fk_check_in_habitaciones1_idx` (`habitaciones_numero_habitacion` ASC) VISIBLE,
  INDEX `fk_check_in_forma_pago1_idx` (`forma_pago_idforma_pago` ASC) VISIBLE,
  INDEX `fk_check_in_huespedes1_idx` (`huespedes_idhuespedes` ASC) VISIBLE,
  CONSTRAINT `fk_check_in_habitaciones1`
    FOREIGN KEY (`habitaciones_numero_habitacion`)
    REFERENCES `mydb`.`habitaciones` (`numero_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_in_forma_pago1`
    FOREIGN KEY (`forma_pago_idforma_pago`)
    REFERENCES `mydb`.`forma_pago` (`idforma_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_in_huespedes1`
    FOREIGN KEY (`huespedes_idhuespedes`)
    REFERENCES `mydb`.`huespedes` (`idhuespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicios_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicios_habitacion` (
  `idservicios_habitacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_serviciobasico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idservicios_habitacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habitaciones_has_servicios_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habitaciones_has_servicios_habitacion` (
  `id_servicios_habitaciones` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `habitaciones_numero_habitacion` INT UNSIGNED NOT NULL,
  `servicios_habitacion_idservicios_habitacion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_servicios_habitaciones`),
  INDEX `fk_habitaciones_has_servicios_habitacion_servicios_habitaci_idx` (`servicios_habitacion_idservicios_habitacion` ASC) VISIBLE,
  INDEX `fk_habitaciones_has_servicios_habitacion_habitaciones1_idx` (`habitaciones_numero_habitacion` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_has_servicios_habitacion_habitaciones1`
    FOREIGN KEY (`habitaciones_numero_habitacion`)
    REFERENCES `mydb`.`habitaciones` (`numero_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_has_servicios_habitacion_servicios_habitacion1`
    FOREIGN KEY (`servicios_habitacion_idservicios_habitacion`)
    REFERENCES `mydb`.`servicios_habitacion` (`idservicios_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicios_extras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicios_extras` (
  `idservicios_extras` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_servicio` VARCHAR(45) NOT NULL,
  `costo_hora` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY (`idservicios_extras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicios_extras_has_huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicios_extras_has_huespedes` (
  `id_reservas` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `servicios_extras_idservicios_extras` INT UNSIGNED NOT NULL,
  `huespedes_idhuespedes` INT UNSIGNED NOT NULL,
  `fecha_y_hora` DATETIME NOT NULL,
  `horas_reservadas` TINYINT NOT NULL,
  `forma_pago_idforma_pago` INT UNSIGNED NOT NULL,
  INDEX `fk_servicios_extras_has_huespedes_huespedes1_idx` (`huespedes_idhuespedes` ASC) VISIBLE,
  INDEX `fk_servicios_extras_has_huespedes_servicios_extras1_idx` (`servicios_extras_idservicios_extras` ASC) VISIBLE,
  PRIMARY KEY (`id_reservas`, `forma_pago_idforma_pago`),
  INDEX `fk_servicios_extras_has_huespedes_forma_pago1_idx` (`forma_pago_idforma_pago` ASC) VISIBLE,
  CONSTRAINT `fk_servicios_extras_has_huespedes_servicios_extras1`
    FOREIGN KEY (`servicios_extras_idservicios_extras`)
    REFERENCES `mydb`.`servicios_extras` (`idservicios_extras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_extras_has_huespedes_huespedes1`
    FOREIGN KEY (`huespedes_idhuespedes`)
    REFERENCES `mydb`.`huespedes` (`idhuespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_extras_has_huespedes_forma_pago1`
    FOREIGN KEY (`forma_pago_idforma_pago`)
    REFERENCES `mydb`.`forma_pago` (`idforma_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
