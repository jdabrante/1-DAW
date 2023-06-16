#!/bin/bash

#########################
#
# NOMBRE:
# OBJETIVO:
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: 
#
# FECHA: 
# VERSIONES: 
#
#########################

#Primera forma de crear un array
personas=("Dimas Abrante" Juan Paco Markus)

echo "El último invitado de la lista es ${personas[-1]}"
echo "El primer invitado de la lista es ${persona[0]}"
echo "Los dos primeros de la lista son ${personas[@]:0:2}"
echo "Hay ${#personas[@]} personas en mi lista"

for item in "${personas[@]}"
do 
	echo "En la lista tengo a: $item "
done

#Segunda forma Asignar valores

pelis[0]="A"
pelis[1]="B"
pelis[2]="C"

for peli in {0..3}
do
	echo "La película numero $peli es ${pelis[$peli]}"
done

#Si salimos fuera del rango,  le damos a una de las pelis el índice 10000 simplemente se creará un índice 10000 pero no 10000 índices.


#Mostrar índice: 

echo "Los índices son ${!pelis[@]}"

#Tercera forma 

#Con la -a ya declaramos que es un array

declare -a coches

#Se insertan al final
coches+="Ford Fiesta"
coches+="Toyota Hilux"

echo "Coches: ${coches[@]}"

