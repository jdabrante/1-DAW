#!/bin/bash

#########################
#
# NOMBRE: ej04-dia_semana.sh
# OBJETIVO: Calcular el día de la semana correspondiente a la fecha indicada
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: dia=$1, mes=$2, anyo=$3
# SALIDA: Dia de la semana correspondiente
#
# FECHA: 02/02/2023
# VERSIONES: 1.0.0 
#
#########################

dia=$1
mes=$2
anyo=$3

if [[ -z $dia || -z $mes || -z $anyo ]]
then
    echo "Deben introducirse todos los valores"
    exit
fi

date_day=$( date -d "$anyo/$mes/$dia" +%A )

echo "El día correspondiente a la fecha de $dia/$mes/$anyo es $date_day"

