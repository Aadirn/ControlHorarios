
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema controlhorario
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `controlhorario` ;

-- -----------------------------------------------------
-- Schema controlhorario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `controlhorario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `controlhorario` ;

-- -----------------------------------------------------
-- Table `controlhorario`.`direcciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`direcciones` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`direcciones` (
  `numero` INT(11) NULL DEFAULT NULL,
  `calle` VARCHAR(50) NULL DEFAULT NULL,
  `piso` INT(11) NULL DEFAULT NULL,
  `escalera` VARCHAR(1) NULL DEFAULT NULL,
  `letra` VARCHAR(1) NULL DEFAULT NULL,
  `cod_postal` INT(5) NULL DEFAULT NULL,
  `localidad` VARCHAR(50) NULL DEFAULT NULL,
  `provincia` VARCHAR(50) NOT NULL,
  `id_direccion` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `controlhorario`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`empresa` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`empresa` (
  `nombre_empresa` VARCHAR(100) NULL DEFAULT NULL,
  `cif` VARCHAR(9) NULL DEFAULT NULL,
  `codigo_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `domicilio_social` INT(11) NULL DEFAULT NULL,
  `domicilio_fiscal` INT(11) NULL DEFAULT NULL,
  `domicilio_notificaciones` INT(11) NULL DEFAULT NULL,
  `dni` VARCHAR(9) NULL DEFAULT NULL,
  `apellido1` VARCHAR(15) NULL DEFAULT NULL,
  `apellido2` VARCHAR(15) NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `razon_social` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_empresa`),
  INDEX `fk_direccion_social_empresa` (`domicilio_social` ASC) VISIBLE,
  INDEX `fk_direccion_fiscal_empresa` (`domicilio_fiscal` ASC) VISIBLE,
  INDEX `fk_direccion_notificaciones_empresa` (`domicilio_notificaciones` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_fiscal_empresa`
    FOREIGN KEY (`domicilio_fiscal`)
    REFERENCES `controlhorario`.`direcciones` (`id_direccion`),
  CONSTRAINT `fk_direccion_notificaciones_empresa`
    FOREIGN KEY (`domicilio_notificaciones`)
    REFERENCES `controlhorario`.`direcciones` (`id_direccion`),
  CONSTRAINT `fk_direccion_social_empresa`
    FOREIGN KEY (`domicilio_social`)
    REFERENCES `controlhorario`.`direcciones` (`id_direccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `controlhorario`.`centros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`centros` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`centros` (
  `num_centro` INT(11) NOT NULL DEFAULT 1,
  `id_empresa` INT(11) NULL DEFAULT NULL,
  `id_direccion` INT(11) NULL DEFAULT NULL,
  `id_centro_pk` INT(11) NOT NULL,
  PRIMARY KEY (`id_centro_pk`),
  INDEX `fk_centros_empresa` (`id_empresa` ASC) VISIBLE,
  INDEX `fk_direccion_centro` (`id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_centros_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `controlhorario`.`empresa` (`codigo_empresa`),
  CONSTRAINT `fk_direccion_centro`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `controlhorario`.`direcciones` (`id_direccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `controlhorario`.`horas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`horas` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`horas` (
  `tipo_jornada` VARCHAR(50) NULL DEFAULT NULL,
  `h_entrada` TIME NULL DEFAULT NULL,
  `h_salida` TIME NULL DEFAULT NULL,
  `h_entrada_partida` TIME NULL DEFAULT NULL,
  `h_salida_partida` TIME NULL DEFAULT NULL,
  `id_horas` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_horas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `controlhorario`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`empleados` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`empleados` (
  `cod_empleado` INT(11) NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(9) NULL DEFAULT NULL,
  `apellido1` VARCHAR(15) NULL DEFAULT NULL,
  `apellido2` VARCHAR(15) NULL DEFAULT NULL,
  `nombre` VARCHAR(15) NULL DEFAULT NULL,
  `naf` varchar(12) NULL DEFAULT NULL,			#CAMBIO DE INT=>VARCHAR
  `telefono` INT(9) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `id_direccion` INT(11) NULL DEFAULT NULL,
  `tipo_contrato` INT(3) NULL DEFAULT NULL,
  `id_empleados_centro` INT(11) NULL DEFAULT NULL,
  `id_huella_empleados` INT(8) NULL DEFAULT NULL,
  `id_empleados_hora` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`),
  INDEX `fk_direccion_empleados` (`id_direccion` ASC) VISIBLE,
  INDEX `fk_horas_empleados` (`id_empleados_hora` ASC) VISIBLE,
  INDEX `fk_centro_empleados` (`id_empleados_centro` ASC) VISIBLE,
  UNIQUE INDEX `id_huella_empleados_UNIQUE` (`id_huella_empleados` ASC) VISIBLE,
  UNIQUE INDEX `cod_empleado_UNIQUE` (`cod_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_centro_empleados`
    FOREIGN KEY (`id_empleados_centro`)
    REFERENCES `controlhorario`.`centros` (`id_centro_pk`),
  CONSTRAINT `fk_direccion_empleados`
    FOREIGN KEY (`id_direccion`)
    REFERENCES `controlhorario`.`direcciones` (`id_direccion`),
  CONSTRAINT `fk_horas_empleados`
    FOREIGN KEY (`id_empleados_hora`)
    REFERENCES `controlhorario`.`horas` (`id_horas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `controlhorario`.`control_horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controlhorario`.`control_horario` ;

CREATE TABLE IF NOT EXISTS `controlhorario`.`control_horario` (
  `fecha` DATE NOT NULL,
  `hora_entrada` TIME NULL DEFAULT NULL,
  `hora_salida` TIME NULL DEFAULT NULL,
 `hora_entrada2` TIME NULL DEFAULT NULL,
  `hora_salida2` TIME NULL DEFAULT NULL,
  `horas_ordinarias_dia` INT(11) NULL DEFAULT NULL,
  `horas_extra_dia` INT(11) NULL DEFAULT NULL,
  `empleados_cod_empleado` INT(11) NOT NULL,
  PRIMARY KEY (`fecha`, `empleados_cod_empleado`),
  INDEX `fk_control_horario_empleados1_idx` (`empleados_cod_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_control_horario_empleados1`
    FOREIGN KEY (`empleados_cod_empleado`)
    REFERENCES `controlhorario`.`empleados` (`cod_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('18','Calle Real',3,NULL,'E','15001','A Coruña', 'A Coruña', 01);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('43','Calle Sinforiano Lopez',NULL,NULL,NULL,'15005','A Coruña', 'A Coruña', 02);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('7','Avenida Paraiso',0,NULL,NULL,'15112','A Coruña', 'A Coruña', 03);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('25','Calle Penas',1,NULL,'I','15007','A Coruña', 'A Coruña', 04);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('3','Calle Barcelona',2,NULL,'D','15011','A Coruña', 'A Coruña', 05);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('1','Calle Tui',4,NULL,NULL,'27004','Lugo', 'Lugo', 06);
INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('5','Plaza de Santo Domingo',4,NULL,'D','27001','Lugo', 'Lugo', 07);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('5','Calle del padre Sarmiento',7,NULL,'I','15010','A Coruña', 'A Coruña', 08);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('3','Calle Angel Senra',0,NULL,NULL,'15010','A Coruña', 'A Coruña', 09);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('17','Calle Eugenio Carre',6,NULL,'D','15015','A Coruña', 'A Coruña', 10);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('34','Camino del Bosque',5,NULL,'C','15016','A Coruña', 'A Coruña', 11);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('4','Calle de Santo Tomas',4,NULL,NULL,'15002','A Coruña', 'A Coruña', 12);

INSERT INTO controlhorario.direcciones (numero, calle, piso, escalera, letra, cod_postal, localidad, provincia, id_direccion)
VALUES('1','Calle de Santo Tomas',0,NULL,NULL,'15002','A Coruña', 'A Coruña', 13);






INSERT INTO controlhorario.empresa (nombre_empresa, cif, codigo_empresa, domicilio_social, domicilio_fiscal, domicilio_notificaciones, dni, apellido1, apellido2, nombre, razon_social)
VALUES('Castelao','B15123456',01, 01,02,02,NULL,NULL,NULL,NULL,'Castelao S.L.');

INSERT INTO controlhorario.empresa (nombre_empresa, cif, codigo_empresa, domicilio_social, domicilio_fiscal, domicilio_notificaciones, dni, apellido1, apellido2, nombre, razon_social)
VALUES('Pepe S.L.','B13284321',02, 08,09,09,NULL,NULL,NULL,NULL,'Pepe S.L.');




INSERT INTO controlhorario.centros (num_centro,id_empresa, id_direccion, id_centro_pk)
VALUES(01,01,01,01);
INSERT INTO controlhorario.centros (num_centro,id_empresa, id_direccion, id_centro_pk)
VALUES(02,01,07,02);
INSERT INTO controlhorario.centros (num_centro,id_empresa, id_direccion, id_centro_pk)
VALUES(01,02,09,03);
INSERT INTO controlhorario.centros (num_centro,id_empresa, id_direccion, id_centro_pk)
VALUES(02,02,13,04);

INSERT INTO controlhorario.horas (tipo_jornada, h_entrada, h_salida, h_entrada_partida,h_salida_partida, id_horas)
VALUES('Partida','09:00','14:00','16:30','19:30', 02);
INSERT INTO controlhorario.horas (tipo_jornada, h_entrada, h_salida, h_entrada_partida,h_salida_partida, id_horas)
VALUES('Continua','08:00','15:00',NULL,NULL, 01);

INSERT INTO controlhorario.horas (tipo_jornada, h_entrada, h_salida, h_entrada_partida,h_salida_partida, id_horas)
VALUES('Continua','07:00','15:00',NULL,NULL, 03);
INSERT INTO controlhorario.horas (tipo_jornada, h_entrada, h_salida, h_entrada_partida,h_salida_partida, id_horas)
VALUES('Continua','15:00','23:00',NULL,NULL, 04);
INSERT INTO controlhorario.horas (tipo_jornada, h_entrada, h_salida, h_entrada_partida,h_salida_partida, id_horas)
VALUES('Continua','23:00','07:00',NULL,NULL, 05);


INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(01,'32839402W','Santos','Lopez','Gabriel','158888888821','981666333','gabrielsl@gmail.com',03,401,01,01,01);

INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(02,'33808996D','Gotera','Campos','Pepe','153331167883','636636636','pepeGC@gmail.com',04,289,01,02,01);

INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(03,'12345666H','Gomez','Sanchez','Rosa','151234567899','636629543','pulgarcita18@yahoo.es',05,402,01,03,02);

INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(04,'22123789C','Perez','Pardo','Andres','271237778821','982505030','Pardo@yahoo.es',06,410,01,04,02);

INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(05,'44466688K','Lopez','Lopez','Ana','15125125125','678342622','VivalaVida@gmail.org',10,401,3,5,03);
INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(06,'57548288W','Juarez','Lopez','Maria','15292330762','626570057','juarezlopez@gmail.org',11,502,04,6,04); -- Duración determinada a tiempo parcial
INSERT INTO controlhorario.empleados (cod_empleado, dni, apellido1, apellido2, nombre, naf, telefono, email,id_direccion, tipo_contrato, id_empleados_centro, id_huella_empleados, id_empleados_hora)
VALUES(07,'67859731E','Hernandez','Tornasol','Fernando','15132462123','623131415','fernandohernandez@gmail.com',12,289,4,7,05);

-- Entradas de horarios de Gabriel
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','8:01','15:05',NULL,NULL,419,5,1);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','7:59','14:30',NULL,NULL,360,1,1);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','8:00','15:10',NULL,NULL,420,10,1);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','7:48','17:02',NULL,NULL,420,134,1);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','8:30','16:00',NULL,NULL,390,60,1);

-- Entradas de horarios de Pepe
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','7:45','15:00',NULL,NULL,420,15,2);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','7:59','15:00',NULL,NULL,420,1,2);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','9:03','15:05',NULL,NULL,417,5,2);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','7:59','15:03',NULL,NULL,420,4,2);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','8:03','14:55',NULL,NULL,412,10,2);

-- Horas ordinarias/extraordinarias sin calcular de aquí en adelante
-- Horarios de Rosa
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','9:00','14:00','16:30','20:00',477,10,3);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','9:01','13:58','16:29','19:35',477,10,3);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','9:04','14:05','16:29','19:35',477,10,3);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','8:57','14:00','15:45','19:30',477,10,3);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','8:59','14:00','16:15','20:00',477,10,3);

-- Horarios de Andrés
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','8:57','13:51','16:35','19:50',477,10,4);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','9:00','14:05','16:29','18:36',477,10,4);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','9:45','14:00','16:36','19:36',477,10,4);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','9:00','13:59','16:35','19:50',477,10,4);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','9:10','14:15','16:15','20:15',477,10,4);

-- Entradas de horarios de Ana
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','6:58','15:05',NULL,NULL,419,5,5);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','7:05','14:30',NULL,NULL,360,1,5);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','7:02','15:07',NULL,NULL,420,10,5);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','6:45','15:02',NULL,NULL,420,134,5);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','7:30','16:00',NULL,NULL,390,60,5);

-- Horarios de María
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','14:45','23:15',NULL,NULL,419,5,6);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','15:00','23:00',NULL,NULL,360,1,6);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','15:05','22:35',NULL,NULL,420,10,6);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','14:50','00:00',NULL,NULL,420,134,6);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','14:10','00:30',NULL,NULL,390,60,6);
-- Horarios de Fernando
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-1','22:45','6:45',NULL,NULL,419,5,7);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-2','23:00','7:13',NULL,NULL,360,1,7);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-3','22:50','8:30',NULL,NULL,420,10,7);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-4','23:00','7:24',NULL,NULL,420,134,7);
INSERT INTO controlhorario.control_horario (fecha, hora_entrada, hora_salida, hora_entrada2, hora_salida2 , horas_ordinarias_dia, horas_extra_dia,empleados_cod_empleado)
VALUES ('2019-10-5','23:15','9:00',NULL,NULL,390,60,7);
