-- Creación de tablas

CREATE TABLE empleados (
    documento char(8) NOT NULL,
    nombre VARCHAR(20) DEFAULT NULL,
    apellido VARCHAR(20) DEFAULT NULL,
    sueldo DECIMAL(6,2) DEFAULT NULL,
    cantidadhijos INT DEFAULT NULL,
    seccion VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (documento)
);

-- Inserción de datos

INSERT INTO empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion) VALUES('22222222','Juan','Perez',300.00,2,'Contaduria');
INSERT INTO empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion) VALUES('22333333','Luis','Lopez',300.00,1,'Contaduria');
INSERT INTO empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion) VALUES('22444444','Marta','Perez',500.00,1,'Sistemas');
INSERT INTO empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion) VALUES('22555555','Susana','Garcia',400.00,2,'Secretaria');
INSERT INTO empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion) VALUES('22666666','Jose Maria','Morales',400.00,3,'Secretaria');

-- Procedimientos

DELIMITER $$
DROP PROCEDURE IF EXISTS pa_empleados_sueldo $$
CREATE PROCEDURE pa_empleados_sueldo(IN empleado_id VARCHAR(20))
BEGIN
    SELECT nombre into _nombre,apellido into_ apellido FROM empleados WHERE documento = empleado_id;
END
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS pa_empleados_hijos $$
CREATE PROCEDURE pa_empleados_hijos(IN empleado_id VARCHAR(20))
BEGIN
    SELECT nombre, apellido, cantidadhijos FROM empleados WHERE documento = empleado_id;
END
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_hijos $$
CREATE PROCEDURE actualizar_hijos()
BEGIN 
    UPDATE empleados SET cantidadhijos = cantidadhijos + 4 WHERE cantidadhijos is not NULL;
END
$$
