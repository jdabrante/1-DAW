#!/bin/bash

#########################
#
# NOMBRE:ej03-gradosC2F.sh
# OBJETIVO:Cambio de unidad, de Celsius a Fahrenheit
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: c=1 
# SALIDA: Conversión de celsius a fahrenheit
#
# FECHA:26/01/23
# VERSIONES: 1.0.0
#
#########################

c=$1
operation=$( echo "$c*1.8+32" | bc )

echo "El resultado de convertir $c grados celsius a fahrenheit es $operation grados fahrenheit"
