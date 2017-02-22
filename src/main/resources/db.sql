DROP SCHEMA IF EXISTS `traveldb`;
CREATE SCHEMA IF NOT EXISTS `traveldb` DEFAULT CHARACTER SET utf8 ;
USE `traveldb` ;

-- -----------------------------------------------------
-- Table `traveldb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`country` (
  `id_country` INT(11) NOT NULL AUTO_INCREMENT,
  `name_сode` VARCHAR(3) NULL DEFAULT NULL,
  `about` LONGTEXT NULL DEFAULT NULL,
  `capital` VARCHAR(45) NULL DEFAULT NULL,
  `climate` LONGTEXT NULL DEFAULT NULL,
  `currency` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id_country`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`city` (
  `id_city` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `id_country` INT(11) NOT NULL,
  PRIMARY KEY (`id_city`, `id_country`),
  INDEX `fk_city_country1_idx` (`id_country` ASC),
  CONSTRAINT `fk_city_country1`
  FOREIGN KEY (`id_country`)
  REFERENCES `traveldb`.`country` (`id_country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`comment` (
  `id_comment` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NULL DEFAULT NULL,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `tourName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_comment`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`language` (
  `id_language` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_language`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`country_has_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`country_has_language` (
  `id_country` INT(11) NOT NULL,
  `id_language` INT(11) NOT NULL,
  PRIMARY KEY (`id_country`, `id_language`),
  INDEX `fk_country_has_language_country1_idx` (`id_country` ASC),
  CONSTRAINT `fk_country_has_language_country1`
  FOREIGN KEY (`id_country`)
  REFERENCES `traveldb`.`country` (`id_country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_has_language_language1`
  FOREIGN KEY (`id_language`)
  REFERENCES `traveldb`.`language` (`id_language`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`hotel` (
  `id_hotel` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `star_all_value` INT(11) NULL DEFAULT NULL,
  `star_count` INT(11) NULL DEFAULT NULL,
  `id_city` INT(11) NOT NULL,
  PRIMARY KEY (`id_hotel`, `id_city`),
  INDEX `fk_hotel_city1_idx` (`id_city` ASC),
  CONSTRAINT `fk_hotel_city1`
  FOREIGN KEY (`id_city`)
  REFERENCES `traveldb`.`city` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`tour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`tour` (
  `id_tour` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  `date_from` DATE NULL DEFAULT NULL,
  `date_to` DATE NULL DEFAULT NULL,
  `date_out` DATE NULL DEFAULT NULL,
  `date_back` DATE NULL DEFAULT NULL,
  `count_all_places` INT(11) NULL DEFAULT NULL,
  `count_free_places` INT(11) NULL DEFAULT NULL,
  `price_adult` DOUBLE NULL DEFAULT NULL,
  `price_child` DOUBLE NULL DEFAULT NULL,
  `about` LONGTEXT NULL DEFAULT NULL,
  `photo` VARCHAR(255) NULL DEFAULT NULL,
  `feed_type` ENUM('RO', 'BB', 'HB', 'FB', 'AI', 'UAI') NULL DEFAULT NULL,
  `transport` ENUM('bus', 'airplane', 'train', 'liner') NULL DEFAULT NULL,
  PRIMARY KEY (`id_tour`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`request` (
  `id_request` INT(11) NOT NULL AUTO_INCREMENT,
  `name_user` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  `idTour` INT(11) NOT NULL,
  PRIMARY KEY (`id_request`, `idTour`),
  INDEX `fk_request_tour1_idx` (`idTour` ASC),
  CONSTRAINT `fk_request_tour1`
  FOREIGN KEY (`idTour`)
  REFERENCES `traveldb`.`tour` (`id_tour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`tour_has_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`tour_has_hotel` (
  `tour_id_tour` INT(11) NOT NULL,
  `hotel_id_hotel` INT(11) NOT NULL,
  PRIMARY KEY (`tour_id_tour`, `hotel_id_hotel`),
  INDEX `fk_tour_has_hotel_hotel1_idx` (`hotel_id_hotel` ASC),
  INDEX `fk_tour_has_hotel_tour1_idx` (`tour_id_tour` ASC),
  CONSTRAINT `fk_tour_has_hotel_tour1`
  FOREIGN KEY (`tour_id_tour`)
  REFERENCES `traveldb`.`tour` (`id_tour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tour_has_hotel_hotel1`
  FOREIGN KEY (`hotel_id_hotel`)
  REFERENCES `traveldb`.`hotel` (`id_hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;