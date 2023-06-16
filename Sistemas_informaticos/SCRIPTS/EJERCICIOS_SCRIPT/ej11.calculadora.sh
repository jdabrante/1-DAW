#!/bin/bash

#########################
#
# NOMBRE: calculadora
# OBJETIVO: Hacer una calculadora simple
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: 
# SALIDA: 
#
# FECHA: 
# VERSIONES: 
#
#########################

PS3="Seleciona el número del menú: "

num1=$1
num2=$2
opciones=("Sumar" "Restar" "Dividir" "Multiplicar" "Salir") 

select opcion in ${opciones[@]}
do 

case $opcion in 
	Sumar) echo "El resultado de sumar $num1 + $num2 es $(( num1 + num2 ))"
	;;
	Restar) echo "El resultado de restar $num1 - $num2 es $(( num1 - num2 ))"
	;;
	Multiplicar) echo "El resultado de multiplicar $num1 * $num2 es $(( num1 * num2 ))"
	;;
	Dividir) echo "El resultado de dividir $num1 / $num2 es $(( num1 / num2 ))"
	;;
	Salir) break
	;;
	*) echo "Opción incorrecta"
	;;
esac	
done 	
