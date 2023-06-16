@echo off
REM #########################
REM #
REM # NOMBRE: ej06-calcula_tiempo.bat
REM # OBJETIVO:Calcular los días, horas, minutos y segundos a partir de un número dado de segundos
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: segundos=%1
REM # SALIDA:Los días,horas,minutos y segundos correspondientes al número dado de segundos
REM #
REM # FECHA: 12/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set segundos=%1

if  "%segundos%" == "" (
    echo Error.No se ha introdicudo ningun parametro de entrada
    exit
    )

set /a seconds_remaining=%segundos% %% ( 3600 * 24 )

set /a dias= ( %segundos% ) / ( 3600 * 24 )
set /a horas= %seconds_remaining% / 3600
set /a min= ( %seconds_remaining% %% 3600 ) / 60 
set /a seg= ( %seconds_remaining% %% 3600 ) %% 60



echo %segundos% segundos son %dias% dias, %horas% horas, %min% minutos y %seg% segundos 