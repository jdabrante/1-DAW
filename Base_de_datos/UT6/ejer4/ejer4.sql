
    CREATE DATABASE  clientes;

    USE clientes;

    CREATE TABLE persona (
        identificador int NOT NULL,
        nombre varchar(20),
        apellido1 varchar(20),
        apellido2 varchar(20),
        peso int,
        sexo ENUM('H','M'),
        fecha_ultima_donacion DATE,
        admitido ENUM('Si','No') DEFAULT NULL,
        PRIMARY KEY(identificador)
    );

    INSERT INTO persona VALUES (1,'Juan','Pérez','Pérez',100,'H','2023-09-09',NULL);
    INSERT INTO persona VALUES (2,'Paco','Hernández','Pérez',90,'H','2022-09-09',NULL);
    INSERT INTO persona VALUES (3,'Luis','Gonzalez','Abrante',80,'H','2021-09-09',NULL);
    INSERT INTO persona VALUES (4,'Noelia','Mesa','Carrillo',70,'M','2020-09-09',NULL);
    INSERT INTO persona VALUES (5,'Kevin','Abrante','Hernández',50,'H','2019-09-09', NULL);
    INSERT INTO persona VALUES (6,'Dimas','Abrante','Hernández',58,'H','2018-09-09', NULL);
    INSERT INTO persona VALUES (7,'Jairo','Torres','Pérez',100,'H','2017-09-09', NULL);
    INSERT INTO persona VALUES (8,'Manuela','Pérez','Pérez',60,'M','2016-09-09', NULL);
    INSERT INTO persona VALUES (9,'Lorenzo','Mendez','Mendez',70,'M','2015-09-09', NULL);
    INSERT INTO persona VALUES (10,'Juan','Pérez','Lopez',100,'H','2014-09-09', NULL);

-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- | identificador | nombre  | apellido1  | apellido2  | peso | sexo | fecha_ultima_donacion | admitido |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- |             1 | Juan    | Pérez      | Pérez      |  100 | H    | 2023-09-09            | NULL     |
-- |             2 | Paco    | Hernández  | Pérez      |   90 | H    | 2022-09-09            | NULL     |
-- |             3 | Luis    | Gonzalez   | Abrante    |   80 | H    | 2021-09-09            | NULL     |
-- |             4 | Noelia  | Mesa       | Carrillo   |   70 | M    | 2020-09-09            | NULL     |
-- |             5 | Kevin   | Abrante    | Hernández  |   50 | H    | 2019-09-09            | NULL     |
-- |             6 | Dimas   | Abrante    | Hernández  |   58 | H    | 2018-09-09            | NULL     |
-- |             7 | Jairo   | Torres     | Pérez      |  100 | H    | 2017-09-09            | NULL     |
-- |             8 | Manuela | Pérez      | Pérez      |   60 | M    | 2016-09-09            | NULL     |
-- |             9 | Lorenzo | Mendez     | Mendez     |   70 | M    | 2015-09-09            | NULL     |
-- |            10 | Juan    | Pérez      | Lopez      |  100 | H    | 2014-09-09            | NULL     |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+


    DELIMITER //
    DROP PROCEDURE IF EXISTS insertar_datos//
    CREATE PROCEDURE insertar_datos (in id int, in nombre varchar(20), in apellido1 varchar(20), in apellido2 varchar(20), in peso int, in sexo enum('H','M'), fecha DATE, admitido enum('Si','No'))
    BEGIN 
        INSERT INTO persona VALUES (id,nombre,apellido1,apellido2,peso,sexo,fecha,admitido);
    END
    //
 
    DELIMITER ;
    CALL insertar_datos(11,'Juan','Sanchez','Rodriguez',60,'H', '2023-08-09', NULL);

-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- | identificador | nombre  | apellido1  | apellido2  | peso | sexo | fecha_ultima_donacion | admitido |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- |             1 | Juan    | Pérez      | Pérez      |  100 | H    | 2023-09-09            | NULL     |
-- |             2 | Paco    | Hernández  | Pérez      |   90 | H    | 2022-09-09            | NULL     |
-- |             3 | Luis    | Gonzalez   | Abrante    |   80 | H    | 2021-09-09            | NULL     |
-- |             4 | Noelia  | Mesa       | Carrillo   |   70 | M    | 2020-09-09            | NULL     |
-- |             5 | Kevin   | Abrante    | Hernández  |   50 | H    | 2019-09-09            | NULL     |
-- |             6 | Dimas   | Abrante    | Hernández  |   58 | H    | 2018-09-09            | NULL     |
-- |             7 | Jairo   | Torres     | Pérez      |  100 | H    | 2017-09-09            | NULL     |
-- |             8 | Manuela | Pérez      | Pérez      |   60 | M    | 2016-09-09            | NULL     |
-- |             9 | Lorenzo | Mendez     | Mendez     |   70 | M    | 2015-09-09            | NULL     |
-- |            10 | Juan    | Pérez      | Lopez      |  100 | H    | 2014-09-09            | NULL     |
-- |            11 | Juan    | Sanchez    | Rodriguez  |   60 | H    | 2023-08-09            | NULL     |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+


    DELIMITER //
    DROP PROCEDURE IF EXISTS actualizar_datos //
    CREATE PROCEDURE actualizar_datos (in id int, in nuevo_nombre varchar(20), in nuevo_peso int, out peso_medio int)
    BEGIN
        UPDATE persona SET nombre = nuevo_nombre, peso = nuevo_peso WHERE identificador=id;
        SELECT avg(peso) into peso_medio FROM persona;
    END
    //

    DELIMITER ;
    CALL actualizar_datos (11,'Pedro', 100, @peso_medio);
    SELECT @peso_medio;
    

-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- | identificador | nombre  | apellido1  | apellido2  | peso | sexo | fecha_ultima_donacion | admitido |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+
-- |             1 | Juan    | Pérez      | Pérez      |  100 | H    | 2023-09-09            | NULL     |
-- |             2 | Paco    | Hernández  | Pérez      |   90 | H    | 2022-09-09            | NULL     |
-- |             3 | Luis    | Gonzalez   | Abrante    |   80 | H    | 2021-09-09            | NULL     |
-- |             4 | Noelia  | Mesa       | Carrillo   |   70 | M    | 2020-09-09            | NULL     |
-- |             5 | Kevin   | Abrante    | Hernández  |   50 | H    | 2019-09-09            | NULL     |
-- |             6 | Dimas   | Abrante    | Hernández  |   58 | H    | 2018-09-09            | NULL     |
-- |             7 | Jairo   | Torres     | Pérez      |  100 | H    | 2017-09-09            | NULL     |
-- |             8 | Manuela | Pérez      | Pérez      |   60 | M    | 2016-09-09            | NULL     |
-- |             9 | Lorenzo | Mendez     | Mendez     |   70 | M    | 2015-09-09            | NULL     |
-- |            10 | Pedro   | Pérez      | Lopez      |  100 | H    | 2014-09-09            | NULL     |
-- |            11 | Pedro   | Sanchez    | Rodriguez  |  100 | H    | 2023-08-09            | NULL     |
-- +---------------+---------+------------+------------+------+------+-----------------------+----------+

-- +-------------+
-- | @peso_medio |
-- +-------------+
-- |          80 |
-- +-------------+

    DELIMITER //
    DROP PROCEDURE IF EXISTS eliminar_datos//
    CREATE PROCEDURE eliminar_datos (in cantidad_eliminar int, out cantidad_personas int)
    BEGIN
        DECLARE contador int;
        SET contador = 0;
        WHILE ( contador < cantidad_eliminar ) do
            DELETE FROM persona WHERE identificador=contador;
            SET contador = contador + 1;
        END WHILE;
        SELECT count(identificador) into cantidad_personas FROM persona;
    END
    //

    DELIMITER ; 
    CALL eliminar_datos (5, @cantidad_personas);
    SELECT @cantidad_personas;


-- +---------------+---------+-----------+------------+------+------+-----------------------+----------+
-- | identificador | nombre  | apellido1 | apellido2  | peso | sexo | fecha_ultima_donacion | admitido |
-- +---------------+---------+-----------+------------+------+------+-----------------------+----------+
-- |             5 | Kevin   | Abrante   | Hernández  |   50 | H    | 2019-09-09            | NULL     |
-- |             6 | Dimas   | Abrante   | Hernández  |   58 | H    | 2018-09-09            | NULL     |
-- |             7 | Jairo   | Torres    | Pérez      |  100 | H    | 2017-09-09            | NULL     |
-- |             8 | Manuela | Pérez     | Pérez      |   60 | M    | 2016-09-09            | NULL     |
-- |             9 | Lorenzo | Mendez    | Mendez     |   70 | M    | 2015-09-09            | NULL     |
-- |            10 | Pedro   | Pérez     | Lopez      |  100 | H    | 2014-09-09            | NULL     |
-- |            11 | Pedro   | Sanchez   | Rodriguez  |  100 | H    | 2023-08-09            | NULL     |
-- +---------------+---------+-----------+------------+------+------+-----------------------+----------+

-- +--------------------+
-- | @cantidad_personas |
-- +--------------------+
-- |                  7 |
-- +--------------------+

DELIMITER //
DROP PROCEDURE IF EXISTS gestionar_personas//
CREATE PROCEDURE gestionar_personas(in peso_max int)
BEGIN
    DECLARE longitud INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;
    SELECT count(*) into longitud from persona;
    SET contador = 0;
    WHILE (contador < longitud) do
        if (peso > peso_max) then
            UPDATE persona SET admitido = 'No';
        else
            UPDATE persona SET admitido = 'Si';
        end if;
        SET contador = contador + 1;
    END
    //


    