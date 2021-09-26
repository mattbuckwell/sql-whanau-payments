-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql_whanau
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_whanau
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_whanau` DEFAULT CHARACTER SET utf8 ;
USE `sql_whanau` ;

-- -----------------------------------------------------
-- Table `sql_whanau`.`payment_brackets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_whanau`.`payment_brackets` (
  `payment_bracket_id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`payment_bracket_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `sql_whanau`.`family_members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_whanau`.`family_members` (
  `family_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `payee` INT NOT NULL,
  `fee` INT NOT NULL,
  PRIMARY KEY (`family_id`),
  INDEX `fk_family_members_family_members_idx` (`payee` ASC) VISIBLE,
  INDEX `fk_family_members_payment_brackets1_idx` (`fee` ASC) VISIBLE,
  CONSTRAINT `fk_family_members_family_members`
    FOREIGN KEY (`payee`)
    REFERENCES `sql_whanau`.`family_members` (`family_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_family_members_payment_brackets1`
    FOREIGN KEY (`fee`)
    REFERENCES `sql_whanau`.`payment_brackets` (`payment_bracket_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `sql_whanau`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_whanau`.`payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(5,2) NOT NULL,
  `date` DATE NOT NULL,
  `family_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payments_family_members1_idx` (`family_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_family_members1`
    FOREIGN KEY (`family_id`)
    REFERENCES `sql_whanau`.`family_members` (`family_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
