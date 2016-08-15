-- MySQL Workbench Forward Engineering
-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biometric_project1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biometric_project1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biometric_project1` DEFAULT CHARACTER SET big5 ;
USE `biometric_project1` ;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Bank` (
  `BankId` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `bankTotalbalance` DECIMAL(15) NOT NULL COMMENT '',
  PRIMARY KEY (`BankId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Address` (
  `AddressId` INT NOT NULL COMMENT '',
  `addressLine1` VARCHAR(45) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(45) NOT NULL COMMENT '',
  `street` VARCHAR(45) NOT NULL COMMENT '',
  `city` VARCHAR(45) NOT NULL COMMENT '',
  `zipCode` INT(10) NOT NULL COMMENT '',
  PRIMARY KEY (`AddressId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Branch` (
  `BranchId` INT NOT NULL COMMENT '',
  `BankId` INT NOT NULL COMMENT '',
  `AddressId` INT NOT NULL COMMENT '',
  `branchTotalbalance` DECIMAL(15) NOT NULL COMMENT '',
  `phoneNo` INT(15) NOT NULL COMMENT '',
  PRIMARY KEY (`BranchId`)  COMMENT '',
  CONSTRAINT `BankId`
    FOREIGN KEY (`BankId`)
    REFERENCES `biometric_project1`.`Bank` (`BankId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddressId`
    FOREIGN KEY (`AddressId`)
    REFERENCES `biometric_project1`.`Address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`AccountType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`AccountType` (
  `AccountTypeId` INT NOT NULL COMMENT '',
  `AccountType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`AccountTypeId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Account` (
  `AccountId` INT NOT NULL COMMENT '',
  `balance` DECIMAL(10) NOT NULL COMMENT '',
  `IsJointAccount` TINYINT(1) NULL COMMENT '',
  `openDate` DATE NOT NULL COMMENT '',
  `BranchId` INT NOT NULL COMMENT '',
  `AccountTypeId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`AccountId`)  COMMENT '',
  CONSTRAINT `BranchId`
    FOREIGN KEY (`BranchId`)
    REFERENCES `biometric_project1`.`Branch` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AccountTypeId`
    FOREIGN KEY (`AccountTypeId`)
    REFERENCES `biometric_project1`.`AccountType` (`AccountTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`RetinaScanDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`RetinaScanDetails` (
  `RetinaId` INT(20) NOT NULL COMMENT '',
  `rings` VARCHAR(45) NOT NULL COMMENT '',
  `furrows` VARCHAR(45) NOT NULL COMMENT '',
  `frackles` VARCHAR(45) NOT NULL COMMENT '',
  `corona` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`RetinaId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`FaceRecognitionScanDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`FaceRecognitionScanDetails` (
  `FaceRecognitionId` INT NOT NULL COMMENT '',
  `distanceOfeyes` VARCHAR(45) NOT NULL COMMENT '',
  `distanceOfnose` VARCHAR(45) NOT NULL COMMENT '',
  `mouth` VARCHAR(45) NOT NULL COMMENT '',
  `jawsEdge` VARCHAR(45) NOT NULL COMMENT '',
  `upperLineofEyeSockets` VARCHAR(45) NOT NULL COMMENT '',
  `sidesOfmouth` VARCHAR(45) NOT NULL COMMENT '',
  `areaSurroundingcheekBones` VARCHAR(45) NOT NULL COMMENT '',
  `locationOfnoseAndeyes` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`FaceRecognitionId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`FingerPrintScanDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`FingerPrintScanDetails` (
  `FingerPrintId` INT NOT NULL COMMENT '',
  `ark` VARCHAR(45) NOT NULL COMMENT '',
  `loops` VARCHAR(45) NOT NULL COMMENT '',
  `whorks` VARCHAR(45) NOT NULL COMMENT '',
  `pro` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`FingerPrintId`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`CardDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`CardDetails` (
  `CardNo` INT(20) NOT NULL COMMENT '',
  `CVV` INT NOT NULL COMMENT '',
  `expiryDate` DATE NOT NULL COMMENT '',
  `type` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`CardNo`)  COMMENT '')
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Biometric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Biometric` (
  `BiometricId` INT NOT NULL COMMENT '',
  `RetinaId` INT(20) NOT NULL COMMENT '',
  `FaceRecognitionId` INT(20) NOT NULL COMMENT '',
  `FingerPrintId` INT(20) NOT NULL COMMENT '',
  `CardNo` INT(20) NOT NULL COMMENT '',
  PRIMARY KEY (`BiometricId`)  COMMENT '',
  INDEX `RetinaId` (`RetinaId` ASC)  COMMENT '',
  INDEX `FaceRecognitionId` (`FaceRecognitionId` ASC)  COMMENT '',
  INDEX `FingerPrintId` (`FingerPrintId` ASC, `CardNo` ASC)  COMMENT '',
  INDEX `CardNo` (`CardNo` ASC, `RetinaId` ASC)  COMMENT '',
  CONSTRAINT `RetinaId`
    FOREIGN KEY (`RetinaId`)
    REFERENCES `biometric_project1`.`RetinaScanDetails` (`RetinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FaceRecognitionId`
    FOREIGN KEY (`FaceRecognitionId`)
    REFERENCES `biometric_project1`.`FaceRecognitionScanDetails` (`FaceRecognitionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FingerPrintId`
    FOREIGN KEY (`FingerPrintId`)
    REFERENCES `biometric_project1`.`FingerPrintScanDetails` (`FingerPrintId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CardNo`
    FOREIGN KEY (`CardNo`)
    REFERENCES `biometric_project1`.`CardDetails` (`CardNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Customer` (
  `CustomerId` INT NOT NULL COMMENT '',
  `firstName` VARCHAR(45) NOT NULL COMMENT '',
  `middleName` VARCHAR(45) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `DOB` DATE NOT NULL COMMENT '',
  `customerAddressId` INT NOT NULL COMMENT '',
  `Gender` VARCHAR(6) NOT NULL COMMENT '',
  `contactDetails` INT(15) NOT NULL COMMENT '',
  `emailId` VARCHAR(20) NOT NULL COMMENT '',
  `age` INT NOT NULL COMMENT '',
  `BiometricId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`CustomerId`)  COMMENT '',
  CONSTRAINT `customerAddressId`
    FOREIGN KEY (`customerAddressId`)
    REFERENCES `biometric_project1`.`Address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BiometricId`
    FOREIGN KEY (`BiometricId`)
    REFERENCES `biometric_project1`.`Biometric` (`BiometricId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`CustomerAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`CustomerAccount` (
  `CustomerId` INT NOT NULL COMMENT '',
  `AccountId` INT NOT NULL COMMENT '',
  CONSTRAINT `AccountId`
    FOREIGN KEY (`AccountId`)
    REFERENCES `biometric_project1`.`Account` (`AccountId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `biometric_project1`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Employee` (
  `EmployeeId` INT NOT NULL COMMENT '',
  `firstName` VARCHAR(20) NOT NULL COMMENT '',
  `middleName` VARCHAR(45) NULL COMMENT '',
  `lastName` VARCHAR(45) NULL COMMENT '',
  `employeeAddressId` INT NOT NULL COMMENT '',
  `contactDetails` VARCHAR(45) NOT NULL COMMENT '',
  `designation` VARCHAR(45) NOT NULL COMMENT '',
  `emailId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`EmployeeId`)  COMMENT '',
  CONSTRAINT `employeeAddressId`
    FOREIGN KEY (`employeeAddressId`)
    REFERENCES `biometric_project1`.`Address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`EmployeeBranch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`EmployeeBranch` (
  `bankEmployeeId` INT NOT NULL COMMENT '',
  `bankBranchId` INT NOT NULL COMMENT '',
  CONSTRAINT `bankEmployeeId`
    FOREIGN KEY (`bankEmployeeId`)
    REFERENCES `biometric_project1`.`Employee` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bankBranchId`
    FOREIGN KEY (`bankBranchId`)
    REFERENCES `biometric_project1`.`Branch` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Nominee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Nominee` (
  `nomineeId` INT NOT NULL COMMENT '',
  `firstname` VARCHAR(45) NOT NULL COMMENT '',
  `middleName` VARCHAR(45) NOT NULL COMMENT '',
  `lastName` VARCHAR(45) NOT NULL COMMENT '',
  `contactDetails` VARCHAR(45) NOT NULL COMMENT '',
  `nomineeAddressId` INT NOT NULL COMMENT '',
  `emailId` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`nomineeId`)  COMMENT '',
  CONSTRAINT `nomineeAddressId`
    FOREIGN KEY (`nomineeAddressId`)
    REFERENCES `biometric_project1`.`Address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`AccountNominee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`AccountNominee` (
  `customerAccountId` INT NOT NULL COMMENT '',
  `customerNomineeId` INT NOT NULL COMMENT '',
  CONSTRAINT `customerAccountId`
    FOREIGN KEY (`customerAccountId`)
    REFERENCES `biometric_project1`.`Account` (`AccountId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerNomineeId`
    FOREIGN KEY (`customerNomineeId`)
    REFERENCES `biometric_project1`.`Nominee` (`nomineeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `biometric_project1`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`Transaction` (
  `transactionId` INT(11) NOT NULL COMMENT '',
  `transactionAccountId` INT NULL COMMENT '',
  `amount` DECIMAL(15,0) NOT NULL COMMENT '',
  `date` DATETIME NOT NULL COMMENT '',
  `status` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`transactionId`)  COMMENT '',
  INDEX `transactionAccountId_idx` (`transactionAccountId` ASC)  COMMENT '',
  CONSTRAINT `transactionAccountId`
    FOREIGN KEY (`transactionAccountId`)
    REFERENCES `biometric_project1`.`account` (`AccountId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;
-- -----------------------------------------------------
-- Table `biometric_project1`.`TransactionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biometric_project1`.`TransactionType` (
   `customerTransactionId` INT(11) NOT NULL COMMENT '',
  `transactionType` VARCHAR(45) NOT NULL COMMENT '',
  INDEX `customerTransactionId` (`customerTransactionId` ASC)  COMMENT '',
  CONSTRAINT `customerTransactionId`
    FOREIGN KEY (`customerTransactionId`)
    REFERENCES `biometric_project1`.`transaction` (`transactionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;
