#!/bin/bash

#########################
#
# NOMBRE:
# OBJETIVO:
# AUTOR: Juan Dimas Abrante Hernández
# ARGUMENTOS: Ninguno 
# SALIDA: 
#
# FECHA: 
# VERSIONES: 
#
#########################
clear
echo "*~~~~~~~~~~~~~~*"
echo "*  M  E  N  Ú  *"
echo "*~~~~~~~~~~~~~~*"
echo ""
echo "1: Ir al home"
echo "2: Crear directorio"
echo "3: Que me diga el usuario"
echo "4: Imprime la fecha"
echo "5: Borrar directorio"
echo "6: Crear fichero"
read -p "Indica la opción " opcion 

case $opcion in 
	1) 	echo "Ante estaban en $PWD"
		cd
		echo "Ahora estoy en $PWD"
	;;
	2) read -p "Dime el nombre del directorio: " dir
		mkdir $dir
	;;
	3) whoami
	;;
	4) date
	;;
	5) read -p "Dime el directorio que quieres borrar: " dir
		rmdir $dir
	;;
	6) read -p "Dime el nombre del fichero que quieres crear: " fich
		nano $fich
	;; 
esac
