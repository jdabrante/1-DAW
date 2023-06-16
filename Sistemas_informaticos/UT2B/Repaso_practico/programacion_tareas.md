- 1 Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am

at 02:00 monday <<< "uptime > ~/cargaNextMonday.txt 2> carga.err"

- 2 Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am

0 2 * * 1 uptime >> ~/cargaAllMondays.txt

- 3 Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida

30 * * * * uptime >> ~/carga30min.txt

- 4 Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes

0 3 */10 * find / -type f -atime +30 -exec rm {} \;

- 5 Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME.


        Ejecutar el script "~/myscript.sh" en 12 horas a partir de ahora.

        at now +12hour <<< "~/myscript.sh >> ~/datos_fecha.txt"

        Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive)

        0 8-12 * 2-4 6,0 ~/myscript.sh >> ~datos_fecha.txt 

        Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.

        at now + 1 week -f ~/mysecript.sh >> ~/datos_fecha.txt

        Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.

        0 */4 1-10 * * ~/myscript.sh >> ~/datos_fecha

        Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5

        batch 
        -f ~/mycript.sh >> ~/datos_fecha

        Mostrar que las ejecuciones están programadas y esperando para ejecutarse

        atq
        crontab -l

        Eliminar/comentar todas las ejecuciones programadas

        atrm


WINDOWS

    Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):

    El próximo lunes a las 12:50

        schtasks /create /tn test /sc ONCE /d MON /st 12:50 /tr ...

    Todos los días a las 16:30

        schtasks /create /tn test /sc DAILY /ST 16:30

    Todas las semanas a las 23:00

        schtask /create /tn test /sc WEEKLY /st 23:00
        
    Todos los meses a las 11:00

        
    Cuando el sistema tenga baja carga

        schtask /create /tn test /sc ONIDLE

    Los lunes, miércoles y viernes a las 20:00


        schtask /create /tn test /sc weekly /d MON,WED,FRI /st 20:00

    Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos

    schtasks /create /tn "Nombre de la tarea" /tr "Ruta completa del archivo que se ejecutará" /sc once /st 12:00 /sd tomorrow /ri 10 /du 00:50:00 