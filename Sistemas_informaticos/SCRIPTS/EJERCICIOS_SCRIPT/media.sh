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
valores="$@"
num_arg="$#"
media=0

for valor in $valores
do 
	 ((media += valor))
done 

(( media /= num_arg ))

echo "La media es $media"
