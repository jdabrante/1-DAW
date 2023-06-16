#!/bin/bash

#########################
#
# NOMBRE: ej14-pares.sh
# OBJETIVO: Calcular el cuadrado de los números pares que hay entre dos números
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: n1=$1, n2=$2
# SALIDA: Cuadrado de los números pares que existen entre dos números
#
# FECHA: 08/02/2023
# VERSIONES: 1.0.0
#
#########################

n1=$1
n2=$2

while [[ -z $n1 || -z $n2 ]]
do
if [[ -z $n1 ]]
then
    read -p "Introduzca el primero valor: " n1
fi
if [[ -z $n2 ]]
then
    read -p "Introduzca el segundo valor: " n2
fi
done

if [[ $n2 -gt $n1 ]]
then 
    START=$(( $n1 + 1 ))
    END=$(( $n2 - 1))
    echo " "
    echo "Mostrando los cuadrados pares entre $n1 y $n2: "
    echo "================================================"
    echo " "
    for number in $(seq $START $END)
    do
        div=$(( $number%2 ))
        if [[ div -eq 0 ]]
        then
            square=$(( $number**2 ))
            echo "El cuadrado del número par $number es $square"
        fi
    done
    echo " "
    echo "================================================"
else
        START=$(( $n1 - 1 ))
    END=$(( $n2 + 1))
    echo " "
    echo "Mostrando los cuadrados pares entre $n1 y $n2: "
    echo "================================================"
    echo " "
    for number in $(seq $START -1 $END)
    do
        div=$(( $number%2 ))
        if [[ div -eq 0 ]]
        then
            square=$(( $number**2 ))
            echo "El cuadrado del número par $number es $square"
        fi
    done
    echo " "
    echo "================================================"
fi