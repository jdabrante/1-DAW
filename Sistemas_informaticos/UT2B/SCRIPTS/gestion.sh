#!/bin/bash
#########################
#
# NOMBRE: gestion.sh
# OBJETIVO: Realizar diversas operaciones así como comprobaciones de un paquete dado
# AUTOR: Adrían Herrera Brito, Juan Dimas Abrante Hernández
# ARGUMENTOS: package=$1
# SALIDA: Información acerca del paquete que se está seleccionando
#
# FECHA: 01/03/2023
# VERSIONES: 1.0.0
#
#########################

package=$1

while [[ -z $package ]]
do
    read -p "Introduzca el nombre del paquete: " package
done 

 

echo $(sudo apt-get update)
echo ""
check=$(apt-mark showinstall $package)
if [[ -z "$check" ]];
then 
    show_pkg=$(apt-cache show $package)
    if [[ ! -z $show_pkg ]]
    then 
        echo $show_pkg
        echo ""
        echo "=================================================================================="
        echo ""
        read -p "¿Desea instalar el paquete $package? [S/N] " answer
        echo ""
#Se utiliza ${var,,} para para pasar a minúscula la variable. Fuente: https://stackoverflow.com/questions/1728683/case-insensitive-comparison-of-strings-in-shell-script
        if [[ "${answer,,}" == "s" ]]
        then
            sudo apt-get install $package
        else
            echo "Saliendo de la instalacion"
            exit
        fi
    fi
else
    while true
    do    
    echo "*******************"
    echo "*  M   E   N   Ú  *"
    echo "*******************"

    echo "1) Mostrar su version"
    echo "2) Reinstalarlo"
    echo "3) Actualizarlo"
    echo "4) Eliminarlo (guardando la configuracion)"
    echo "5) Eliminarlo totalmente"
    echo "6) Salir"

    read -p "Elige una opción: " option

    case $option in 
    1)
        $package --version || dpkg -s $package
    ;;
    2)
        sudo apt-get -y reinstall $package
    ;;
    3)
        sudo apt-get install --only-upgrade $package
    ;;
    4)
        sudo apt-get remove $package
    ;;
    5) 
       sudo apt-get autoremove $package
    ;;
    6) exit
    esac
    done
fi