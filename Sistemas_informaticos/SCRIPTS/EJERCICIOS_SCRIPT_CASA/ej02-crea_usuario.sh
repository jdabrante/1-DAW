#!/bin/bash

#########################
#
# NOMBRE: ej02-crea_usuario.sh
# OBJETIVO: Crear usuario
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: Datos del usuario
#
# FECHA: 26/01/23
# VERSIONES: 1.0.0
#
#########################

nombre=$1
apellidos=$2
usuario=$3
id=$RANDOM

echo "Biendenido $nombre"
echo "Tus datos son: $nombre $apellidos"
echo "Vamos a crear tu usuario: $usuario"
echo "Tu nueva ID es $id"
