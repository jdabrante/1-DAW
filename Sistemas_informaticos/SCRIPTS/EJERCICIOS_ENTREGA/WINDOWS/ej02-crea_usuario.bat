@echo off
REM #########################
REM #
REM # NOMBRE: ej02-crea_usuario.sh
REM # OBJETIVO: Crear un usuario
REM # AUTOR: Juan Dimas Abrante Hernández
REM # ARGUMENTOS: nombre=%1,apellidos=%2,usuario=%3 
REM # SALIDA:Se mostrará por pantalla los datos correspondientes al usuario
REM #
REM # FECHA:12/02/2023
REM # VERSIONES:1.0.0
REM #
REM #########################

set nombre=%~1
set apellidos=%~2
set usuario=%~3
set id=%RANDOM%
set arguments=3
set count=0

for %%i in (%*) do ( set /a count+=1 )

if "%count%" neq "%arguments%" (
    echo No se han introducido los valores
    exit
 )


echo Bienvenido, %nombre%
echo Tus datos son: %nombre%,%apellidos%
echo Vamos a crear tu usuario: %usuario%
echo Tu nueva ID es %id%