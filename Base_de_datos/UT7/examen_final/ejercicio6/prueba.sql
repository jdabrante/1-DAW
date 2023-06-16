CREATE TABLE persona (
    edad INT
);

INSERT INTO persona VALUES(-5);

DELIMITER $$
CREATE TRIGGER comprobar_edad
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    IF NEW.edad<0 THEN 
        SET NEW.edad = 0;
    END IF;
END
$$