#!/bin/bash

#########################
#
# NOMBRE: ej02-crea_usuario.sh
# OBJETIVO: Crear un usuario
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: nombre=$1,apellidos=$2,usuario=$3 
# SALIDA: Se mostrará por pantalla los datos correspondientes al usuario
#
# FECHA: 02/02/2023
# VERSIONES: 1.0.0
#
#########################

nombre=$1
apellidos=$2
usuario=$3
ID=$RANDOM

if [[ $# -gt 3 ]]
   then
       echo "Los valores con espacios deben ir entre comillas dobles si quieren pasar como argumentos, introduzca nuevamente los valores: "
       read -p "Nombre: " nombre
       read -p "Apellidos: " apellidos
       read -p "Usuario: " usuario
fi
if [[ -z $nombre || -z $apellidos || -z $usuario ]]
    then
        echo "Error. No se han introducido todos los campos"
        exit
fi

echo "Bienvenido, $nombre"
echo "Tus datos son $nombre $apellidos"
echo "Vamos a crear tu usuario $usuario"
echo "Tu nueva ID es $ID"
