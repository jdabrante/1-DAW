@echo off
REM #########################
REM #
REM # NOMBRE:ej12-multiplo.
REM # OBJETIVO: Concluir si los valores introducidos como argumentos son o no múltiplicos de un número dado
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: Ninguno 
REM # SALIDA: Números que son múltiplicos y aquellos que no
REM #
REM # FECHA: 13/02/2023
REM # VERSIONES: 1.0.0
REM #
REM #########################

setlocal enabledelayedexpansion
REM Para poder trabajar con la variable i, es decir, el número que está dando como resultado de la iteración, ha sido necesario utilizar el setlocal enabledelayedexpansion
set /p valor=Introduzca un valor:

for %%i in (%*) do ( 
    set iteracion=%%i
    set /a operation=!iteracion! %% !valor!
    if "!operation!"=="0" ( echo El numero !iteracion! SI es multiplo de !valor!) else (
        echo El numero !iteracion! NO es multiplo de !valor!
    )
)
