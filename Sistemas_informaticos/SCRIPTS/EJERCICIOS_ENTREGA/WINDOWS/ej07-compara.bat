@echo off
REM #########################
REM #
REM # NOMBRE:ej07-compara.bat
REM # OBJETIVO: Comparar dos números y calcular cual de ellos es el mayor
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: n1=%1,n2=%2
REM # SALIDA: Número mayor
REM #
REM # FECHA: 12/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set n1=%1
set n2=%2

if "%n1%" == "" ( set /p n1=Introduzca el primer valor: )

if "%n2%" == "" ( set /p n2=Introduzca el segundo valor: )

if "%n1%" GTR "%n2%" ( echo El %n1% es el mayor ) else if "%n1%" LSS "%n2%" ( echo El %n2% es el mayor) else ( echo %n1% y %n2% son iguales)
