#!/bin/bash

#########################
#
# NOMBRE:
# OBJETIVO:
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: dias=1, horas=2, minutos=3, segundos=4
# SALIDA: Total de segundos
#
# FECHA: 17/01/23
# VERSIONES: 1.0
#
#########################

# Crear un script llamado ej05-calcula_segundos.sh al que se le pasen 4 parámetros (1: días, 2: horas, 3: minutos, 4: segundos). El script devolverá el total de segundos del tiempo indicado.
#Ejemplo: ./calcula_segundos.sh 4 3 29 54 --> 4 días, 3 horas, 29 minutos y 54 segundos son 358.194 segundos.

dias=$1
horas=$2
minutos=$3
segundos=$4

calculo=$(( (dias*24*3600)+(horas*3600)+(minutos*60)+segundos))

echo "El total de segundos de $dias dias,$horas horas,$minutos minutos,$segundos segundos son $calculo segundos."


