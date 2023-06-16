#!/bin/bash

#########################
#
# NOMBRE: ej20-calculadora_func.sh
# OBJETIVO: Mostrar por terminal un menú con diversas opciones para los valores introducidos
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: n1=$1,n2=$2
# SALIDA: Resultado de la operación realizada
#
# FECHA: 15/02/2023
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

function suma {
    operation=$(( $n1 + $n2 ))
    echo "La suma de $n1 mas $n2 es igual a $operation"
}
function resta {
    operation=$(( $n1 - $n2 ))
    echo "La resta de $n1 menos $n2 es igual a $operation"
}
function mult {
    operation=$(( $n1 * $n2 ))
    echo "El producto de $n1 y $n2 es igual a $operation"
}
function div {
    operation=$(( $n1/$n2 ))
    echo "La división de $n1 entre $n2 es igual a $operation"
}
function mod {
    operation=$(( $n1%$n2 ))
    echo "El resto de dividir $n1 entre $n2 es igual a $operation"
}
function exp {
    operation=$(( $n1**$n2 ))
    echo "El resultado de elevar $n1 a $n2 es igual a $operation"
}

case $option in 
    1) suma ;;
    2) resta ;;
    3) mult ;;
    4) div ;;
    5) mod ;;
    6) exp ;;
    *)
        echo "Error.Opción no válida."
esac
