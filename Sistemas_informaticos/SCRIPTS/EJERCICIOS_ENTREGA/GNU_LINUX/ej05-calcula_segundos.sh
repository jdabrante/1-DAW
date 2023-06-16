#!/bin/bash

#########################
#
# NOMBRE: ej05-calcula_segundos.sh
# OBJETIVO: Calcular los segundos totales correspondientes a dias,horas,minutos y segundos dados.
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: dias=$1,horas=$2,minutos=$3,segundos=$4
# SALIDA: Número total de segundos
#
# FECHA: 03/02/2023
# VERSIONES: 1.0.0
#
#########################

dias=$1
horas=$2
minutos=$3
segundos=$4

if [[ -z $dias ]]
then
    read -p "Introduzca el número de días: " dias
fi
if [[ -z $horas ]]
then
    read -p "Introduzca el número de horas: " horas
fi
if [[ -z $minutos ]] 
then
    read -p "Introduzca el número de minutos: " minutos
fi 
if [[ -z $segundos ]]
then
    read -p "Introduzca el número de segundos: " segundos
fi

operation=$(( $dias*24*3600 + $horas*3600 + $minutos*60 + $segundos ))

echo "$dias dias, $horas horas, $minutos minutos y $segundos segundos son $operation segundos"

