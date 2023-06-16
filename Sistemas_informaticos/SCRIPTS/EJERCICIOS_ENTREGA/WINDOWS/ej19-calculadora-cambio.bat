@echo off
REM #########################
REM #
REM # NOMBRE:ej19-calcula_cambio.bat
REM # OBJETIVO: Calcular el cambio en billetes que se debe de aportar tras una compra
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: Ninguno 
REM # SALIDA:Número de billetes que se deben devolver de cada valor.
REM #
REM # FECHA:15/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set bills=500 200 100 50 20 10 5 2 1

set price=%1
set /p paid=Indique el dinero pagado: 

setlocal enabledelayedexpansion

set /a total_change=!paid!-!price!
echo Se ha comprado un articulo de !price! euros y ha pagado !paid! euros.
echo El cambio son !total_change! euros, debe entregar:
for %%a in (!bills!) do (
    set bill=%%a
    set /a operation=!total_change!-!bill!
    if !operation! GEQ 0 (
        set /a money_back=!total_change!/!bill!
        set /a total_change=!total_change!%%!bill!
        echo !money_back! billetes de !bill! euros
    )
)