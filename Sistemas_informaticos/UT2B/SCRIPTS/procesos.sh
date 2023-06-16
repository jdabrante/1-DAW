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


# maxCPU=$1
# maxMem=$2

maxCPU=$1
maxMem=$2


if [[ -z $maxCPU || -z $maxMem ]]
then 
    echo "Falta información de los parámetros"
    exit 100
fi 
if [[ $maxCPU -lt 0 || $maxMem -lt 0 ]]
then
    echo "Los valores deben ser mayores o iguales a 0"
    exit 200
fi
if [[ $maxMem -gt 100 ]]
then 
    echo "La memoria máxima debe ser menor o igual que 100"
    exit 150
fi
user=$(whoami)
trap " { echo ' '; echo 'Se interrumpe la ejecución' ; exit 0; }" SIGINT
trap " { echo ' '; echo 'Finalizando ejecución' ; exit 0; }" SIGQUIT
trap " { echo ' '; echo 'Carga del sistema: ';  uptime; }" SIGUSR1
trap " { echo ' '; echo 'Se reininicar todos los procesos congelados' ; killall -HUP $user ; }" SIGUSR2

while true
    do
    while true;
    do 

        current_maxmem=$(ps aux --sort=+%mem | tail -n 1 | tr -s " " | cut -d" " -f4)
        current_cpu=$(ps aux --sort=+%cpu | tail -n 1 | tr -s " " | cut -d" " -f3)
    
        if [[ ($(echo "$current_maxmem < $maxMem" | bc -l) == "1") && ($(echo "$current_cpu < $maxCPU" | bc -l) == "1") ]]
        then
            sleep 30
        else
            break
        fi
    done

    if [[ $(echo "$current_maxmem < $maxMem" | bc -l) == "1" ]]
    then
        target=$(ps aux --sort=+%mem | tail -n 1 | tr -s " " | cut -d" " -f2)
        echo $(ps $target)
    elif [[ $(echo "$current_cpu < $maxCPU" | bc -l) == "1" ]]
    then
        target=$(ps aux --sort=+%mem | tail -n 1 | tr -s " " | cut -d" " -f2)
        echo $(ps $target)
    fi


    echo "*******************"
    echo "*  M   E   N   Ú  *"
    echo "*******************"

    echo "1) Ignorar y seguir comprobando"
    echo "2) Disminuir 3 puntos la prioridad"
    echo "3) Interrumpir el proceso"
    echo "4) Terminar el proceso"
    echo "5) Finalizar inmediatamente el proceso"
    echo "6) Detener el proceso ('congelarlo' de forma evitable)"
    echo "7) Detener el proceso ('congelarlo' de forma inevitable)"
    echo "8) Salir"

    read -p "Elige una opción: " option

    case $option in 
    1)
        continue
    ;;
    2)
        renice +3 $target
        break
    ;;
    3)
        kill -SIGINT $target
        break
    ;;
    4)
        kill -SIGQUIT $target
        break
    ;;
    5) 
        kill -SIGKILL $target
        break
    ;;
    6) 
        kill -SIGTSTP $target
    ;;
    7) 
        kill -SIGSTOP $target
    ;;
    8)
        break
    esac
done

