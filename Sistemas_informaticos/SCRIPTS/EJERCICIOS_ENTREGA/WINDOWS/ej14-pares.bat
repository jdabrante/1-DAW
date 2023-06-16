@echo off
REM #########################
REM #
REM # NOMBRE: ej14-pares.bat
REM # OBJETIVO: Calcular el cuadrado de los números pares que hay entre dos números
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: n1=%1,n2=%2 
REM # SALIDA: Cuadrado de los números pares que existen entre dos números
REM #
REM # FECHA: 14/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set n1=%1
set n2=%2

:x
if "%n1%"=="" ( set /p n1=Introduce el primero valor: )
if "%n1%"=="" ( goto :x )
:y
if "%n2%"=="" ( set /p n2=Introduce el segundo valor: )
if "%n2%"=="" ( goto :y )

setlocal enabledelayedexpansion

REM Para poder trabajar con la variable i, es decir, el número que está dando como resultado de la iteración, ha sido necesario utilizar el setlocal enabledelayedexpansion
REM En este caso el código es repetitivo, tal vez se podria mejorar creando una función

if %n1% GTR %n2% ( 
    set /a n1=%n1%-1
    set /a n2=%n2%+1
    for /L %%x in (!n1!, -1, !n2!) do (
    set number=%%x
    set /a operation=!number! %% 2
    set /a cuadrado=!number!*!number!
    if "!operation!" == "0" ( echo el cuadro del numero par !number! es !cuadrado! )
    )
 ) else (
    set /a n1=%n1%+1
    set /a n2=%n2%-1
    for /L %%x in (!n1!, 1, !n2!) do (
    set number=%%x
    set /a operation=!number! %% 2
    set /a cuadrado=!number!*!number!
    if "!operation!" == "0" ( echo el cuadro del numero par !number! es !cuadrado! )
    )
 )

