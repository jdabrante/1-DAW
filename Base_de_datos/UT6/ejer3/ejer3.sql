
-- Creación de la tabla

CREATE TABLE persona (id int NOT NULL AUTO_INCREMENT, peso int, admitido
ENUM('Si','No'), sexo ENUM('H','M'), fecha_ultima DATE, PRIMARY KEY (id));

-- Inserción de datos

INSERT INTO persona VALUES (1,45,'No','M','2010-05-09');
INSERT INTO persona VALUES (2,45,'No','M','2010-05-09');
INSERT INTO persona VALUES (3,60,'Si','H','2011-05-09');
INSERT INTO persona VALUES (4,40,'No','H','2012-05-09');
INSERT INTO persona VALUES (5,80,'No','H','2013-05-09');
INSERT INTO persona VALUES (6,90,'Si','M','2014-05-09');
INSERT INTO persona VALUES (7,60,'No','H','2015-05-09');
INSERT INTO persona VALUES (8,70,'Si','M','2016-05-09');
INSERT INTO persona VALUES (9,65,'No','H','2017-05-09');
INSERT INTO persona VALUES (10,60,'Si','M','2018-05-09');

-- Procedimientos

DELIMITER // -- comienzo del delimitador
DROP PROCEDURE IF EXISTS validar_admitido// -- Eliminar procedimientos si existen
CREATE PROCEDURE validar_admitido(in num_id int, in limite_peso int)
BEGIN
    if (SELECT peso FROM persona WHERE id=num_id) < limite_peso then
    UPDATE persona SET admitido = 'No' WHERE id=num_id;
    else
    UPDATE persona SET admitido = 'Si' WHERE id=num_id;
    end if;
END
//