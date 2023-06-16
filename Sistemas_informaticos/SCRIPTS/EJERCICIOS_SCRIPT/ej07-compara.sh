#!/bin/bash

#########################
#
# NOMBRE: Compara
# OBJETIVO: Comparar números
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: 1=num1, 2=num2
# SALIDA: cuál es mayor de los dos
# FECHA:17/01/23 
# VERSIONES: 1.0
#
#########################

#Para comparar texto no es lo mismo que para comparar números, para texto:
#=, !=, >, <
#Para números respectivamnete
#-eq, -ne, -gt, -lt, -ge, -le (Los dos últimos son mayores o igual o menor o igual

num1=$1
num2=$2

if [ "$num1" -gt "$num2" ]
then
	echo "$num1 es mayor que $num2"
elif [ "$num1" -lt "$num2" ]
then 
	echo "$num2 es mayor que $num1"
else 
	echo "$num2 y $num1 son iguales"
fi
