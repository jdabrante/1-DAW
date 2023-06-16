#!/bin/bash

#########################
#
# NOMBRE: ej05-calcula_segundos.sh
# OBJETIVO: Convertir de días,horas,minutos y segundos a segundos.
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: días=1,horas=2,minutos=3,segundos=4
# SALIDA: Segundos
#
# FECHA: 26/01/23
# VERSIONES:1.0.0 
#
#########################

dias=$1
horas=$2
minutos=$3
segundos=$4
operacion=$(( $dias*24*3600 + $horas*3600 + $minutos*60 + $segundos ))

echo "$dias días,$horas horas, $minutos minutos y $segundos segundos son $operacion segundos"
