@echo off
REM #########################
REM #
REM # NOMBRE: ej11-calculadora.bat
REM # OBJETIVO: Realizar diversas operaciones sobre dos valores dados
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: n1=%1, n2=%2 
REM # SALIDA:Resultado de la operación seleccionada
REM #
REM # FECHA: 13/02/2023
REM # VERSIONES: 1.0.0
REM #
REM #########################

set n1=%1
set n2=%2

if "%n1%" == "" ( set /p n1=Introduzca el primer valor: )
if "%n2%" == "" ( set /p n2=Introduzca el segundo valor: )
echo =====================
echo  M *** E *** N *** U
echo =====================
echo  1. Suma
echo  2. Resta
echo  3. Multiplicacion
echo  4. Division
echo  5. Modulo
REM En el procentaje el segundo número es el total y el primero la parte que se quiere calcular en %
echo  6. Porcentaje
echo =====================

REM Para que no aparezcan las opciones y el simbolo ? se ha utilizado /N

choice /C 123456 /M "Eliga una opcion" /N

set /a suma=%n1%+%n2%
set /a resta=%n1%-%n2%
set /a mult=%n1%*%n2%
set /a div=%n1%/%n2%
set /a mod=%n1% %% %n2%
set /a porc= %n1%*(100/%n2%)

if %errorlevel%==1 ( 
    set /a suma=%n1%+%n2%
    echo %suma%
)

if %errorlevel%==2 ( 
    set /a resta=%n1%-%n2%
    echo %resta%
)

if %errorlevel%==3 (
    set /a mult=%n1%*%n2%
    echo %mult%
)

if %errorlevel%==4 (
    set /a div=%n1%/%n2%
    echo %div%
)

if %errorlevel%==5 (
    set /a mod=%n1% %% %n2%
    echo %mod%
)

if %errorlevel%==6 ( 
    set /a porc= %n1%*100/%n2%
    echo %porc%
)

