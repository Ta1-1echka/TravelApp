CREATE SCHEMA IF NOT EXISTS `traveldb` DEFAULT CHARACTER SET utf8 ;
USE `traveldb` ;

-- -----------------------------------------------------
-- Table `traveldb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`admin` (
  `idadmin` INT(11) NOT NULL,
  `login` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`country` (
  `id_сountry` INT(11) NOT NULL AUTO_INCREMENT,
  `name_сode` VARCHAR(3) NULL DEFAULT NULL,
  `about` LONGTEXT NULL DEFAULT NULL,
  `capital` VARCHAR(45) NULL DEFAULT NULL,
  `climate` LONGTEXT NULL DEFAULT NULL,
  `currency` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id_сountry`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`city` (
  `idCity` INT(11) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `country_idCountry` INT(11) NOT NULL,
  PRIMARY KEY (`idCity`, `country_idCountry`),
  INDEX `fk_city_country1_idx` (`country_idCountry` ASC),
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_idCountry`)
    REFERENCES `traveldb`.`country` (`id_сountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`comment` (
  `idcomment` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(100) NULL DEFAULT NULL,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `tourName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idcomment`))
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
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`country_has_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`country_has_language` (
  `id_country` INT(11) NOT NULL,
  `id_language` INT(11) NOT NULL,
  PRIMARY KEY (`id_country`, `id_language`),
  INDEX `fk_country_has_language_language1_idx` (`id_language` ASC),
  INDEX `fk_country_has_language_country1_idx` (`id_country` ASC),
  CONSTRAINT `FK7u0d7d8windm1db1g1degh346`
    FOREIGN KEY (`id_country`)
    REFERENCES `traveldb`.`country` (`id_сountry`),
  CONSTRAINT `FK9n0jbhjs56a223bg8tcab6j01`
    FOREIGN KEY (`id_language`)
    REFERENCES `traveldb`.`language` (`id_language`),
  CONSTRAINT `fk_country_has_language_country1`
    FOREIGN KEY (`id_country`)
    REFERENCES `traveldb`.`country` (`id_сountry`)
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
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `starAllValue` INT(11) NULL DEFAULT NULL,
  `starCount` INT(11) NULL DEFAULT NULL,
  `idCity` INT(11) NOT NULL,
  PRIMARY KEY (`idHotel`, `idCity`),
  INDEX `fk_hostel_city1_idx` (`idCity` ASC),
  CONSTRAINT `fk_hostel_city1`
    FOREIGN KEY (`idCity`)
    REFERENCES `traveldb`.`city` (`idCity`)
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
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`request` (
  `idrequest` INT(11) NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  `idTour` INT(11) NOT NULL,
  PRIMARY KEY (`idrequest`, `idTour`),
  INDEX `fk_request_tour1_idx` (`idTour` ASC),
  CONSTRAINT `fk_request_tour1`
    FOREIGN KEY (`idTour`)
    REFERENCES `traveldb`.`tour` (`id_tour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `traveldb`.`tourhotelcity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveldb`.`tourhotelcity` (
  `idTourHotelCity` INT(11) NOT NULL,
  `tour_idTour` INT(11) NOT NULL,
  `hotel_idHotel` INT(11) NOT NULL,
  `hotel_idCity` INT(11) NOT NULL,
  PRIMARY KEY (`idTourHotelCity`, `tour_idTour`, `hotel_idHotel`, `hotel_idCity`),
  INDEX `fk_tourHotelCity_tour1_idx` (`tour_idTour` ASC),
  INDEX `fk_tourHotelCity_hotel1_idx` (`hotel_idHotel` ASC, `hotel_idCity` ASC),
  CONSTRAINT `fk_tourHotelCity_hotel1`
    FOREIGN KEY (`hotel_idHotel` , `hotel_idCity`)
    REFERENCES `traveldb`.`hotel` (`idHotel` , `idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tourHotelCity_tour1`
    FOREIGN KEY (`tour_idTour`)
    REFERENCES `traveldb`.`tour` (`id_tour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;