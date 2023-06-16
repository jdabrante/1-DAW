-- Creación de tabla

CREATE TABLE persona (
    codigo INT NOT NULL AUTO_INCREMENT,
    peso INT NOT NULL,
    admitido ENUM('S','N'),
    sexo ENUM('H','M'),
    fecha_ult_donacion DATE,
    PRIMARY KEY (codigo)
);

-- Procedimiento inserción de datos


DELIMITER $$
DROP FUNCTION IF EXISTS eleccion_random $$
CREATE FUNCTION eleccion_random(v1 VARCHAR(1), v2 VARCHAR(1)) RETURNS VARCHAR(1)
DETERMINISTIC
BEGIN
    DECLARE random INT;
    DECLARE salida VARCHAR(1);
    SET random = RAND();
    IF random > 0.5 THEN
        SET salida = v1;
    ELSE
        SET salida = v2;
    END IF;
    RETURN salida;
END
$$



DELIMITER $$
DROP PROCEDURE IF EXISTS insercion $$
CREATE PROCEDURE insercion(IN cantidad INT)
BEGIN
    DECLARE _peso INT;
    DECLARE _admitido ENUM('S','N');
    DECLARE _sexo ENUM('H','M');
    DECLARE _fecha_ult_donacion DATE;
    DECLARE contador INT;

    SET contador = 0;
    WHILE (contador < cantidad) DO
        SET _peso = RAND() * 100;
        SET _fecha_ult_donacion = DATE(DATE_SUB(NOW(), INTERVAL ROUND(RAND()*10)MONTH)) ;
        SET _admitido = (SELECT eleccion_random('S','N'));
        SET _sexo = (SELECT eleccion_random('H','M'));
        INSERT INTO persona (peso,admitido,sexo,fecha_ult_donacion) VALUES(_peso,_admitido,_sexo,_fecha_ult_donacion);
        SET contador = contador + 1;
    END WHILE;
END
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS chequeo $$
CREATE PROCEDURE chequeo()
BEGIN
DECLARE contador INT;
DECLARE limite INT;
DECLARE id INT;
SET limite = (SELECT count(*) FROM persona);
SET contador = 0;
WHILE (contador < limite) DO
    SET id = (SELECT codigo FROM persona LIMIT contador,1);
    IF (SELECT peso FROM persona LIMIT contador,1) > 50 THEN
        UPDATE persona SET admitido = 'S' WHERE codigo = id;
    ELSE
        UPDATE persona SET admitido = 'N' WHERE codigo = id;
    END IF;
    SET contador = contador + 1;
END WHILE;
END 
$$