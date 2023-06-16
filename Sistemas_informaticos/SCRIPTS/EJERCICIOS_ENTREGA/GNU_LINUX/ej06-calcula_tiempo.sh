#!/bin/bash

#########################
#
# NOMBRE: ej06-calcula_tiempo.sh
# OBJETIVO: Calcular los días, horas, minutos y segundos a partir de un número dado de segundos
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: segundos=$1 
# SALIDA: Los días,horas,minutos y segundos correspondientes al número dado de segundos
#
# FECHA: 05/02/2023
# VERSIONES: 1.0.0
#
#########################

segundos=$1

if [[ -z $segundos ]]
then
    echo "Error.No se ha introducido ningún parámetro de entrada"
    exit
fi

dias=$(( $segundos/(3600*24) ))
horas=$(( ($segundos%(3600*24))/3600 ))
min=$(( (($segundos%(3600*24))%3600)/60 ))
seg=$(( (($segundos%(3600*24))%3600)%60 ))

echo "$1 segundos son $dias dias, $horas horas, $min minutos y $seg segundos "
