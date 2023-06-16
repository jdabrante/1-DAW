#!/bin/bash

#########################
#
# NOMBRE: ej03-gradosC2F.sh
# OBJETIVO: Conversión de grados celsius a fahrenheit
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: c=$1
# SALIDA: Grados fahrenheit
#
# FECHA: 02/02/2023
# VERSIONES: 1.0.0
#
#########################

c=$1
num='^[0-9]+$'

if [[ $# -eq 0 ]]
    then
        read -p "Introduzca los grados celsius que quiere convertiru: " c
fi
if ! [[ $c =~ $num ]]
    then
        echo "Error. No se ha introducido un valor numérico"
        exit
fi

operation=$( echo "$c * 1.8 + 32" | bc )
echo "La conversión de $c grados celsius a fahrenheit es de $operation grados fahrenheit"
