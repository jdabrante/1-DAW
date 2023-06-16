#!/bin/bash

#########################
#
# NOMBRE: ej16-password.sh
# OBJETIVO: Comproar contraseña introducida
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Comprobar que la contraseña que se ha introducido por segunda vez es igual a la primera
#
# FECHA: 09/02/2023
# VERSIONES: 1.0.0
#
#########################

read -s -p "Introduzca la contraseña: " passw1
echo ""

while true;
do 
    read -s -p "Introduzca nuevamente la contraseña: " passw2
    echo ""
    if [[ $passw2 == $passw1 ]];
    then
        echo "La contraseña es correcta"
        exit
    else
        echo -n "La contraseña es incorrecta. "
    fi
done


