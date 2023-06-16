#!/bin/bash

#########################
#
# NOMBRE: ej04-dia_semana.sh
# OBJETIVO: calcular el dia de la semana
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: total=3 dia=1,mes=2, año=3 
# SALIDA: Datos

# FECHA: 17/01/2023
# VERSIONES: 1.0 (código inicial)
#
#########################

dia=$1
mes=$2
anyo=$3
calculo=$(date -d $anyo-$mes-$dia +"%A")
echo "El dia de la semana indicada ($dia/$mes/$anyo) fue $calculo"
