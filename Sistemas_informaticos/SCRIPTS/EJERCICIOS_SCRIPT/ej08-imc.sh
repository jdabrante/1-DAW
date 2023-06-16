#!/bin/bash

#########################
#
# NOMBRE: INFO RUTA
# OBJETIVO: Mostrar información de ficheros, diretorios, etc.
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Información sobre la ruta
#
# FECHA: 19/01/23
# VERSIONES: 1.0
#
#########################

ruta=$1

# -n --> no empty

if [ -z "$ruta" ]
then 
	echo "ERROR: el scrip $0 debe de ejecutarse con un argumento (ruta)"
	exit
fi 

if [ ! -e "$ruta" ] #Saber si existe
then 
	echo "La ruta '$ruta' NO existe"
	exit
fi

if [ -d "$ruta" ]
then 
	echo "La ruta '$ruta' es un directorio"

elif [ -f "$ruta"  ]
then 
	echo "La ruta '$ruta' es un fichero"

elif [ -h "$ruta" ]
then 
	echo "La ruta '$ruta' es un  enlace simbólico"
else 
	echo "La ruta '$ruta' es  de otro tipo"
fi 

echo -n "Permisos de $ruta: "

if [ -r $ruta ]
then 
	echo  -n " tiene permisos de lectura, " # --> -n Para que no haya saltos de linea
else 
	echo -n "no tiene permisos de lectura, "
fi

if  [ -w $ruta ]
then 
	echo -n "tiene permisos de escritura"
else
	echo -n "no tiene permisos de escritura"
fi

if [ -x $ruta ]
then 
	echo -n  " y tiene permisos de ejecución"
else
	echo -n " y no tiene permisos de ejecución"
fi

#Tamaño 

if [ -s $ruta ]
then 
	echo " y, además tiene un tamaño > 0 bytes"
else 
	echo " y, además está vacio"
fi
