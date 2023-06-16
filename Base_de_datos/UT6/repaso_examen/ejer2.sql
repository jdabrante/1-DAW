CREATE DATABASE empresa;
USE empresa;

CREATE TABLE empleados (
    documento int AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) DEFAULT NULL,
    apellido VARCHAR(20) DEFAULT NULL,
    sueldo DECIMAL (6,2) DEFAULT NULL,
    cantidad_hijos INT DEFAULT NULL,
    serccion VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (documento)
);

CREATE TABLE nombre_auxiliar(
    nombre VARCHAR(20)
);

INSERT INTO nombre_auxiliar VALUES("Juan");
INSERT INTO nombre_auxiliar VALUES("Alfonso");
INSERT INTO nombre_auxiliar VALUES("Dimas");
INSERT INTO nombre_auxiliar VALUES("Noelia");
INSERT INTO nombre_auxiliar VALUES("Elena");

CREATE TABLE apellido_auxiliar(
    apellido VARCHAR(20)
);

INSERT INTO apellido_auxiliar VALUES("Pérez");
INSERT INTO apellido_auxiliar VALUES("Abrante");
INSERT INTO apellido_auxiliar VALUES("Hernández");
INSERT INTO apellido_auxiliar VALUES("Mesa");
INSERT INTO apellido_auxiliar VALUES("Carrillo");

CREATE TABLE seccion_auxiliar(
    nombre_seccion VARCHAR(20)
);

INSERT INTO seccion_auxiliar VALUES ("Lengua");
INSERT INTO seccion_auxiliar VALUES ("Biologia");
INSERT INTO seccion_auxiliar VALUES ("Matematicas");
INSERT INTO seccion_auxiliar VALUES ("Ingles");
INSERT INTO seccion_auxiliar VALUES ("Tecnologia");



DELIMITER //
DROP PROCEDURE IF EXISTS insertar_empleados //
CREATE PROCEDURE insertar_empleados(in cantidad int)
BEGIN
    DECLARE contador int;
    DECLARE sueldo_empleado int;
    DECLARE hijo_empleado int;
    DECLARE nombre_empleado VARCHAR(20);
    DECLARE apellido_empleado VARCHAR(20);
    DECLARE seccion_empleado VARCHAR(20);
    SET contador = 0;
    WHILE (cantidad > contador) DO
        SET sueldo_empleado = ((contador + 1) * (RAND() * 100));
        SET hijo_empleado = (10 * RAND());
        SET nombre_empleado = (SELECT nombre FROM nombre_auxiliar ORDER BY RAND() LIMIT 1);
        SET apellido_empleado = (SELECT apellido FROM apellido_auxiliar ORDER BY RAND() LIMIT 1);
        SET seccion_empleado = (SELECT nombre_seccion FROM seccion_auxiliar ORDER BY RAND() LIMIT 1);
        INSERT INTO empleados(nombre,apellido,sueldo,cantidad_hijos,serccion) VALUES(nombre_empleado,apellido_empleado,sueldo_empleado,hijo_empleado,seccion_empleado);
        SET contador = contador + 1;
    END WHILE;
END
//

CALL insertar_empleados(20)//

-- +-----------+---------+------------+---------+----------------+-------------+
-- | documento | nombre  | apellido   | sueldo  | cantidad_hijos | serccion    |
-- +-----------+---------+------------+---------+----------------+-------------+
-- |         1 | Alfonso | Mesa       |   57.00 |              3 | Tecnologia  |
-- |         2 | Juan    | Carrillo   |  103.00 |              6 | Ingles      |
-- |         3 | Elena   | Abrante    |  141.00 |              1 | Lengua      |
-- |         4 | Alfonso | Hernández  |  386.00 |              2 | Ingles      |
-- |         5 | Elena   | Carrillo   |   13.00 |              2 | Biologia    |
-- |         6 | Dimas   | Pérez      |  135.00 |              3 | Biologia    |
-- |         7 | Juan    | Hernández  |  187.00 |              8 | Lengua      |
-- |         8 | Dimas   | Hernández  |  404.00 |              5 | Ingles      |
-- |         9 | Juan    | Mesa       |  599.00 |              8 | Tecnologia  |
-- |        10 | Alfonso | Abrante    |  461.00 |              8 | Biologia    |
-- |        11 | Elena   | Abrante    |  839.00 |              0 | Tecnologia  |
-- |        12 | Noelia  | Mesa       | 1000.00 |              8 | Lengua      |
-- |        13 | Noelia  | Pérez      |  548.00 |              1 | Tecnologia  |
-- |        14 | Juan    | Carrillo   |  215.00 |              3 | Tecnologia  |
-- |        15 | Dimas   | Carrillo   |   82.00 |              3 | Lengua      |
-- |        16 | Noelia  | Hernández  |  869.00 |              7 | Lengua      |
-- |        17 | Elena   | Abrante    | 1234.00 |              1 | Matematicas |
-- |        18 | Elena   | Abrante    | 1430.00 |              4 | Biologia    |
-- |        19 | Elena   | Pérez      |  464.00 |              5 | Biologia    |
-- |        20 | Juan    | Abrante    |  639.00 |              2 | Lengua      |
-- +-----------+---------+------------+---------+----------------+-------------+

DELIMITER //
DROP FUNCTION IF EXISTS pa_empleados_sueldo//
CREATE FUNCTION pa_empleados_sueldo(id int) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN (SELECT CONCAT(nombre," ",apellido) FROM empleados WHERE documento=id);
END
//

SELECT pa_empleados_sueldo(15) as empleado//

DELIMITER //
DROP PROCEDURE IF EXISTS anyadir_hijos//
CREATE PROCEDURE anyadir_hijos()
BEGIN
    DECLARE contador int;
    DECLARE cantidad_empleados int;
    DECLARE id_emeplado int;
    SET cantidad_empleados = (SELECT count(*) FROM empleados);
    SET contador = 0;
    SET id_emeplado = 1;
    
    WHILE (cantidad_empleados > contador) DO
        IF (SELECT cantidad_hijos FROM empleados WHERE documento=id_emeplado) <= 0 then
            UPDATE empleados SET cantidad_hijos=(RAND()* 10) WHERE documento=id_emeplado;
        END IF;
        SET contador = contador + 1;
        SET id_emeplado = id_emeplado + 1;
    END WHILE;
END
//

CALL anyadir_hijos()//

-- +-----------+---------+------------+---------+----------------+-------------+
-- | documento | nombre  | apellido   | sueldo  | cantidad_hijos | serccion    |
-- +-----------+---------+------------+---------+----------------+-------------+
-- |         1 | Alfonso | Mesa       |   57.00 |              3 | Tecnologia  |
-- |         2 | Juan    | Carrillo   |  103.00 |              6 | Ingles      |
-- |         3 | Elena   | Abrante    |  141.00 |              1 | Lengua      |
-- |         4 | Alfonso | Hernández  |  386.00 |              2 | Ingles      |
-- |         5 | Elena   | Carrillo   |   13.00 |              2 | Biologia    |
-- |         6 | Dimas   | Pérez      |  135.00 |              3 | Biologia    |
-- |         7 | Juan    | Hernández  |  187.00 |              8 | Lengua      |
-- |         8 | Dimas   | Hernández  |  404.00 |              5 | Ingles      |
-- |         9 | Juan    | Mesa       |  599.00 |              8 | Tecnologia  |
-- |        10 | Alfonso | Abrante    |  461.00 |              8 | Biologia    |
-- |        11 | Elena   | Abrante    |  839.00 |              5 | Tecnologia  |
-- |        12 | Noelia  | Mesa       | 1000.00 |              8 | Lengua      |
-- |        13 | Noelia  | Pérez      |  548.00 |              1 | Tecnologia  |
-- |        14 | Juan    | Carrillo   |  215.00 |              3 | Tecnologia  |
-- |        15 | Dimas   | Carrillo   |   82.00 |              3 | Lengua      |
-- |        16 | Noelia  | Hernández  |  869.00 |              7 | Lengua      |
-- |        17 | Elena   | Abrante    | 1234.00 |              1 | Matematicas |
-- |        18 | Elena   | Abrante    | 1430.00 |              4 | Biologia    |
-- |        19 | Elena   | Pérez      |  464.00 |              5 | Biologia    |
-- |        20 | Juan    | Abrante    |  639.00 |              2 | Lengua      |
-- +-----------+---------+------------+---------+----------------+-------------+