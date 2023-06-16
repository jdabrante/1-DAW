CREATE DATABASE salario;
USE salario;

CREATE TABLE persona(
    identificador varchar(20),
    nombre varchar(20),
    salario_base int, 
    subsidio int, 
    salud int, 
    pension int, 
    bono int, 
    integral int, 
    PRIMARY KEY (identificador)
)

