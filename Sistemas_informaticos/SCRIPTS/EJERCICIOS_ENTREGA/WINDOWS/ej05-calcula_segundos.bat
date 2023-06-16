@echo off
REM #########################
REM #
REM # NOMBRE:ej05-calcula_segundos.bat
REM # OBJETIVO: Calcular los segundos totales correspondientes a dias,horas,minutos y segundos dados.
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: dias=%1,horas=%2,minutos=%3,segundos=%4
REM # SALIDA: Número total de segundos
REM #
REM # FECHA: 12/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set dias=%1
set horas=%2
set minutos=%3
set segundos=%4


if "%dias%" == "" (set /p dias=Introduzca los dias: )

if "%horas%" == "" (set /p horas=Introduzca las horas: )

if "%minutos%" == "" (set /p minutos=Introduzca los minutos: )

if "%segundos%" == "" (set /p segundos=Introduzca los segundos: )

set /a operation= %dias%*24*3600 + %horas%*3600 + %minutos%*60 + %segundos%
echo %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos, equivalen a %operation% segundos