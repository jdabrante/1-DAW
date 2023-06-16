#!/bin/bash

#########################
#
# NOMBRE: ej01-resta.sh
# OBJETIVO: Calcular la resta entre dos numeros
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: n1=$1, n2=2$ 
# SALIDA: Resultado de la resta
#
# FECHA: 02/02/2023
# VERSIONES: 1.0.0
#
#########################

n1=$1
n2=$2
num='^[0-9]+$'

#No es para nada necesario este bucle para el ejercicios. No obstante se ha añadido para comprobar que los argumentos de entrada son números.

while [[ !($n1 =~ $num) || !($n2 =~ $num) || ( -z $n1 ) || ( -z $n2 ) ]]
do
    if [[ -z $n1 || !($n1 =~ $num) ]]
        then
            read -p "Introduzca un primer argumento valido: " n1
    fi
    if [[ -z $n2 || !($n2 =~ $num) ]]
        then
            read -p "Introduzca un segundo argumento valido: " n2
    fi
done

substract=$(( n1-n2 ))

echo "El resultado de restar $n1 y $n2 es $substract"
