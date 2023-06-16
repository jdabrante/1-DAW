CREATE DATABASE ejer1;
USE ejer1;

CREATE TABLE cientifico ( 
    id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE proyecto (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    horas INT,
    PRIMARY KEY (id)
);

CREATE TABLE cientifico_proyecto(
    ref_cientifico INT REFERENCES cientifico(id),
    ref_proyecto INT REFERENCES proyecto(id),
    horas INT,
    PRIMARY KEY (ref_cientifico,ref_proyecto)
);


DELIMITER //
DROP PROCEDURE IF EXISTS insertar_cientificos //
CREATE PROCEDURE insertar_cientificos(in cantidad int, in nombre VARCHAR(20), in apellido1 VARCHAR(20), in apellido2 VARCHAR(20))
BEGIN
    DECLARE contador int;
    DECLARE nombre_insertar VARCHAR(20);
    DECLARE apellido1_insertar VARCHAR(20);
    DECLARE apellido2_insertar VARCHAR(20);
    DECLARE random int;
    SET random = RAND() * 100;
    SET contador = 0;
    WHILE (cantidad > contador) DO
        SET nombre_insertar = CONCAT(nombre,random);
        SET apellido1_insertar = CONCAT(apellido1,random);
        SET apellido2_insertar = CONCAT(apellido2,random);
        INSERT INTO cientifico(nombre,apellido1,apellido2) VALUES(nombre_insertar,apellido1_insertar,apellido2_insertar);
        SET contador = contador + 1;
        SET random = RAND() * 100;
    END WHILE;
END
//

DELIMITER ;
CALL insertar_cientificos(20,"pepe","abrante","hernandez");


INSERT INTO proyecto(nombre,horas) VALUES ("tecnologia", 100);
INSERT INTO proyecto(nombre,horas) VALUES ("restauración", 150);
INSERT INTO proyecto(nombre,horas) VALUES ("biologia", 200);
INSERT INTO proyecto(nombre,horas) VALUES ("quimica", 60);
INSERT INTO proyecto(nombre,horas) VALUES ("lengua", 100);

DELIMITER //
DROP PROCEDURE IF EXISTS asignar_proyecto //
CREATE PROCEDURE asignar_proyecto()
BEGIN
    DECLARE random_id int;
    DECLARE contador int;
    DECLARE cantidad_cientificos int;
    DECLARE id_proyecto_random int;
    DECLARE id_cientifico int;
    DECLARE horas_proyecto int;
    SET cantidad_cientificos = (SELECT count(*) FROM cientifico);
    SET contador = 0;
    SET id_cientifico = 1;
    WHILE ( cantidad_cientificos > contador ) DO
        SET id_proyecto_random = (SELECT id FROM proyecto ORDER BY RAND() LIMIT 1);
        SET horas_proyecto = (SELECT horas FROM proyecto WHERE id=id_proyecto_random)/(RAND() * 100);
        INSERT INTO cientifico_proyecto VALUES(id_cientifico, id_proyecto_random, horas_proyecto);
        SET id_cientifico = id_cientifico + 1;
        SET contador = contador + 1;
    END WHILE;
END
//

CALL asignar_proyecto()//



DELIMITER //
DROP FUNCTION IF EXISTS obtener_random //
CREATE FUNCTION obtener_random() RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE id_cientifico int;
    DECLARE nombre_cientifico VARCHAR(50);
    SET id_cientifico = (SELECT id FROM cientifico ORDER BY RAND() LIMIT 1);
    SET nombre_cientifico = (SELECT nombre FROM cientifico WHERE id=id_cientifico);
    RETURN CONCAT_WS(" ", id_cientifico, nombre_cientifico);
END
//

SELECT obtener_random()//