#!/bin/bash
#########################
#
# NOMBRE: servicios.sh
# OBJETIVO: Gestionar un servicio existente asi como recivir información del mismo
# AUTOR: Ricardo Antonio García Zamora, Juan Dimas Abrante Hernández
# ARGUMENTOS: service=$1
# SALIDA: Información acerca del servicio, así como habilitar/deshabilitar, activar/desactivar y enmascarar/desenmascarar el mismo.
#
# FECHA: 14/03/2023
# VERSIONES: 1.0.0
#
#########################

service=$1

while [[ -z $service ]]
do 
    read -p "No se ha introducido argumentos. Introduzca un servicio: " service
done 

# Se utiliza el 2> /dev/null para que los errores no sean mostrados.
if [[ $(systemctl status $service 2> /dev/null | wc -l ) -eq 0 ]]
then
    echo "Error. No se encuentra el servicio indicado."
    exit 10
fi

    echo $service
    echo ""

while true
do
    echo ""
    echo "===========RESUMEN===ESTADO==========="

    if [[ $(systemctl is-active $service) == "active" ]]
    then
        activo="si"
        echo "- Activo: Sí"
    else
        activo="no"
        echo "- Activo: No"
    fi

    if [[ $(systemctl is-enabled $service) == "enabled" ]]
    then
        habilitado="si"
        echo "- Habilitado: Sí"
    else
        habilitado="no"
        echo "- Habilitado: No"
    fi
    
    if [[ $(systemctl is-enabled $service) == "masked" ]]
    then
        enmascarado="si"
        echo "- Enmascardo: Sí"
    else
        enmascarado="no"
        echo "- Enmascardo: No"
    fi
    echo "======================================"
    echo ""
    echo "==================="
    echo "=  M   E   N   Ú  ="
    echo "==================="
    echo ""


    if [[ $activo == "si" ]]
    then
        echo "1) Desactivar $service"
    elif [[ $activo == "no" ]] && [[ $enmascarado == "no" ]]
    then
        echo "1) Activar $service"
    else 
        echo "1) El servicio $service se encuentra enmascarado. Operación no disponible."
    fi


    if [[ $habilitado == "si" ]]
    then 
        echo "2) Deshabilitar $service"
    elif [[ $habilitado == "no" ]] && [[ $enmascarado == "no" ]]
    then
        echo "2) Habilitar $service"
    else
        echo "2) El servicio $service se encuentra enmascarado. Operación no disponible."
    fi


    if [[ $enmascarado == "si" ]]
    then
        echo "3) Desenmascarar $service"
    else
        echo "3) Enmascarar $service"
    fi

    echo "4) Mostrar configuración de $service"

    if [[ $enmascarado == "si" ]]
    then
        echo "5) El servicio $service se encuentra enmascarado. Operación no disponible."
    else
        echo "5) Aplicar cambios en la configuración dejando el servicio $service activo"
    fi

    if [[ $enmascarado == "si" ]] 
    then
        echo "6) El servicio $service se encuentra enmascarado. Operación no disponible."
    else
        echo "6) Aplicar cambios en la configuración dejando el servicio $service en su último estado"
    fi

    echo "7) Mostrar el tiempo de carga total del sistema"
    echo "8) Mostrar el tiempo de carga de $service"
    echo "9) Apagar la máquina"
    echo "10) Reiniciar la máquina"
    echo "11) Salir"
    echo ""

    read -p "Elige una opción: " option

    case $option in 
    1)
        if [[ $activo == "si" ]]
        then
            sudo systemctl stop $service > /dev/null 2> /dev/null
        elif [[ $activo == "no" ]] && [[ $enmascarado == "no" ]]
        then
            sudo systemctl start $service > /dev/null 2> /dev/null
        else 
            echo "❌ Esta operación no está disponible. "
        fi
    ;;
    2)
        if [[ $habilitado == "si" ]]
        then 
            sudo systemctl disable $service > /dev/null 2> /dev/null
        elif [[ $habilitado == "no" ]] && [[ $enmascarado == "no" ]]
        then
            sudo systemctl enable $service > /dev/null 2> /dev/null
        else
            echo "❌ Esta operación no está disponible"
        fi
    ;;
    3)
        if [[ $enmascarado == "si" ]]
        then
            sudo systemctl unmask $service > /dev/null 2> /dev/null
        else
            sudo systemctl mask $service > /dev/null 2> /dev/null
        fi
    ;;
    4)
        systemctl show $service
    ;;
    5)
        if [[ $enmascarado == "no" ]]
        then
            sudo systemctl reload-or-restart $service > /dev/null 2> /dev/null
        else
            echo "❌ Esta operación no está disponible. "
        fi
    ;;
    6) 
        if  [[ $enmascarado == "no" ]]
        then 
            sudo systemctl try-reload-or-restart $service > /dev/null 2> /dev/null
        else 
            echo "❌ Esta operación no está disponible. "
        fi
    ;;
    7) 
        systemd-analyze
    ;;
    8) 
        systemd-analyze blame | grep $service.
    ;;
    9)
        sudo systemctl isolate runlevel0.target
    ;;
    10)
        sudo systemctl isolate runlevel6.target
    ;;
    11)
        exit
    esac
done   