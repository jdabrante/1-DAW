#!/bin/bash

#########################
#
# NOMBRE: Dar permisos a script
# OBJETIVO: Dar permisos de ejecución al script
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Fichero ejecutable y se ejecuta
#
# FECHA: 19/01/23
# VERSIONES: 1.0
#
#########################

script=$1

if [ -n "$script" ] &&  [ -e "$script" ] && [  -f "$script" ] && [ ! -x "$script" ] && [ -0 "$script" ]
then
	chmod u+x "$script"
	./"$script"
fi
