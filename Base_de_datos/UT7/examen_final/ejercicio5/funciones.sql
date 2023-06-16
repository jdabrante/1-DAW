-- Creación tabla

CREATE TABLE persona (
    identificador INT NOT NULL,
    nombre VARCHAR(20),
    salario_base INT,
    PRIMARY KEY (identificador)
);
-- Inserción de datos

DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_datos $$
CREATE PROCEDURE insertar_datos(IN cantidad INT)
BEGIN
    DECLARE _indetificador INT;
    DECLARE _nombre VARCHAR(20);
    DECLARE _salario_base INT;
    DECLARE contador INT;
    SET contador = 0;
    WHILE contador <= cantidad DO
        IF (SELECT COUNT(*) FROM persona) > 0 THEN
            SET _indetificador = (SELECT identificador FROM persona ORDER BY identificador DESC LIMIT 1) + 1;
        ELSE
            SET _indetificador = contador;
        END IF;
        SET _nombre = CONCAT('Pepe',_indetificador);        
        SET _salario_base = (RAND()*(1000) + 1);
        INSERT INTO persona(identificador,nombre,salario_base) VALUES(_indetificador,_nombre,_salario_base);
        SET contador = contador + 1;
    END WHILE;
END
$$

-- Funciones

DELIMITER $$
DROP FUNCTION IF EXISTS calculo $$
CREATE FUNCTION calculo(id INT, porcentaje INT)RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona WHERE identificador = id) * (porcentaje/100);
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS subsidio_transporte $$
CREATE FUNCTION subsidio_transporte(id INT) RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT calculo(id,7));
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS salud $$
CREATE FUNCTION salud(id INT) RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT calculo(id,4));
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS pension $$
CREATE FUNCTION pension(id INT) RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT calculo(id,4));
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS bono $$
CREATE FUNCTION bono(id INT) RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT calculo(id,8));
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS integral $$
CREATE FUNCTION integral(id INT) RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona WHERE identificador = id) - salud(id) - pension(id) + bono(id) + subsidio_transporte(id);
END
$$


