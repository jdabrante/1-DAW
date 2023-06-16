CREATE DATABASE donacion;
USE donacion;

CREATE TABLE persona(
    id int AUTO_INCREMENT,
    peso int NOT NULL,
    admitido enum("S","N") DEFAULT "N",
    sexo enum("H","M") NOT NULL,
    fecha date NOT NULL,
    PRIMARY KEY (id)
);

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_persona//
CREATE PROCEDURE insertar_persona(in n_peso int, in n_sexo VARCHAR(1), n_fecha DATE)
BEGIN
    INSERT INTO persona(peso,sexo,fecha) VALUES(n_peso,n_sexo,n_fecha);
END
//

DELIMITER //
DROP PROCEDURE IF EXISTS cambiar_estado//
CREATE PROCEDURE cambiar_estado(in peso_limite int)
BEGIN
    DECLARE cantidad_personas int;
    DECLARE contador int;
    DECLARE peso_persona int;
    DECLARE id_persona int;
    SET cantidad_personas = (SELECT count(*) FROM persona);
    SET contador = 0;
    SET id_persona = 1;
    WHILE (cantidad_personas > contador) DO
        SET peso_persona = (SELECT peso FROM persona WHERE id=id_persona);
        IF (peso_persona >= peso_limite) THEN
            UPDATE persona SET admitido="S" WHERE id=id_persona;
        ELSE
            UPDATE persona SET admitido="N" WHERE id=id_persona;
        END IF;
        SET contador = contador + 1;
        SET id_persona = id_persona + 1;
    END WHILE;
END
//