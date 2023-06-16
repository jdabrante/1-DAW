#!/bin/bash

#########################
#
# NOMBRE:ej08-imc.sh
# OBJETIVO:Dado unos valores de peso y altura de entrada, calcular el imc y con ello determinar el estado nutricional
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: altura=$1, peso=$2 
# SALIDA: Estado nutricional
#
# FECHA: 06/02/2023
# VERSIONES:1.0.0
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
	echo "Delgadez severa"
elif [ $imc -ge 16 ] && [ $imc -lt 17 ]
then
	echo "Delgadez moderada"
elif [ $imc -ge 17 ] && [ $imc -lt 18 ]
then
	echo "Delgadez leve"
elif [ $imc -ge 18 ] && [ $imc -lt 25 ]
then
	echo "Normal"
elif [ $imc -ge 25 ]
then 
	echo "Sobrepeso"
elif [ $imc -gt 25 ] && [ $imc -lt 30 ]
then
	echo "Preobesidad"
elif [ $imc -ge 30 ]
then 
	echo "Obesidad"
elif [ $imc -gt 30 ] && [ $imc -lt 35 ] 
then 
	echo "Tienes obesidad leve"
elif [ $imc -ge 35 ] && [ $imc -lt 40 ]
then 
	echo "Tienes obesidad media"
elif [ $imc -ge 40 ]
then
	echo "Tienes obesidad mórbida"
fi

