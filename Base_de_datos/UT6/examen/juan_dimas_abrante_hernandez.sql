CREATE DATEBASE donacion;
USE donacion;

CREATE TABLE persona(
    identificador VARCHAR(20),
    peso int DEFAULT NULL,
    admitido enum("Si","No") DEFAULT "No",
    sexo enum("H","M") DEFAULT "H",
    fecha date DEFAULT "2020-10-10",
    PRIMARY KEY (identificador)
);

-- DELIMITER //
-- DROP PROCEDURE IF EXISTS insertar_datos//
-- CREATE PROCEDURE insertar_datos(in cantidad int)
-- BEGIN
--     DECLARE identificador VARCHAR(20);
--     DECLARE peso int;
--     DECLARE
-- END
-- //

DELIMITER //
DROP PROCEDURE IF EXISTS insertar//
CREATE PROCEDURE insertar(in cantidad int)
BEGIN
    DECLARE id varchar(20);
    DECLARE contador int;
    DECLARE random int;
    DECLARE n_peso int;
    SET random = RAND() * 100;
    SET contador = 0;
    WHILE (contador <= cantidad) do
        if (SELECT count(*) FROM persona) > 0 then
            SET id = CONCAT(LPAD(((SELECT SUBSTR(identificador, 1, 10) FROM persona ORDER BY identificador DESC LIMIT 1) + 1),10,0),"A");
            SET n_peso = (contador * random);
            INSERT INTO persona(identificador,peso) VALUES (id,n_peso);
            SET random = RAND() * 100;
        else
            SET id = CONCAT(LPAD(contador, 10, 0),"A");
            SET n_peso = (contador * random);
            INSERT INTO persona(identificador,peso) VALUES (id,n_peso);
            SET random = RAND() * 100;
        END IF;
        SET contador = contador + 1;
    END WHILE;
END
//

DELIMITER //
CALL insertar(20)//
CALL insertar(20)//

-- +---------------+------+----------+------+-------+
-- | identificador | peso | admitido | sexo | fecha |
-- +---------------+------+----------+------+-------+
-- | 0000000000A   |    0 | No       | NULL | NULL  |
-- | 0000000001A   |    0 | No       | NULL | NULL  |
-- | 0000000002A   |   96 | No       | NULL | NULL  |
-- | 0000000003A   |  116 | No       | NULL | NULL  |
-- | 0000000004A   |    3 | No       | NULL | NULL  |
-- | 0000000005A   |  136 | No       | NULL | NULL  |
-- | 0000000006A   |  325 | No       | NULL | NULL  |
-- | 0000000007A   |  150 | No       | NULL | NULL  |
-- | 0000000008A   |  203 | No       | NULL | NULL  |
-- | 0000000009A   |  576 | No       | NULL | NULL  |
-- | 0000000010A   |  639 | No       | NULL | NULL  |
-- | 0000000011A   |  400 | No       | NULL | NULL  |
-- | 0000000012A   |  957 | No       | NULL | NULL  |
-- | 0000000013A   |  192 | No       | NULL | NULL  |
-- | 0000000014A   |  221 | No       | NULL | NULL  |
-- | 0000000015A   |  504 | No       | NULL | NULL  |
-- | 0000000016A   |  465 | No       | NULL | NULL  |
-- | 0000000017A   |  736 | No       | NULL | NULL  |
-- | 0000000018A   |  629 | No       | NULL | NULL  |
-- | 0000000019A   |  864 | No       | NULL | NULL  |
-- | 0000000020A   |  532 | No       | NULL | NULL  |
-- | 0000000021A   | 1940 | No       | NULL | NULL  |
-- | 0000000022A   |    0 | No       | NULL | NULL  |
-- | 0000000023A   |   70 | No       | NULL | NULL  |
-- | 0000000024A   |    8 | No       | NULL | NULL  |
-- | 0000000025A   |   36 | No       | NULL | NULL  |
-- | 0000000026A   |  192 | No       | NULL | NULL  |
-- | 0000000027A   |   25 | No       | NULL | NULL  |
-- | 0000000028A   |  486 | No       | NULL | NULL  |
-- | 0000000029A   |  637 | No       | NULL | NULL  |
-- | 0000000030A   |   80 | No       | NULL | NULL  |
-- | 0000000031A   |  684 | No       | NULL | NULL  |
-- | 0000000032A   |  500 | No       | NULL | NULL  |
-- | 0000000033A   |  242 | No       | NULL | NULL  |
-- | 0000000034A   |  708 | No       | NULL | NULL  |
-- | 0000000035A   |  416 | No       | NULL | NULL  |
-- | 0000000036A   | 1148 | No       | NULL | NULL  |
-- | 0000000037A   |  195 | No       | NULL | NULL  |
-- | 0000000038A   |  336 | No       | NULL | NULL  |
-- | 0000000039A   | 1122 | No       | NULL | NULL  |
-- | 0000000040A   | 1188 | No       | NULL | NULL  |
-- | 0000000041A   |  627 | No       | NULL | NULL  |
-- | 0000000042A   | 1320 | No       | NULL | NULL  |
-- +---------------+------+----------+------+-------+

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_datos//
CREATE PROCEDURE actualizar_datos(in id VARCHAR(20), in n_fecha DATE)
BEGIN
    UPDATE persona SET fecha=n_fecha WHERE identificador=id;
END
//

DELIMITER //
CALL actualizar_datos("0000000000A","2020-10-10")//

-- +---------------+------+----------+------+------------+
-- | identificador | peso | admitido | sexo | fecha      |
-- +---------------+------+----------+------+------------+
-- | 0000000000A   |    0 | No       | NULL | 2020-10-10 |
-- | 0000000001A   |    0 | No       | NULL | NULL       |
-- | 0000000002A   |   96 | No       | NULL | NULL       |


DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_estado//
CREATE PROCEDURE actualizar_estado(in id VARCHAR(20), in n_fecha DATE)
BEGIN
    DECLARE resultado_admitido VARCHAR(2);
    SET resultado_admitido = (SELECT obtener_admitido2(id,n_fecha));
    IF (resultado_admitido = "Si") then
        UPDATE persona SET admitido = "Si" WHERE identificador=id;
    ELSE
        UPDATE persona SET admitido = "No" WHERE identificador=id;
    END IF;
    CALL actualizar_datos(id,n_fecha);
END
//

CALL actualizar_estado("0000000005A","2035-10-10")//

-- +---------------+------+----------+------+------------+
-- | identificador | peso | admitido | sexo | fecha      |
-- +---------------+------+----------+------+------------+
-- | 0000000000A   |    0 | No       | NULL | 2020-10-10 |
-- | 0000000001A   |   10 | No       | NULL | NULL       |
-- | 0000000002A   |    4 | No       | NULL | 2015-10-10 |
-- | 0000000003A   |  240 | Si       | NULL | 2015-10-10 |


DELIMITER //
DROP FUNCTION IF EXISTS obtener_admitido//
CREATE FUNCTION obtener_admitido(id VARCHAR(20), n_fecha DATE) RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE peso_persona int;
    DECLARE admitido VARCHAR(2);
    SET peso_persona = (SELECT peso FROM persona WHERE identificador=id);
    IF (peso_persona > 50) then
        SET admitido = "Si";
    ELSE
        SET admitido = "No";
    END IF;
    CALL actualizar_datos(id,n_fecha);
    RETURN admitido;
END
//



SELECT obtener_admitido("0000000001A","2050-10-10") as admitido//

-- +----------+
-- | admitido |
-- +----------+
-- | Si       |
-- +----------+

DELIMITER //
DROP FUNCTION IF EXISTS obtener_admitido2//
CREATE FUNCTION obtener_admitido2(id VARCHAR(20),n_fecha DATE) RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE peso_persona int;
    DECLARE diferencia_dias int;
    DECLARE ultima_fecha DATE;
    DECLARE sexo_persona VARCHAR(1);
    DECLARE admitido VARCHAR(2);
    SET sexo_persona = (SELECT sexo FROM persona WHERE identificador=id);
    SET ultima_fecha = (SELECT fecha FROM persona WHERE identificador=id);
    SET peso_persona = (SELECT peso FROM persona WHERE identificador=id);
    SET diferencia_dias = (n_fecha - ultima_fecha);
    IF ((peso_persona > 50) and (diferencia_dias > 90) and (sexo_persona = "H")) then
        SET admitido = "Si";
    ELSEIF ((peso_persona > 50) and (diferencia_dias > 120) and (sexo_persona = "M")) then
        SET admitido = "Si";
    ELSE
        SET admitido = "No";
    END IF;
    RETURN admitido;
END
//

SELECT obtener_admitido2("0000000005A","2030-10-10")//
