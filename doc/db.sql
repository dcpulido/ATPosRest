-- MySQL Script generated by MySQL Workbench
-- mié 18 oct 2017 19:42:11 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ATpos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ATpos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ATpos` DEFAULT CHARACTER SET utf8 ;
USE `ATpos` ;

-- -----------------------------------------------------
-- Table `ATpos`.`player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ATpos`.`player` ;

CREATE TABLE IF NOT EXISTS `ATpos`.`player` (
  `name` VARCHAR(50) NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ATpos`.`day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ATpos`.`day` ;

CREATE TABLE IF NOT EXISTS `ATpos`.`day` (
  `idday` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idday`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ATpos`.`player_has_day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ATpos`.`player_has_day` ;

CREATE TABLE IF NOT EXISTS `ATpos`.`player_has_day` (
  `player_name` VARCHAR(50) NOT NULL,
  `day_idday` INT NOT NULL,
  PRIMARY KEY (`player_name`, `day_idday`),
  INDEX `fk_player_has_day_day1_idx` (`day_idday` ASC),
  INDEX `fk_player_has_day_player1_idx` (`player_name` ASC),
  CONSTRAINT `fk_player_has_day_player1`
    FOREIGN KEY (`player_name`)
    REFERENCES `ATpos`.`player` (`name`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_has_day_day1`
    FOREIGN KEY (`day_idday`)
    REFERENCES `ATpos`.`day` (`idday`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ATpos`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ATpos`.`event` ;

CREATE TABLE IF NOT EXISTS `ATpos`.`event` (
  `idevent` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `date` DATE NOT NULL,
  `longitude` FLOAT NOT NULL,
  `latitude` FLOAT NOT NULL,
  `player_has_day_player_name` VARCHAR(50) NOT NULL,
  `player_has_day_day_idday` INT NOT NULL,
  PRIMARY KEY (`idevent`, `player_has_day_player_name`, `player_has_day_day_idday`),
  INDEX `fk_event_player_has_day1_idx` (`player_has_day_player_name` ASC, `player_has_day_day_idday` ASC),
  CONSTRAINT `fk_event_player_has_day1`
    FOREIGN KEY (`player_has_day_player_name` , `player_has_day_day_idday`)
    REFERENCES `ATpos`.`player_has_day` (`player_name` , `day_idday`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
