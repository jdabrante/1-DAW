#!/bin/bash

#########################
#
# NOMBRE: ej11-calculadora.sh
# OBJETIVO: Realizar diversas operaciones sobre dos valores dados
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: n1=$1, n2=$2
# SALIDA: Resultado de la operación seleccionada
#
# FECHA: 07/02/2023
# VERSIONES: 1.0.0
#
#########################

n1=$1
n2=$2

if [[ -z $n1 ]]
then
    read -p "Introduce el primer valor: " n1
fi
if [[ -z $n2 ]]
then 
    read -p "Introduce el segundo valor: " n2
fi


echo "*******************"
echo "*  M   E   N   Ú  *"
echo "*******************"

echo "1) Suma"
echo "2) Resta"
echo "3) Multiplicación"
echo "4) División"
echo "5) Modulo"
echo "6) Exponenciación"

read -p "Elige una opción: " option

case $option in 
    1)
        suma=$(( $n1 + $n2 ))
        echo "La suma de $n1 y $n2 es igual a $suma"
    ;;
    2)
        resta=$(( $n1 - $n2 ))
        echo "La resta de $n1 menos $n2 es igual a $resta"
    ;;
    3)
        mult=$(( $n1 * $n2 ))
        echo "El producto de $n1 y $n2 es igual a $mult"
    ;;
    4)
        div=$(( $n1/$n2 ))
        echo "La división de $n1 entre $n2 es igual a $div"
    ;;
    5) 
        mod=$(( $n1%$n2 ))
        echo "El resto de dividir $n1 entre $n2 es igual a $mod"
    ;;
    6)
        exp=$(( $n1**$n2 ))
        echo "El resultado de elevar $n1 a $n2 es igual a $exp"
    ;;
    *)
        echo "Error.Opción no válida."
esac
