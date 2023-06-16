CREATE DATABASE prueba ;
USE prueba; 

CREATE TABLE persona (
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20)
);

CREATE TABLE respaldo (
    o_dni VARCHAR(9),
    n_dni VARCHAR(9),
    o_nombre VARCHAR(20),
    n_nombre VARCHAR(20),
    o_apellido1 VARCHAR(20),
    n_apellido1 VARCHAR(20),
    o_apellido2 VARCHAR(20),
    n_apellido2 VARCHAR(20),
    fecha DATETIME
);

DELIMITER $$
CREATE TRIGGER PERSONA_BU BEFORE UPDATE ON persona
FOR EACH ROW
BEGIN
    INSERT INTO respaldo VALUES(OLD.dni, NEW.dni, OLD.nombre, NEW.nombre, OLD.apellido1, NEW.apellido1, OLD.apellido2, NEW.apellido2, CURDATE());
END
$$


CREATE TABLE respaldo2 (
    dni VARCHAR(9),
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    fecha DATETIME
);

DELIMITER $$
CREATE TRIGGER PERSONA_BD BEFORE DELETE ON persona
FOR EACH ROW
BEGIN
    INSERT INTO respaldo2 VALUES(OLD.dni, OLD.nombre, OLD.apellido1, OLD.apellido2, CURDATE());
END
$$

