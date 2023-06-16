-- Creación de vistas

CREATE VIEW jefe_info AS
SELECT p.*, j.departamento, d.nombre as nombre_departamento FROM profesor as p JOIN jefedepartamento as j ON p.id = j.profe JOIN departamento as d ON j.departamento = d.id;

-- +--------+-----------+----------+-------------------------------------+-----------+--------+--------+-----------+--------------+----------+------+--------------+-----------------------------------+
-- | id     | nombre    | apellido | email                               | telefono  | h_perm | h_lect | sustituto | id_sustituto | username | foto | departamento | nombre_departamento               |
-- +--------+-----------+----------+-------------------------------------+-----------+--------+--------+-----------+--------------+----------+------+--------------+-----------------------------------+
-- | Profe1 | Guillermo | Sicilia  | siciliahernandezguillermo@gmail.com | NULL      |     24 |     18 |         0 | NULL         | admin    |      | FOL          | Formación y Orientación Laboral   |
-- | Profe3 | Maria     | Cabrera  | maca@gmail.com                      | 345678901 |     24 |     18 |         0 | NULL         | marcab   |      | FIL          | Filosofía                         |
-- +--------

CREATE VIEW tutor_info AS
SELECT p.*, t.curso,t.aula,t.fct, c.grado , c.grupo, c.nombre as nombre_curso, c.etapa FROM profesor as p JOIN tutor as t ON p.id = t.profe JOIN curso as c ON t.curso = c.id;

-- +--------+-----------+----------+-------------------------------------+-----------+--------+--------+-----------+--------------+----------+------+--------------+-----------------------------------+
-- | id     | nombre    | apellido | email                               | telefono  | h_perm | h_lect | sustituto | id_sustituto | username | foto | departamento | nombre_departamento               |
-- +--------+-----------+----------+-------------------------------------+-----------+--------+--------+-----------+--------------+----------+------+--------------+-----------------------------------+
-- | Profe1 | Guillermo | Sicilia  | siciliahernandezguillermo@gmail.com | NULL      |     24 |     18 |         0 | NULL         | admin    |      | FOL          | Formación y Orientación Laboral   |
-- | Profe3 | Maria     | Cabrera  | maca@gmail.com                      | 345678901 |     24 |     18 |         0 | NULL         | marcab   |      | FIL          | Filosofía                         |
-- +--------+-----------+----------+-------------------------------------+-----------+--------+--------+-----------+--------------+----------+------+--------------+-----------------------------------+

CREATE VIEW profe_horas AS
SELECT p.*, h.hora_inicio, h.hora_fin, h.dia FROM profesor as p JOIN profehorario ON profehorario.id_profe = p.id JOIN horario as h ON profehorario.id_horario = h.id;

-- +--------+-----------+-----------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+-------------+----------+-----+
-- | id     | nombre    | apellido  | email                               | telefono  | h_perm | h_lect | sustituto | id_sustituto | username  | foto | hora_inicio | hora_fin | dia |
-- +--------+-----------+-----------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+-------------+----------+-----+
-- | Profe1 | Guillermo | Sicilia   | siciliahernandezguillermo@gmail.com | NULL      |     24 |     18 |         0 | NULL         | admin     |      | 08:00:00    | 08:55:00 | L   |
-- | Profe2 | Pedro     | Martinez  | pema@gmail.com                      | 234567890 |     24 |     18 |         0 | NULL         | pedmar    |      | 08:00:00    | 08:55:00 | L   |
-- | Profe3 | Maria     | Cabrera   | maca@gmail.com                      | 345678901 |     24 |     18 |         0 | NULL         | marcab    |      | 08:55:00    | 09:50:00 | M   |
-- | Profe4 | Grace     | Caraballo | gracecp@gmail.com                   | 123124123 |     24 |     18 |         0 | NULL         | gracar123 |      | 09:50:00    | 10:45:00 | X   |
-- +--------+-----------+-----------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+-------------+----------+-----+

-- Índices

CREATE INDEX nombre_idx ON profesor(nombre);

-- Query OK, 0 rows affected (0,15 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | profesor |          0 | PRIMARY      |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | id_sustituto |            1 | id_sustituto | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | username     |            1 | username     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | nombre_idx   |            1 | nombre       | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

CREATE INDEX nombre_departamento_idx ON departamento(nombre);

-- Query OK, 0 rows affected (0,10 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- +--------------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table        | Non_unique | Key_name                | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +--------------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | departamento |          0 | PRIMARY                 |            1 | id          | A         |          22 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | departamento |          1 | nombre_departamento_idx |            1 | nombre      | A         |          22 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +--------------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

CREATE UNIQUE INDEX asignatura_idx ON asignatura(nombre);

-- Query OK, 0 rows affected, 1 warning (0,08 sec)
-- Records: 0  Duplicates: 0  Warnings: 1

-- +------------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | asignatura |          0 | PRIMARY        |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | asignatura |          0 | nombre         |            1 | nombre      | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | asignatura |          0 | asignatura_idx |            1 | nombre      | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | asignatura |          1 | id_dpto        |            1 | id_dpto     | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +------------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

CREATE UNIQUE INDEX rol_idx ON rol(nombre);

-- Query OK, 0 rows affected (0,10 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | rol   |          0 | PRIMARY  |            1 | id          | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | rol   |          0 | rol_idx  |            1 | nombre      | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

CREATE FULLTEXT INDEX user_idx ON users(roles);

-- Query OK, 0 rows affected, 1 warning (0,11 sec)
-- Records: 0  Duplicates: 0  Warnings: 1

-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | users |          0 | PRIMARY  |            1 | username    | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | users |          1 | user_idx |            1 | roles       | NULL      |           4 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
-- +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

CREATE FULLTEXT INDEX email_index ON profesor(email);

-- Query OK, 0 rows affected, 1 warning (0,13 sec)
-- Records: 0  Duplicates: 0  Warnings: 1

-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table    | Non_unique | Key_name     | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | profesor |          0 | PRIMARY      |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | id_sustituto |            1 | id_sustituto | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | username     |            1 | username     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | nombre_idx   |            1 | nombre       | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | email_index  |            1 | email        | NULL      |           4 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

-- Triggers

CREATE TABLE respaldo_profesor (
    id VARCHAR(10),
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    email VARCHAR(50),
    telefono VARCHAR(20)
);

DELIMITER $$
CREATE TRIGGER guardar_profe_AI AFTER INSERT ON profesor
FOR EACH ROW 
BEGIN
    INSERT INTO respaldo_profesor VALUES(NEW.id, NEW.nombre, NEW.apellido, NEW.email, NEW.telefono);
END
$$

INSERT INTO `profesor` (`id`, `nombre`, `apellido`, `email`, `telefono`, `h_perm`, `h_lect`, `sustituto`, `id_sustituto`, `username`, `foto`) VALUES
('Profe5', 'Guillermo', 'Sicilia', 'siciliahernandezguillermo@gmail.com', NULL, 24, 18, DEFAULT, null, 'admin', '')

-- +--------+-----------+----------+-------------------------------------+----------+
-- | id     | nombre    | apellido | email                               | telefono |
-- +--------+-----------+----------+-------------------------------------+----------+
-- | Profe5 | Guillermo | Sicilia  | siciliahernandezguillermo@gmail.com | NULL     |
-- +--------+-----------+----------+-------------------------------------+----------+

CREATE TABLE cambios_profesor (
    id VARCHAR(10),
    o_nombre VARCHAR(20),
    n_nombre VARCHAR(20),
    o_apellido VARCHAR(20),
    n_apellido VARCHAR(20),
    o_email VARCHAR(50),
    n_email VARCHAR(50),
    o_telefono VARCHAR(20),
    n_telefono VARCHAR(20),
    fecha DATETIME
);

DELIMITER $$
CREATE TRIGGER guardar_cambios_profe_AI AFTER UPDATE on profesor
FOR EACH ROW
BEGIN 
    INSERT INTO cambios_profesor VALUES(OLD.id, OLD.nombre, NEW.nombre, OLD.apellido, NEW.apellido, OLD.email, NEW.email, OLD.telefono, NEW.telefono, CURDATE());
END
$$

UPDATE profesor SET telefono = '637955313' WHERE id = 'Profe1';

-- mysql> select * from cambios_profesor $$
-- +--------+-----------+-----------+------------+------------+-------------------------------------+-------------------------------------+------------+------------+---------------------+
-- | id     | o_nombre  | n_nombre  | o_apellido | n_apellido | o_email                             | n_email                             | o_telefono | n_telefono | fecha               |
-- +--------+-----------+-----------+------------+------------+-------------------------------------+-------------------------------------+------------+------------+---------------------+
-- | Profe1 | Guillermo | Guillermo | Sicilia    | Sicilia    | siciliahernandezguillermo@gmail.com | siciliahernandezguillermo@gmail.com | NULL       | 637955313  | 2023-05-29 00:00:00 |
-- +--------+-----------+-----------+------------+------------+-------------------------------------+-------------------------------------+------------+------------+---------------------+

-- Procedimientos

CREATE TABLE datos_auxiliares (
    username VARCHAR(20),
    password VARCHAR(255),
    email VARCHAR(50),
    roles VARCHAR(255)
    );

INSERT INTO datos_auxiliares VALUES('Paquito','weiufhewiufhweifuhweifewhfuiewfwi','juan@gamil.com','pro');
INSERT INTO datos_auxiliares VALUES('Lolo','weiufhewiufhweifuhwedededdeeifewhfuiewfwi','lolo@gamil.com','menospro');
INSERT INTO datos_auxiliares VALUES('Manuel','fwefwfewfewfwefwefwefwefwef','Manuel@gamil.com','algopro');


DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_datos $$
CREATE PROCEDURE insertar_datos(IN cantidad INT)
BEGIN
    DECLARE _username VARCHAR(20);
    DECLARE _password VARCHAR(255);
    DECLARE _email VARCHAR(50);
    DECLARE _roles VARCHAR(255);
    DECLARE contador INT;
    SET contador = 0;
    WHILE (contador < cantidad) DO
        SET _username = CONCAT((SELECT username FROM datos_auxiliares ORDER BY RAND() LIMIT 1), (SELECT FLOOR(RAND() *  10)));
        IF NOT EXISTS(SELECT username FROM users WHERE username = _username) THEN
            SET _password = (SELECT password FROM datos_auxiliares ORDER BY RAND() LIMIT 1);
            SET _email = (SELECT email FROM datos_auxiliares ORDER BY RAND() LIMIT 1);
            SET _roles = (SELECT roles FROM datos_auxiliares ORDER BY RAND() LIMIT 1);
            INSERT INTO users(username,password,email,roles) VALUES(_username,_password,_email,_roles);
            SET contador = contador + 1;
        END IF; 
    END WHILE;
END
$$

-- +-----------+--------------------------------------------------------------+-------------------------------------+---------+-------------------+
-- | username  | password                                                     | email                               | enabled | roles             |
-- +-----------+--------------------------------------------------------------+-------------------------------------+---------+-------------------+
-- | admin     | $2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm | siciliahernandezguillermo@gmail.com |       0 | admin profe jdept |
-- | gracar123 | $2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm | gracecp@gmail.com                   |       0 | profe jdept       |
-- | Lolo0     | Paquito                                                      | Lolo                                |       0 | Lolo              |
-- | Lolo1     | Lolo                                                         | Lolo                                |       0 | Manuel            |
-- | Lolo3     | Manuel                                                       | Paquito                             |       0 | Manuel            |
-- | Lolo4     | Paquito                                                      | Manuel                              |       0 | Manuel            |
-- | Lolo5     | weiufhewiufhweifuhweifewhfuiewfwi                            | Manuel@gamil.com                    |       0 | menospro          |
-- | Lolo6     | Lolo                                                         | Manuel                              |       0 | Paquito           |
-- | Lolo7     | fwefwfewfewfwefwefwefwefwef                                  | Manuel@gamil.com                    |       0 | menospro          |
-- | Lolo8     | weiufhewiufhweifuhwedededdeeifewhfuiewfwi                    | juan@gamil.com                      |       0 | menospro          |
-- | Lolo9     | Paquito                                                      | Manuel                              |       0 | Lolo              |
-- | Manuel    | Manuel                                                       | Lolo                                |       0 | Manuel            |
-- | Manuel1   | Lolo                                                         | Manuel                              |       0 | Paquito           |
-- | Manuel2   | fwefwfewfewfwefwefwefwefwef                                  | Manuel@gamil.com                    |       0 | algopro           |
-- | Manuel3   | Manuel                                                       | Paquito                             |       0 | Paquito           |
-- | Manuel4   | weiufhewiufhweifuhwedededdeeifewhfuiewfwi                    | Manuel@gamil.com                    |       0 | pro               |
-- | Manuel5   | Lolo                                                         | Manuel                              |       0 | Lolo              |
-- | Manuel8   | Manuel                                                       | Manuel                              |       0 | Paquito           |
-- | Manuel9   | fwefwfewfewfwefwefwefwefwef                                  | juan@gamil.com                      |       0 | menospro          |
-- | marcab    | $2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm | macab@gmail.com                     |       0 | profe             |
-- | Paquito   | Lolo                                                         | Lolo                                |       0 | Paquito           |
-- | Paquito0  | Lolo                                                         | Paquito                             |       0 | Paquito           |
-- | Paquito1  | fwefwfewfewfwefwefwefwefwef                                  | lolo@gamil.com                      |       0 | pro               |
-- | Paquito2  | Paquito                                                      | Lolo                                |       0 | Lolo              |
-- | Paquito3  | fwefwfewfewfwefwefwefwefwef                                  | juan@gamil.com                      |       0 | algopro           |
-- | Paquito4  | Lolo                                                         | Lolo                                |       0 | Lolo              |
-- | Paquito5  | weiufhewiufhweifuhwedededdeeifewhfuiewfwi                    | Manuel@gamil.com                    |       0 | pro               |
-- | Paquito6  | Lolo                                                         | Lolo                                |       0 | Paquito           |
-- | Paquito8  | Paquito                                                      | Manuel                              |       0 | Manuel            |
-- | Paquito9  | weiufhewiufhweifuhweifewhfuiewfwi                            | Manuel@gamil.com                    |       0 | pro               |
-- | pedmar    | $2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm | pemar@gmail.com                     |       0 | profe             |
-- +-----------+--------------------------------------------------------------+-------------------------------------+---------+-------------------+


CREATE TABLE auxiliar_rol (
    id VARCHAR(20),
    nombre VARCHAR(50)
);

INSERT INTO auxiliar_rol VALUES('superpro','casiadministrador');
INSERT INTO auxiliar_rol VALUES('casipro','standard');
INSERT INTO auxiliar_rol VALUES('tutor','casitutor');


DELIMITER $$
DROP PROCEDURE IF EXISTS introducir_rol $$
CREATE PROCEDURE introducir_rol (IN cantidad INT)
BEGIN
    DECLARE _id VARCHAR(20);
    DECLARE _nombre VARCHAR(50);
    DECLARE contador INT;
    SET contador = 0;
    WHILE (contador < cantidad) DO
        SET _id = CONCAT((SELECT id FROM auxiliar_rol ORDER BY RAND() LIMIT 1), (SELECT FLOOR(RAND() *  10)));
        IF NOT EXISTS(SELECT id FROM rol WHERE id = _id) THEN 
            SET _nombre = (SELECT nombre FROM auxiliar_rol ORDER BY RAND() LIMIT 1);
            INSERT INTO rol VALUES(_id,_nombre);
            SET contador = contador + 1;
        END IF; 
    END WHILE;
END
$$

CALL introducir_rol(5) $$