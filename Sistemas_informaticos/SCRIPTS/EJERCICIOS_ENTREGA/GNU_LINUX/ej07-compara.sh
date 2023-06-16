#!/bin/bash

#########################
#
# NOMBRE: ej07-compara.sh
# OBJETIVO: Comparar dos números y calcular cual de ellos es el mayor
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: n1=$1,n2=$2 
# SALIDA: Número mayor
#
# FECHA: 05/02/2023
# VERSIONES: 1.0.0
#
#########################

n1=$1
n2=$2

if [[ -z $n1 ]]
then
    read -p "Introduzca el primero valor: " n1
fi
if [[ -z $n2 ]]
then
    read -p "Introduzca el segundo valor: " n2
fi

if [[ $n1 -gt $n2 ]]
then
    echo "El $n1 es el mayor"
elif [[ $n2 -gt $n1 ]]
then 
    echo "El $n2 es el mayor"
else
    echo "El $n1 y $n2 son iguales"
fi