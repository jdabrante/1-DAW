#!/bin/bash

#########################
#
# NOMBRE: ej13-rutas.sh
# OBJETIVO: 
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: 
#
# FECHA: 10/02/2023
# VERSIONES: 1.0.0
#
#########################

ruta_actual=$( ls )
regular_exp='.{4,}$'
for fichero in $ruta_actual

do
    if [[ $fichero =~ $regular_exp ]]
    then
    echo "$fichero elemento es: "
    echo ""
        if [ -f $argument ]
        then
            echo -n "Un fichero,"
        elif [ -d $argument ]
        then
            echo -n "Un directorio,"
        elif [ -h $argument ]
        then
            echo -n "Un enlace simbólico,"
        fi
        if [ -x $argument ]
        then
            echo -n " es ejecutable"
        fi
        if [ -w $argument ]
        then
            echo -n " tiene permisos de escritura"
        fi
        if [ -r $argument ]
        then
            echo -n "tiene permisos de lectura"
        fi
        echo ""
        echo "=============================="
    fi
done