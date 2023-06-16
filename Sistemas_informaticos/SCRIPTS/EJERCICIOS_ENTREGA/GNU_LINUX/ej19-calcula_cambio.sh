#!/bin/bash

#########################
#
# NOMBRE: ej19-calcula_cambio.sh
# OBJETIVO: Calcular el cambio en billetes que se debe de aportar tras una compra
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Número de billetes que se deben devolver de cada valor.
#
# FECHA: 15/02/2023
# VERSIONES: 1.0.0
#
#########################

price=$1
bills=(500 200 100 50 20 10 5 2 1)
read -p "Indique el dinero pagado: " paid

total_money_back=$(( $paid-$price ))

for bill in ${bills[@]};
do 
    if [[ $(( $total_money_back-$bill )) -ge 0 ]]
    then
        money_back=$(( $total_money_back/$bill ))
        total_money_back=$(( $total_money_back%$bill ))
        echo "$money_back billete(s) de $bill euro(s)"
    fi
done
