#!/bin/bash

#########################
#
# NOMBRE: ej02-resta.sh
# OBJETIVO: calcular fahrenheit
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: total=3 nombre=1, 2=apellidos, 3=usuario 
# SALIDA: Datos

# FECHA: 17/01/2023
# VERSIONES: 1.0 (código inicial)
#
#########################

nombre=$1
apellido=$2
usuario=$3

echo "Benvenido, $nombre"
echo "Tus datos son: $nombre $apellido"
echo "Vamos a crear tu usuario: $usuario"
echo "Tu nueva ID es: $RANDOM"
echo ""
echo "Has ejecutado $0 indicado $# argumentos, los cuales son $@"
echo "Estás en la línea $LINENO y llevas ejecutando $SECONDS segundos"
echo "Eres el usuario $USER y estás en la máquina $HOSTNAME con una temrinal $TERM. Tu Home es $HOME"
