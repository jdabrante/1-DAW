#!/bin/bash

#########################
#
# NOMBRE: ej01-resta.sh
# OBJETIVO: Hacer restas
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Resultado de la resta
#
# FECHA: 25/01/23
# VERSIONES: 1.0.0
#
#########################

num1=$1
num2=$2
resultado=$(( num1-num2 ))

echo "El resultado de restar $num1 con $num2 es $resultado"

#Otra forma

echo "El resultado de restar $num1 con $num2 es $(( num1-num2 ))"
