#!/bin/bash

#########################
#
# NOMBRE: fahrenheit.sh
# OBJETIVO: calcular fahrenheit
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Imprimire por pantalla el cambio de unidad de celsius a fahrenheit
#
# FECHA: 13/01/2023
# VERSIONES: 1.0 (código inicial)
#
#########################

#read -p "Introduce el valor en grados celsius: " c

if [ $# == 0 ] 
then 
	echo "ERROR!! Debe indicar la temperatura en grados Celsius"
	#exit
	read -p "Introduce la temperatura" celsius
fi

fahrenheit=$(echo "$1*1.8+32" | bc )

echo "$1 celsius son $fahrenheit fahrenheit"

