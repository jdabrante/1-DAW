#!/bin/bash

#########################
#
# NOMBRE:ej08-imc.sh
# OBJETIVO:Calcular el índice de masa corporal
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Indice de masa corporal
#
# FECHA: 28/01/23
# VERSIONES: 1.0.0
#
#########################

altura=$1
peso=$2


if [ $# -eq 0 ]
then 
	read -p "Introduzca la altura en cm: " altura
	read -p "Introduzca el peso en kg: " peso
fi

imc=$(( (10000*$peso)/($altura**2) ))

if [ $imc -lt 16 ]
then
	echo "Tienes delgadez severa"
elif [ $imc -ge 16 ] && [ $imc -lt 17 ]
then
	echo "Tienes delgadez moderada"
elif [ $imc -ge 17 ] && [ $imc -lt 18 ]
then
	echo "Tienes delgadez leve"
elif [ $imc -ge 18 ] && [ $imc -lt 25 ]
then
	echo "Tienes un peso normal"
elif [ $imc -ge 25 ]
then 
	echo "Tienes sobrepeso"
elif [ $imc -gt 25 ] && [ $imc -lt 30 ]
then
	echo "Tienes preobesidad"
elif [ $imc -ge 30 ]
then 
	echo "Tienes obesidad"
elif [ $imc -gt 30 ] && [ $imc -lt 35 ] 
then 
	echo "Tienes obesidad leve"
elif [ $imc -gt 35 ] && [ $imc -lt 40 ]
then 
	echo "Tienes obesidad media"
elif [ $imc -ge 40 ]
then
	echo "Tienes obesidad mórbida"
fi



