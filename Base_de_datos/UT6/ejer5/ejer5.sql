CREATE TABLE persona (
    identificador varchar(20) NOT NULL,
    nombre varchar(20),
    salario_base int,
    PRIMARY KEY (identificador)
);

INSERT INTO persona VALUES  ("1","Juan",1600);
INSERT INTO persona VALUES  ("2","Markus",1640);
INSERT INTO persona VALUES  ("3","Luis",1700);
INSERT INTO persona VALUES  ("4","Kevin",1090);
INSERT INTO persona VALUES  ("5","Noelia",1800);
INSERT INTO persona VALUES  ("6","Elena",1050);
INSERT INTO persona VALUES  ("7","Verónica",1630);
INSERT INTO persona VALUES  ("8","Marcos",1640);
INSERT INTO persona VALUES  ("9","Jairo",1500);
INSERT INTO persona VALUES  ("10","Ivan",1200);

-- +---------------+-----------+--------------+
-- | identificador | nombre    | salario_base |
-- +---------------+-----------+--------------+
-- | 1             | Juan      |         1600 |
-- | 10            | Ivan      |         1200 |
-- | 2             | Markus    |         1640 |
-- | 3             | Luis      |         1700 |
-- | 4             | Kevin     |         1090 |
-- | 5             | Noelia    |         1800 |
-- | 6             | Elena     |         1050 |
-- | 7             | Verónica  |         1630 |
-- | 8             | Marcos    |         1640 |
-- | 9             | Jairo     |         1500 |
-- +---------------+-----------+--------------+


DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte //
CREATE FUNCTION subsidio_transporte(id VARCHAR(20)) RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL (6,2);
    DECLARE salario_base_persona DECIMAL (6,2);
    SET salario_base_persona = (SELECT salario_base FROM persona WHERE identificador = id);
    SET resultado = salario_base_persona * 0.07;
    RETURN resultado;
END
//

SELECT subsidio_transporte("1")//

-- +--------------------------+
-- | subsidio_transporte("1") |
-- +--------------------------+
-- |                   112.00 |
-- +--------------------------+

DELIMITER //
DROP FUNCTION IF EXISTS salud //
CREATE FUNCTION salud(id VARCHAR(20)) RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL (6,2);
    DECLARE salario_base_persona DECIMAL (6,2);
    SET salario_base_persona = (SELECT salario_base FROM persona WHERE identificador = id);
    SET resultado = salario_base_persona * 0.04;
    RETURN resultado;
END
//

SELECT salud("1")//

-- +------------+
-- | salud("1") |
-- +------------+
-- |      64.00 |
-- +------------+

DELIMITER //
DROP FUNCTION IF EXISTS pension //
CREATE FUNCTION pension(id VARCHAR(20)) RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL (6,2);
    DECLARE salario_base_persona DECIMAL (6,2);
    SET salario_base_persona = (SELECT salario_base FROM persona WHERE identificador = id);
    SET resultado = salario_base_persona * 0.04;
    RETURN resultado;
END
//

SELECT pension("1")//

-- +--------------+
-- | pension("1") |
-- +--------------+
-- |        64.00 |
-- +--------------+

DELIMITER //
DROP FUNCTION IF EXISTS bono //
CREATE FUNCTION bono(id VARCHAR(20)) RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL (6,2);
    DECLARE salario_base_persona DECIMAL (6,2);
    SET salario_base_persona = (SELECT salario_base FROM persona WHERE identificador = id);
    SET resultado = salario_base_persona * 0.08;
    RETURN resultado;
END
//

SELECT bono("1")//

-- +-----------+
-- | bono("1") |
-- +-----------+
-- |    128.00 |
-- +-----------+


DELIMITER //
DROP FUNCTION IF EXISTS integral //
CREATE FUNCTION integral(id VARCHAR(20)) RETURNS DECIMAL (6,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL (6,2);
    DECLARE salario_base_persona DECIMAL (6,2);
    SET salario_base_persona = (SELECT salario_base FROM persona WHERE identificador = id);
    SET resultado = salario_base_persona - (SELECT salud(id)) - (SELECT pension(id)) + (SELECT bono(id)) + (SELECT subsidio_transporte(id));
    RETURN resultado;
END
//

SELECT integral("1")//

-- +---------------+
-- | integral("1") |
-- +---------------+
-- |       1712.00 |
-- +---------------+

