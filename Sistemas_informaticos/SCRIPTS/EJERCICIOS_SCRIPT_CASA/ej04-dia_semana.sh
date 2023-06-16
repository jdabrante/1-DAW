#!/bin/bash

#########################
#
# NOMBRE:eje04-dia_semana.sh
# OBJETIVO:Mostrar que día de la semana corresponde a la fecha indicada
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: año=1,mes=2,dia=3
# SALIDA: Dia de la semana correspondiente a la fecha
#
# FECHA: 26/01/23
# VERSIONES: 1.0.0
#
#########################

dia=$1
mes=$2
anyo=$3

echo "El dia de la semana correspondiente a la fecha $dia/$mes/$anyo es $(date -d $anyo-$mes-$dia +"%A")" 
