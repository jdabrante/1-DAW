#!/bin/bash

#########################
#
# NOMBRE: ej18-arrays.sh
# OBJETIVO: Insertar los numeros pares al principio de una lista y los impares al final. Los valores negativos se descartan
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Array de datos
# SALIDA: Valores ordenados por pares e impares, empezando por los pares y terminando por los impares.
#
# FECHA: 17/02/2023
# VERSIONES: 1.0.0
#
#########################

array=("$@")
declare -a datos


echo "Se han recibido $# argumentos: ${array[@]}"
for number in ${array[@]};
do
    if [[ number -ge 0 ]]
    then
        operation=$(( $number%2 ))
        if [[ $operation -eq 0 ]]
        then
        datos=("$number" "${datos[@]}")
        echo "$number se inserta por el PRINCIPIO porque es PAR"
        else
        datos+=( "$number" )
        echo "$number se inserta por el FINAL porque es IMPAR"
        fi
    else
        echo "Se ignora el valor $number por ser negativo"
    fi
done

max=$datos[0]
min=$datos[0]
sum=0
for number in ${datos[@]};
do
    if [[ $number > $max ]]
    then
        max=$number
    else
        min=$number
    fi
    sum=$(( $sum+$number ))
done
avg=$(echo "scale=2;$sum/${#datos[@]}" | bc -l)
echo "-----"
echo "Array construido (${#datos[@]} elementos): ${datos[@]}"
echo "MIN:$min,MAX:$max,MEDIA:$avg"
