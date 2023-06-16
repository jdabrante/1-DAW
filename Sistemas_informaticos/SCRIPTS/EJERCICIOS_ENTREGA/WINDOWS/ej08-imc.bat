@echo off
REM #########################
REM #
REM # NOMBRE:ej08-imc.bat
REM # OBJETIVO: Dado unos valores de peso y altura de entrada, calcular el imc y con ello determinar el estado nutricional
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS:altura=%1, peso=%2 
REM # SALIDA:Estado nutricional
REM #
REM # FECHA:12/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set altura=%1
set peso=%2

if "%altura%" == "" ( set /p altura=Introduzca su altura: )
if "%peso%" == "" ( set /p peso=Introduzca su peso: )




if "%peso%" == "" (  echo Error. Los campos altura y peso son obligatorios
exit
)
if "%altura%" == "" ( echo Error. Los campos altura y peso son obligatorios
exit
)

set /a imc= (10000*%peso%)/(%altura%*%altura%)

REM En batch para utilizar el operador or se puede utilizar un conjunto de ifs
REM Se ha quitado el peso bajo ya que este aparecería repetido para todos los casos en el que el imc sea menor de 19

if %imc% LSS 16 ( echo Delgadez severa )
if %imc% GEQ 16 if %imc% LSS 17 ( echo Delgadez moderada )
if %imc% GEQ 17 if %imc% LSS 19 ( echo Delgadez leve )
if %imc% GEQ 19 if %imc% LSS 25 ( echo Normal )
if %imc% GEQ 25  ( echo Sobrepeso )
if %imc% GEQ 25 if %imc% LSS 30 ( echo Preobesidad )
if %imc% GEQ 30  ( echo Obesidad )
if %imc% GEQ 30 if %imc% LSS 35 ( echo Obesidad leve )
if %imc% GEQ 35 if %imc% LSS 40 ( echo Obesidad media )
if %imc% GEQ 40 ( echo Obesidad mórbida )



