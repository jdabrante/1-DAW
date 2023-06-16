DROP TABLE empleados;
CREATE TABLE empleados (
    documento char(8) NOT NULl PRIMARY KEY,
    nombre varchar(20) DEFAULT NULL,
    apellido varchar(20) DEFAULT NULL,
    sueldo decimal(6,2) DEFAULT NULL,
    cantidadhijos int DEFAULT NULL,
    seccion varchar(20) DEFAULT NULL
);

INSERT INTO empleados VALUES ('22222222', 'Juan', 'Perez', 300.00, 2, 'Contaduria');
INSERT INTO empleados VALUES ('22333333', 'Luis', 'Lopez', 300.00, 1, 'Contaduria');
INSERT INTO empleados VALUES ('22444444', 'Marta', 'Perez', 500.00, 1, 'Sistemas');
INSERT INTO empleados VALUES ('22555555', 'Susana', 'Garcia', 400.00, 2, 'Secretaria');
INSERT INTO empleados VALUES ('22666666', 'Jose Maria', 'Morales', 400.00, 3, 'Secretaria');

DELIMITER $$ 
DROP PROCEDURE IF EXISTS pa_empleados_sueldo()$$
CREATE PROCEDURE pa_empleados_sueldo
BEGIN 
    SELECT nombre FROM empleados;
END
$$

DELIMITER $$
CALL pa_empleados_sueldo();
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS pa_empleados_hijos()$$
CREATE PROCEDURE pa_empleados_hijos(in numero_hijos int)
BEGIN
    SELECT nombre, apellido, cantidadhijos FROM empleados where cantidadhijos > numero_hijos;
END
$$

DELIMITER $$
CALL pa_empleados_hijos(0);
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_hijos()$$
CREATE PROCEDURE actualizar_hijos(
    in nombre_empleado varchar(20), 
    in nueva_cantidad_hijos int, 
    in filtro_numero_hijos int)
BEGIN
    UPDATE empleados SET cantidadhijos=nueva_cantidad_hijos 
    where nombre=nombre_empleado 
    and cantidadhijos > filtro_numero_hijos;
END
$$







