DROP DATABASE ejercicio6;
CREATE DATABASE ejercicio6;
USE ejercicio6;

CREATE TABLE empleado(
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    salario_base DECIMAL(6,2),
    subsidio_transporte DECIMAL(6,2),
    salud DECIMAL(6,2),
    pension DECIMAL(6,2),
    bono DECIMAL(6,2),
    integral DECIMAL(6,2)
);

DROP TRIGGER IF EXISTS rellenar_subsidios $$
CREATE TRIGGER rellenar_subsidios BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
    SET NEW.subsidio_transporte =  NEW.salario_base * 0.07;
    SET NEW.salud = NEW.salario_base * 0.04;
    SET NEW.pension = NEW.salario_base * 0.04;
    SET NEW.bono = NEW.salario_base * 0.08;
    SET NEW.integral = (NEW.salario_base - NEW.salud - NEW.pension + NEW.bono + NEW.subsidio_transporte);
END
$$

DELIMITER $$

DROP PROCEDURE IF EXISTS insertar_empleados $$
CREATE PROCEDURE insertar_empleados(IN cantidad INT)
BEGIN
    DECLARE _dni VARCHAR(9);
    DECLARE _nombre VARCHAR(20);
    DECLARE _salario_base DECIMAL(6,2);
    DECLARE contador INT;
    CREATE TABLE tabla_auxiliar (
        nombre_aux VARCHAR(20)
    );
    INSERT INTO tabla_auxiliar VALUES('Pedro');
    INSERT INTO tabla_auxiliar VALUES('Dimas');
    INSERT INTO tabla_auxiliar VALUES('Noelia');
    INSERT INTO tabla_auxiliar VALUES('Alba');
    SET contador = 0;
    WHILE (contador < cantidad) DO
        SET _dni = LPAD((SELECT FLOOR(RAND() * 10000000)),8,0);
        IF NOT EXISTS(SELECT * FROM empleado WHERE dni = _dni) THEN
            SET _nombre = (SELECT nombre_aux FROM tabla_auxiliar ORDER BY RAND() LIMIT 1);
            SET _salario_base = (SELECT ROUND((RAND()* 2000),2));
            INSERT INTO empleado(dni,nombre,salario_base) VALUES(_dni,_nombre,_salario_base);
            SET contador = contador + 1;
        END IF;
    END WHILE;
    DROP TABLE tabla_auxiliar;
END
$$

CREATE TABLE historial (
    dni VARCHAR(9),
    nombre VARCHAR(20),
    salario_base DECIMAL(6,2)
);


CREATE TRIGGER GUARDAR_AI AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO historial VALUES(NEW.dni,NEW.nombre,NEW.salario_base);
END
$$