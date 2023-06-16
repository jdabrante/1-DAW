#!/bin/bash

#########################
#
# NOMBRE:ej06-calcula_segundos.sh
# OBJETIVO:Calcular los dias, horas, minutos y segundos
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: segundos=1
# SALIDA: dias, horas, minutos y segundos
#
# FECHA: 26/01/23
# VERSIONES: 1.0.0
#
#########################

segundos=$1
dias=$(( $segundos/(3600*24) ))
horas=$(( ($segundos%(3600*24))/3600 ))
min=$(( (($segundos%(3600*24))%3600)/60 ))
seg=$(( (($segundos%(3600*24))%3600)%60 ))

echo "$1 segundos son $dias dias, $horas horas, $min minutos y $seg segundos "
