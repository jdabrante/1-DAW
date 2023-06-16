#!/bin/bash

#########################
#
# NOMBRE: ej17-deposito.sh
# OBJETIVO: Simular depósito a plazo fijo de interés compuesto
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Mostrar por cada año cuanto dinero tiene el banco y lo que ha ido ganando con respecto a la cantidad aportada inicialmente
#
# FECHA: 10/02/2023
# VERSIONES: 1.0.0
#
#########################

deposito=$1
tae=$2
anyos=$3

if [[ -z $deposito || -z $tae || -z $anyos ]]
then
    echo "Se deben pasar 3 argumentos: despósito inicial, %TAE, años"
    exit 100
fi
echo "Mostrando los datos para un depósito de $deposito euros con interés $tae% a $anyos años:"
echo ""
for anyo in $(seq $anyos);
do
    result=$(echo "scale=2;$deposito*(1+($tae/100))" | bc -l)
    dif=$(echo "scale=2;$result-$deposito" | bc -l)
    echo "Año $anyo: $deposito * (1 + $tae / 100) = $result euros (en total has ganado $dif euros)"
    echo "========================================================================================="
    deposito=$result
    
done