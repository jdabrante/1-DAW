CREATE DATABASE ejercicio1;
USE ejercicio1;

-- Creación de tablas

CREATE TABLE cientifico (
    id VARCHAR(10),
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE proyecto(
    id VARCHAR(10),
    nombre VARCHAR(20),
    horas INT,
    PRIMARY KEY (id)
);

CREATE TABLE cientifico_proyecto (
    ref_cientifico VARCHAR(10) REFERENCES cientifico(id),
    ref_proyecto VARCHAR(10) REFERENCES proyecto(id),
    PRIMARY KEY (ref_cientifico,ref_proyecto)
);

-- Inserción de datos

INSERT INTO cientifico VALUES('1','Juan','Abrante','Gonzalez');
INSERT INTO cientifico VALUES('2','Manolo','Garcia','Gonzalez');
INSERT INTO cientifico VALUES('3','Noelia','Mesa','Carrillo');
INSERT INTO cientifico VALUES('4','Dimas','Abrante','Hernández');
INSERT INTO cientifico VALUES('5','Juan','Lorenzo','Gonzalez');

INSERT INTO proyecto VALUES('1','Matemáticas',50);
INSERT INTO proyecto VALUES('2','Informática',100);

INSERT INTO cientifico_proyecto VALUES('1','1');
INSERT INTO cientifico_proyecto VALUES('2','1');
INSERT INTO cientifico_proyecto VALUES('3','2');
INSERT INTO cientifico_proyecto VALUES('4','2');
INSERT INTO cientifico_proyecto VALUES('5','2');

-- Procedimientos

-- Para desplegar información de los proyectos

DELIMITER $$
DROP PROCEDURE IF EXISTS informacion_proyecto $$
CREATE PROCEDURE informacion_proyecto (IN id_proyecto VARCHAR(20))
BEGIN
    SELECT c.id as id_cientifico,c.nombre as nombre_cientifico,p.id as id_proyecto,p.nombre as nombre_proyecto FROM cientifico as c 
    JOIN cientifico_proyecto as cp 
    ON c.id = cp.ref_cientifico 
    JOIN proyecto as p
    ON cp.ref_proyecto = p.id 
    WHERE p.id = id_proyecto;
END
$$

-- Mostrar número de proyectos en los que está un científico determinado

DELIMITER $$
DROP PROCEDURE IF EXISTS numero_proyectos_cientifico $$
CREATE PROCEDURE numero_proyectos_cientifico (IN id_cientifico VARCHAR(20))
BEGIN
    SELECT COUNT(*) FROM cientifico as c JOIN cientifico_proyecto as cp
    ON c.id = cp.ref_cientifico 
    JOIN proyecto as p
    ON cp.ref_proyecto = p.id
    WHERE c.id = id_cientifico;
END
$$

-- Número de científicos en cada proyecto

DELIMITER $$
DROP PROCEDURE IF EXISTS cientificos_por_proyecto $$
CREATE PROCEDURE cientificos_por_proyecto ()
BEGIN
    SELECT p.id,p.nombre, COUNT(c.id) FROM cientifico as c JOIN cientifico_proyecto as cp
    ON c.id = cp.ref_cientifico 
    JOIN proyecto as p
    ON cp.ref_proyecto = p.id
    GROUP BY p.id;
END
$$
     

-- Horas supuestas de cada científico por proyecto (?)

DELIMITER $$
DROP PROCEDURE IF EXISTS numero_horas $$
CREATE PROCEDURE numero_horas()
BEGIN
    SELECT c.id, p.horas/COUNT(c.id) FROM cientifico as c JOIN cientifico_proyecto as cp
    ON c.id = cp.ref_cientifico 
    JOIN proyecto as p
    ON cp.ref_proyecto = p.id
    GROUP BY c.id

-- Revisar... Falta un atributo en cientifico_proyecto para determinar las horas que inverte cada 