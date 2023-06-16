#!/bin/bash

#########################
#
# NOMBRE: ej15-rectangulo.sh
# OBJETIVO: Calcular el área de un cuadrado así como dibujar este en la terminal
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: base=$1, altura=$2 
# SALIDA: Área del cuadrado y su imagen
#
# FECHA: 09/02/2023
# VERSIONES: 1.0.0
#
#########################

base=$1
altura=$2

if [[ -z $base ]]
then
    base=7
fi
if [[ -z $altura ]]
then
    altura=4
fi

if [[ $base -eq $altura ]]
then 
    echo "Vamos a pintar un cuadrado con base y altura $base, con un área de $(( $base**2 ))"
else
    echo "Vamos a pintar un rectángulo con base: $base, altura: $altura y área: $(( $base*$altura ))"
fi
echo ""
for _ in $(seq $altura);
do
    for _ in $(seq $base);
    do
        echo -n "# "
    done
    echo ""
done
echo ""
