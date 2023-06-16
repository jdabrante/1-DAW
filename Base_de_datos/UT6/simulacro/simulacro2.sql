CREATE DATABASE salario2;
USE salario2;

CREATE TABLE persona(
    identificador varchar(20),
    nombre varchar(20),
    salario_base int, 
    subsidio int DEFAULT 0,
    salud int DEFAULT 0,
    pension int DEFAULT 0,
    bono int DEFAULT 0,
    integral int DEFAULT 0, -- Se puede hacer como una property
    PRIMARY KEY (identificador)
);

DELIMITER //
DROP PROCEDURE IF EXISTS insertar//
CREATE PROCEDURE insertar(in cantidad int, in nombre varchar(20))
BEGIN
    DECLARE id varchar(20);
    DECLARE contador int;
    DECLARE random int;
    DECLARE nombre_insertar varchar(20);
    DECLARE salario_base int;
    SET random = RAND() * 100;
    SET contador = 0;
    WHILE (contador <= cantidad) do
        if (SELECT count(*) FROM persona) > 0 then
            SET id = CONCAT(LPAD(((SELECT SUBSTR(identificador, 1, 10) FROM persona ORDER BY identificador DESC LIMIT 1) + 1),10,0),"A");
            SET nombre_insertar = CONCAT(nombre,random);
            SET salario_base = (contador * random);
            INSERT INTO persona(identificador,nombre,salario_base) VALUES (id,nombre_insertar,salario_base);
            SET random = RAND() * 100;
        else
            SET id = CONCAT(LPAD(contador, 10, 0),"A");
            SET nombre_insertar = CONCAT(nombre,random);
            SET salario_base = (contador * random);
            INSERT INTO persona(identificador,nombre,salario_base) VALUES (id,nombre_insertar,salario_base);
            SET random = RAND() * 100;
        END IF;
        SET contador = contador + 1;
    END WHILE;
END
//

CALL insertar(20, "Pepe")//

