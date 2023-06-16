CREATE DATABASE salario;
USE salario;

CREATE TABLE persona(
    identificador int AUTO_INCREMENT,
    nombre varchar(20),
    salario_base int, 
    subsidio int DEFAULT 0,
    salud int DEFAULT 0,
    pension int DEFAULT 0,
    bono int DEFAULT 0,
    integral int DEFAULT 0, -- Se puede hacer como una property
    PRIMARY KEY (identificador)
);

-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("1","Juan",1600);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("2","Markus",1640);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("3","Luis",1700);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("4","Kevin",1090);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("5","Noelia",1800);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("6","Elena",1050);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("7","Verónica",1630);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("8","Marcos",1640);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("9","Jairo",1500);
-- INSERT INTO persona (identificador,nombre,salario_base)VALUES  ("10","Ivan",1200);

DELIMITER //
DROP PROCEDURE IF EXISTS insertar//
CREATE PROCEDURE insertar(in numero int, in nombre  varchar(20))
BEGIN
    DECLARE salario_base int;
    DECLARE nombre_insertar varchar(20);
    DECLARE contador int;
    DECLARE random int;
    SET random = RAND() * 100;
    SET contador = 0;
    WHILE (contador <= numero) do
        SET nombre_insertar = CONCAT(nombre,random);
        SET salario_base = (contador + 1) * 1000;
        INSERT INTO persona (nombre,salario_base) VALUES (nombre_insertar, salario_base);
        SET contador = contador + 1;
        SET random = RAND() * 100;
    END WHILE;
END
//

CALL insertar(10,"Pepe");
//

-- +---------------+--------+--------------+----------+-------+---------+------+----------+
-- | identificador | nombre | salario_base | subsidio | salud | pension | bono | integral |
-- +---------------+--------+--------------+----------+-------+---------+------+----------+
-- |             1 | Pepe0  |         1000 |        0 |     0 |       0 |    0 |        0 |
-- |             2 | Pepe1  |         2000 |        0 |     0 |       0 |    0 |        0 |
-- |             3 | Pepe2  |         3000 |        0 |     0 |       0 |    0 |        0 |
-- |             4 | Pepe3  |         4000 |        0 |     0 |       0 |    0 |        0 |
-- |             5 | Pepe4  |         5000 |        0 |     0 |       0 |    0 |        0 |
-- |             6 | Pepe5  |         6000 |        0 |     0 |       0 |    0 |        0 |
-- |             7 | Pepe6  |         7000 |        0 |     0 |       0 |    0 |        0 |
-- |             8 | Pepe7  |         8000 |        0 |     0 |       0 |    0 |        0 |
-- |             9 | Pepe8  |         9000 |        0 |     0 |       0 |    0 |        0 |
-- |            10 | Pepe9  |        10000 |        0 |     0 |       0 |    0 |        0 |
-- |            11 | Pepe10 |        11000 |        0 |     0 |       0 |    0 |        0 |
-- +---------------+--------+--------------+----------+-------+---------+------+----------+

DELIMITER //
DROP FUNCTION IF EXISTS calculo//
CREATE FUNCTION calculo(porcentaje int, salario_base int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE resultado FLOAT;
    SET resultado = salario_base * (porcentaje/100);
    RETURN resultado;
END
//

DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte //
CREATE FUNCTION subsidio_transporte(id int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE calculo_subsidio int;
    SET calculo_subsidio = calculo(7,(SELECT salario_base FROM persona WHERE identificador=id));
    UPDATE persona SET subsidio = calculo_subsidio WHERE identificador = id;
    RETURN calculo_subsidio;
END
//

DELIMITER //
SELECT subsidio_transporte(1)//

DELIMITER //
DROP FUNCTION IF EXISTS salud //
CREATE FUNCTION salud(id int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE calculo_salud int;
    SET calculo_salud = calculo(4,(SELECT salario_base FROM persona WHERE identificador=id));
    UPDATE persona SET salud = calculo_salud WHERE identificador = id;
    RETURN calculo_salud;
END
//

DELIMITER //
SELECT salud(1) as salud//



DELIMITER //
DROP FUNCTION IF EXISTS pension //
CREATE FUNCTION pension(id int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE calculo_pension int;
    SET calculo_pension = calculo(4,(SELECT salario_base FROM persona WHERE identificador=id));
    UPDATE persona SET pension = calculo_pension WHERE identificador = id;
    RETURN calculo_pension;
END
//

DELIMITER //
SELECT pension(1)//

DELIMITER //
DROP FUNCTION IF EXISTS bono //
CREATE FUNCTION bono(id int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE calculo_bono int;
    SET calculo_bono = calculo(8,(SELECT salario_base FROM persona WHERE identificador=id));
    UPDATE persona SET bono = calculo_bono WHERE identificador = id;
    RETURN calculo_bono;
END
//

DELIMITER //
SELECT bono(1)//

DELIMITER //
DROP FUNCTION IF EXISTS integral //
CREATE FUNCTION integral(id int) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE calculo_integral int;
    DECLARE obtener_salario_base int;
    SET obtener_salario_base = (SELECT salario_base FROM persona WHERE identificador=id);
    SET calculo_integral = (obtener_salario_base - (SELECT salud(id)) - (SELECT pension(id)) + (SELECT bono(id)) + (SELECT subsidio_transporte(id)));
    UPDATE persona SET integral = calculo_integral WHERE identificador = id;
    RETURN calculo_integral;
END
//

DELIMITER //
SELECT integral(1)//

-- +---------------+--------+--------------+----------+-------+---------+------+----------+
-- | identificador | nombre | salario_base | subsidio | salud | pension | bono | integral |
-- +---------------+--------+--------------+----------+-------+---------+------+----------+
-- |             1 | Pepe43 |         1000 |       70 |    40 |      40 |   80 |     1070 |
-- |             2 | Pepe77 |         2000 |        0 |     0 |       0 |    0 |        0 |
-- |             3 | Pepe54 |         3000 |        0 |     0 |       0 |    0 |        0 |
-- |             4 | Pepe42 |         4000 |        0 |     0 |       0 |    0 |        0 |
-- |             5 | Pepe45 |         5000 |        0 |     0 |       0 |    0 |        0 |
-- |             6 | Pepe99 |         6000 |        0 |     0 |       0 |    0 |        0 |
-- |             7 | Pepe59 |         7000 |        0 |     0 |       0 |    0 |        0 |
-- |             8 | Pepe98 |         8000 |        0 |     0 |       0 |    0 |        0 |
-- |             9 | Pepe13 |         9000 |        0 |     0 |       0 |    0 |        0 |
-- |            10 | Pepe70 |        10000 |        0 |     0 |       0 |    0 |        0 |
-- |            11 | Pepe12 |        11000 |        0 |     0 |       0 |    0 |        0 |
-- |            12 | Pepe22 |         1000 |        0 |     0 |       0 |    0 |        0 |
-- |            13 | Pepe53 |         2000 |        0 |     0 |       0 |    0 |        0 |
-- |            14 | Pepe1  |         3000 |        0 |     0 |       0 |    0 |        0 |
-- |            15 | Pepe45 |         4000 |        0 |     0 |       0 |    0 |        0 |
-- |            16 | Pepe20 |         5000 |        0 |     0 |       0 |    0 |        0 |
-- |            17 | Pepe68 |         6000 |        0 |     0 |       0 |    0 |        0 |
-- |            18 | Pepe80 |         7000 |        0 |     0 |       0 |    0 |        0 |
-- |            19 | Pepe93 |         8000 |        0 |     0 |       0 |    0 |        0 |
-- |            20 | Pepe28 |         9000 |        0 |     0 |       0 |    0 |        0 |
-- +---------------+--------+--------------+----------+-------+---------+------+----------+