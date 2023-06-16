#!/bin/bash

#########################
#
# NOMBRE: ej12-multiplo.sh
# OBJETIVO: Concluir si los valores introducidos como argumentos son o no múltiplicos de un número dado
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: 
# SALIDA: Números que son múltiplicos y aquellos que no
#
# FECHA: 08/02/2023
# VERSIONES: 1.0.0
#
#########################

read -p "Introduzca un valor: " value
for number in "$@";
do
    modul=$(( $number%$value ))
    if [[ $modul -eq 0 ]]
    then 
        echo "El número $number SÍ es múltiplo de $value"
    else
        echo "El número $number NO es múltiplo de $value"
    fi
done