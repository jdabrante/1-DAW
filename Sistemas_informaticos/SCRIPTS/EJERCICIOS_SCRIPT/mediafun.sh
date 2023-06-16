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

#Como aplicar una función en bash:

function calcula_media {
	local valores="$@"
	local num_arg="$#"
	local media=0
	if [ "$num_arg" -eq 0 ]
	then 
		echo "ERROR: No se han indicado argymentos"
		return 140
	fi

	for valor in $valores
	do 
		 ((media += valor))
	done 

	(( media /= num_arg ))
	echo "$media"
}

a=(234 23434 3434 234 432)
calcula_media  ${a[@]}
b=(23424324 3423423 3442342343 34243242332)
calcula_media ${b[@]}

