@echo off
REM #########################
REM #
REM # NOMBRE: ej15-rectangulo.bat
REM # OBJETIVO: Calcular el área de un cuadrado así como dibujar este en la terminal
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: base=%1, altura=%2  
REM # SALIDA: Área del cuadrado y su imagen
REM #
REM # FECHA: 14/02/2023
REM # VERSIONES: 1.0.0
REM #
REM #########################

set base=%1
set altura=%2

if "%base%" == "" ( set base=7 )
if "%altura%" == "" ( set altura=4 )

for /L %%i in (1, 1, %altura%) do (
    for /L %%i in (1, 1, %base%) do (
        <NUL set /p=# 
    )
    echo:
)

REM Para hacer salto de linea se ha utilizado echo: https://stackoverflow.com/questions/132799/how-can-i-echo-a-newline-in-a-batch-file
REM Para imprimir sin salto de linea se ha utilizado <NUL set /p= https://stackoverflow.com/questions/7105433/windows-batch-echo-without-new-line

