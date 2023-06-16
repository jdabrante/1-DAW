DROP DATABASE colegio;
CREATE DATABASE colegio;
USE colegio; 


CREATE TABLE alumno (
    numero_inscripcion INT AUTO_INCREMENT,
    anio_inscripcion INT,
    nombre VARCHAR(20),
    documento VARCHAR(9) UNIQUE,
    domicilio VARCHAR(20),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    PRIMARY KEY (numero_inscripcion,anio_inscripcion)
);

-- CREATE UNIQUE INDEX documento_idx ON alumno(documento);
CREATE INDEX ciudad_prov_idx ON alumno(ciudad,provincia);



CREATE TABLE tabla_aux (
    nombre VARCHAR(20),
    domicilio VARCHAR(20),
    ciudad VARCHAR(20),
    provincia VARCHAR(20)
);

INSERT INTO tabla_aux VALUES('Juan','C/Los Nidos','SC de Tenerife','SC de Tenerife');
INSERT INTO tabla_aux VALUES('Manolo','C/Langosta','Mongolia','Madrid');
INSERT INTO tabla_aux VALUES('Luis','C/Reyes Católicos','Granada','Granada');
INSERT INTO tabla_aux VALUES('Noelia','C/Lopez','LP de GC','Isleta');
INSERT INTO tabla_aux VALUES('Candelaria','C/Churros','Castaña','Barcelona');



DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_alumno $$
CREATE PROCEDURE insertar_alumno(IN cantidad INT)
BEGIN
    DECLARE _anio_inscripcion INT;
    DECLARE _nombre VARCHAR(20);
    DECLARE _documento VARCHAR(9);
    DECLARE _domicilio VARCHAR(20);
    DECLARE _ciudad VARCHAR(20);
    DECLARE _provincia VARCHAR(20);
    DECLARE contador INT;
    SET contador = 0;
    WHILE (contador < cantidad) DO
        SET _documento = LPAD((SELECT FLOOR(RAND() * 100000000)),9,0);
        IF NOT EXISTS(SELECT * FROM alumno WHERE documento = _documento) THEN
            SET _anio_inscripcion = (SELECT FLOOR(RAND() * (2023-2000) + 2000));
            SET contador = contador + 1;
            SET _nombre = (SELECT nombre FROM tabla_aux ORDER BY RAND() LIMIT 1);
            SET _domicilio = (SELECT domicilio FROM tabla_aux ORDER BY RAND() LIMIT 1);
            SET _ciudad = (SELECT ciudad FROM tabla_aux ORDER BY RAND() LIMIT 1);
            SET _provincia = (SELECT provincia FROM tabla_aux ORDER BY RAND() LIMIT 1);
            INSERT INTO alumno(anio_inscripcion,nombre,documento,domicilio,ciudad,provincia) VALUES(_anio_inscripcion,_nombre,_documento,_domicilio,_ciudad,_provincia);
        END IF;
    END WHILE;
END
$$

CREATE VIEW nombre_documento AS SELECT nombre, documento FROM alumno ORDER BY nombre; 

CREATE TRIGGER ascascsac BEFORE INSERT ON 