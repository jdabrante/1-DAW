#!/bin/bash
#########################
#
# NOMBRE: ej09-info_ruta.sh
# OBJETIVO:Mostrar información de ficheros
# AUTOR:Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA:Información de ficheros 
#
# FECHA:30/01/23
# VERSIONES:1.0.0
#
#########################

argument=$1

if [ $# -eq 0 ]
then
	echo "No se han introducido argumentos"
	exit
fi

if [ -e $argument ]
then
	if [ -f $argument ]
	then
		echo "Es un fichero"
	elif [ -d $argument ]
	then
		echo "Es un directorio"
	elif [ -h $argument ]
	then
		echo "Es un enlace simbólico"
	fi
	if [ -x $argument ]
	then
		echo "Es ejecutable"
	fi
	if [ -w $argument ]
	then
		echo "Tiene permisos de escritura"
	fi
	if [ -r $argument ]
	then
		echo "Tiene permisos de lectura"
	fi

else
	echo "El argumento no existe"
	exit
fi