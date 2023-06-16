@echo off

REM Se realiza el tasklist y wmic (para la capacidad total de la memoria)

wmic MemoryChip get Capacity | more +1 > memo.txt
tasklist | more +3 > procesos.txt

REM Se ejecuta el fichero .py

py procesos.py > procesos.html

REM Se lanza el fichero html 

procesos.html

