## Base de datos de instituto

<div align="justify">

1. Creación de la base de datos

```sql
CREATE DATABASE instituto;
USE instituto;
```
2. Eliminación de tablas

```sql
DROP TABLE IF EXISTS alumno;
```
*Query OK, 0 rows affected, 1 warning (0,02 sec)*

3. Creación de tabla compuesta

```sql
CREATE TABLE alumno(
    numero_inscripcion INT NOT NULL,
    anio_inscripcion INT NOT NULL,
    nombre_alumno VARCHAR(20),
    documento VARCHAR(20),
    domicilio VARCHAR(20),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    PRIMARY KEY (numero_inscripcion, anio_inscripcion)
);
```
*Query OK, 0 rows affected (0,03 sec)*

4. Definición de índices

- Índice documento

```sql
CREATE UNIQUE INDEX idx_documentacion ON alumno(documento);
```
*Query OK, 0 rows affected, 1 warning (0,01 sec)
Records: 0  Duplicates: 0  Warnings: 1*

- Índice ciudad y provincia

```sql
CREATE INDEX idx_anio_numero_inscripcion ON alumno(numero_inscripcion,anio_inscripcion);
```
*Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0*

```sql
SHOW CREATE TABLE alumno;
```
```sql
| alumno | CREATE TABLE `alumno` (
  `numero_inscripcion` int NOT NULL,
  `anio_inscripcion` int NOT NULL,
  `nombre_alumno` varchar(20) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `provincia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numero_inscripcion`,`anio_inscripcion`),
  UNIQUE KEY `idx_documentacion` (`documento`),
  KEY `idx_anio_numero_inscripcion` (`numero_inscripcion`,`anio_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
```

5. Procedimiento de inserción

- Datos auxiliares para aleatoriedad
```sql
CREATE TABLE direccion(
    provincia VARCHAR(20),
    ciudad VARCHAR(20),
    domicilio VARCHAR(20)
);

INSERT INTO direccion VALUES('SC de Tenerife','Pto de la Cruz','C/Los Nidos');
INSERT INTO direccion VALUES('Las Palmas','LP de Gran Canaria','C/Voluntad');
INSERT INTO direccion VALUES('Madrid','Madrid','C/de Tellez');
INSERT INTO direccion VALUES('Lleida','Alfés','C/Jaume');

CREATE TABLE nombres(
    nombre VARCHAR(20)
);

INSERT INTO nombres VALUES('Paco');
INSERT INTO nombres VALUES('Francisco');
INSERT INTO nombres VALUES('Ramon');
INSERT INTO nombres VALUES('Manola');
INSERT INTO nombres VALUES('Elena');


```

```sql

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos//
CREATE PROCEDURE insertar_datos(in cantidad int)
BEGIN
    DECLARE _numero_inscripcion INT;
    DECLARE _anio_inscripcion INT;
    DECLARE _documento INT;
    DECLARE contador INT;
    DECLARE _nombre VARCHAR(20);
    DECLARE _provincia VARCHAR(20);
    DECLARE _ciudad VARCHAR(20);
    DECLARE _domicilio VARCHAR(20);
    SET contador = 0;
    WHILE (contador <= cantidad) DO
        IF (SELECT count(*) FROM alumno) > 0 THEN
            SET _numero_inscripcion = (SELECT numero_inscripcion FROM alumno ORDER BY numero_inscripcion DESC LIMIT 1) + 1;
            SET _documento = (SELECT documento FROM alumno ORDER BY documento DESC LIMIT 1) + 1;
        ELSE
            SET _numero_inscripcion = contador + 1;
            SET _documento = contador + 1;
        END IF;
        SET contador = contador + 1;
        SET _anio_inscripcion = CURDATE() + contador;
        SELECT provincia into _provincia FROM direccion ORDER BY RAND() LIMIT 1;
        SELECT ciudad into _ciudad FROM direccion ORDER BY RAND() LIMIT 1;
        SELECT domicilio into _domicilio FROM direccion ORDER BY RAND() LIMIT 1;
        SELECT nombre into _nombre FROM nombres ORDER BY RAND() LIMIT 1;
        INSERT INTO alumno(numero_inscripcion,anio_inscripcion,nombre_alumno,documento,provincia,ciudad,domicilio) VALUES (_numero_inscripcion,_anio_inscripcion,_nombre,_documento,_provincia,_ciudad,_domicilio);
    END WHILE;
END 
//

CALL insertar_datos(5)//
    
CALL insertar_datos(5)//

```
```sql
Query OK, 1 row affected (0,09 sec)

mysql> CALL insertar_datos(5)//
ERROR 1062 (23000): Duplicate entry '10' for key 'alumno.idx_documentacion'
mysql> select * from alumno//
+--------------------+------------------+---------------+-----------+-------------+--------------------+----------------+
| numero_inscripcion | anio_inscripcion | nombre_alumno | documento | domicilio   | ciudad             | provincia      |
+--------------------+------------------+---------------+-----------+-------------+--------------------+----------------+
|                  1 |         20230512 | Francisco     | 1         | C/Los Nidos | Pto de la Cruz     | Madrid         |
|                  2 |         20230513 | Manola        | 2         | C/Jaume     | Alfés              | Madrid         |
|                  3 |         20230514 | Ramon         | 3         | C/de Tellez | Alfés              | Madrid         |
|                  4 |         20230515 | Paco          | 4         | C/Voluntad  | Pto de la Cruz     | Las Palmas     |
|                  5 |         20230516 | Manola        | 5         | C/Voluntad  | Madrid             | Madrid         |
|                  6 |         20230517 | Paco          | 6         | C/de Tellez | Madrid             | Lleida         |
|                  7 |         20230512 | Paco          | 7         | C/de Tellez | Alfés              | Lleida         |
|                  8 |         20230513 | Elena         | 8         | C/Jaume     | LP de Gran Canaria | SC de Tenerife |
|                  9 |         20230514 | Ramon         | 9         | C/de Tellez | Madrid             | Madrid         |
|                 10 |         20230515 | Paco          | 10        | C/de Tellez | Pto de la Cruz     | Lleida         |
+--------------------+------------------+---------------+-----------+-------------+--------------------+----------------+
```

6. Inserción de alumno con clave repetida

```sql
INSERT INTO alumno VALUE(1,1900,'Juan',50,'C/Los Nidos','Pto Cruz','SC de Tenerife');
```

*Query OK, 1 row affected (0,01 sec)*

7. Inserción de alumno con documento repetido

```sql
INSERT INTO alumno VALUE(20,1900,'Juan',10,'C/Los Nidos','Pto Cruz','SC de Tenerife');
```
*ERROR 1062 (23000): Duplicate entry '10' for key 'alumno.idx_documentacion'*

8. Inserción de alumnos de la misma provincia

```sql
INSERT INTO alumno VALUE(30,1900,'Juan',30,'C/Los Nidos','Pto Cruz','SC de Tenerife');
INSERT INTO alumno VALUE(40,1900,'Juan',40,'C/Los Nidos','Pto Cruz','SC de Tenerife');
INSERT INTO alumno VALUE(60,1900,'Juan',60,'C/Los Nidos','Pto Cruz','SC de Tenerife');
```
*Query OK, 1 row affected (0,03 sec)*

*Query OK, 1 row affected (0,09 sec)*

*Query OK, 1 row affected (0,09 sec)*

9. Eliminación de índices

```sql
DROP INDEX idx_documentacion ON alumno;
;Query OK, 0 rows affected (0,13 sec)
Records: 0  Duplicates: 0  Warnings: 0

DROP INDEX idx_anio_numero_inscripcion ON alumno;
Query OK, 0 rows affected (0,05 sec)
Records: 0  Duplicates: 0  Warnings: 0


| alumno | CREATE TABLE `alumno` (
  `numero_inscripcion` int NOT NULL,
  `anio_inscripcion` int NOT NULL,
  `nombre_alumno` varchar(20) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `provincia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numero_inscripcion`,`anio_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
```
</div>

