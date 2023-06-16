#!/bin/bash
#########################
#
# NOMBRE: ej10-menu_sistema.sh
# OBJETIVO: Mostrar datos acerca del sistema
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: option=$1
# SALIDA: Datos seleccionados del sistema
#
# FECHA: 06/02/2023
# VERSIONES: 1.0.0
#
#########################

echo "******************"
echo "* M    E   N   Ú *"
echo "******************"

PS3="Elige una opción: "

select option in porlibre tamlibre usuario maquina usuarios espacio procesador fecha salir
do
case $option in 
    porlibre)
        total=$(df -k / | grep /dev/sda1 | tr -s " " | cut -d " " -f2)
        usado=$(df -k / | grep /dev/sda1 | tr -s " " | cut -d " " -f3)
        restante=$(( $total-$usado ))
        porcentaje_restante=$(( $restante * 100/$total ))
        echo "El espacio libre de la partición raiz es del $porcentaje_restante%"
    ;;
    tamlibre)
        aviabletam=$(df -h / | grep /dev/sda1 | tr -s " " | cut -d " " -f4)
        echo "El espacio desponible de la partición raíz es de $aviabletam"
    ;;
    usuario)
        user=$(whoami)
        echo "El usuario actual es $user"
    ;;
    maquina)
        echo "El nombnre de este máquina es $(uname)"
    ;;
    usuarios)
        echo "El número de usuarios es de $(cat /etc/passwd | wc -l)"
    ;;
    espacio)
        space=$(du /home -h -s | cut -f1)
        echo "El total del espacio utilizado en todos sus directorios personales es de $space"
    ;;
    procesador)
        echo "Tu equipo tiene $(nproc --all) procesadores"
    ;;
    fecha)
        echo "La fecha de hoy es $(date +"%d/%m/%Y")"
    ;;
    salir)
        exit
    ;;
    *)
        echo "Error.Eso no es una opción válida"
esac
done
