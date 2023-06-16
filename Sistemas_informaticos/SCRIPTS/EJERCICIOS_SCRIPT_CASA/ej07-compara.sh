#!/bin/bash

#########################
#
# NOMBRE: ej07-compara.sh
# OBJETIVO:Calcular numero mayor o igual
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: num1=1,num2=2
# SALIDA: Numero mayor o igualdad
#
# FECHA: 28/01/23
# VERSIONES: 1.0.0
#
#########################

num1=$1
num2=$2

if [ $# -eq 0 ]
then 
	echo  "Introduzca los argumentos"
	read -p "Primer valor: " num1
	read -p "Segundo valor: " num2
fi

if [ $num1 -gt $num2 ]
then
	echo "El $num1 es mayor que el $num2"
elif [ $num2 -gt $num1 ]
then 
	echo "El $num2 es mayor que el $num1"
else
	echo "El $num1 y el $num2 son iguales"
fi

