CREATE TABLE persona (
    identificador VARCHAR(20) NOT NULL,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    peso INT,
    sexo ENUM('H','M'),
    PRIMARY KEY (identificador)
);

-- Procedimientos

DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_datos $$
CREATE PROCEDURE insertar_datos(IN cantidad INT)
BEGIN
    DECLARE _indetificador VARCHAR(10);
    DECLARE random INT;
    DECLARE letras VARCHAR(27);
    DECLARE contador INT;
    DECLARE _nombre VARCHAR(20);
    DECLARE _apellido1 VARCHAR(20);
    DECLARE _apellido2 VARCHAR(20);
    DECLARE _peso INT;
    DECLARE _sexo ENUM('H','M');
    SET letras = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
    SET contador = 1;
    WHILE (contador <= cantidad) DO
    SET random = (SELECT FLOOR(RAND()*(27)+1));
    IF (SELECT COUNT(*) FROM persona) > 0 THEN
        SET _indetificador = CONCAT(((SELECT COUNT(*) FROM persona)+1),SUBSTRING(letras,random,1));
    ELSE 
        SET _indetificador = CONCAT(contador,SUBSTRING(letras,random,1));
    END IF;
        SET _nombre = CONCAT('Juan',contador);
        SET _apellido1 = CONCAT('Juan',contador);
        SET _apellido2 = CONCAT('Pacso',contador);
        SET _peso = RAND()*(100) + 40;
    IF _peso >= 90 THEN
        SET _sexo = 'H';
    ELSE 
        SET _sexo = 'M';
    END IF;
        INSERT INTO persona(identificador,nombre,apellido1,apellido2,peso,sexo) VALUES(_indetificador,_nombre,_apellido1,_apellido2,_peso,_sexo);
        SET contador = contador + 1;
    END WHILE;
END
$$


