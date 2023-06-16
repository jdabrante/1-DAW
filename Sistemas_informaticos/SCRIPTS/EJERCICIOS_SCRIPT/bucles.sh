#!/bin/bash

#########################
#
# NOMBRE: BUCLES
# OBJETIVO:PRUEBAS DE BUCLES EN BASH
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: 
#
# FECHA: 
# VERSIONES: 
#
#########################

for i in 4 5 6 7 9
do 
	echo $i
done

for i in {20..30}
do 
	echo $i
done

echo "##########################"

ini=1
step=2
end=30

for i in $(seq  $ini $step $end)
do 
	echo $i
done

echo "############################"
i=1
while [ "$i" -lt 10 ]
do
	echo "W: $i"
	(( i++ ))
done
