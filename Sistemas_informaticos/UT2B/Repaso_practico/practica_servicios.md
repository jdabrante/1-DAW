Imagínate que trabajas en una empresa como administrador de sistemas informáticos. Ha venido un usuario diciéndote que tiene problemas con una aplicación, que le ocupa muchos recursos y que el equipo le va muy lento.

Mirando en algunas webs, este usuario ha aprendido cómo ver los procesos del sistema, y está convencido que el problema de todo lo tiene el proceso "cupsd". De hecho, ha hablado con otros administradores para que finalicen este proceso, pero resulta que a pesar de que han intentado matarlo, el proceso siempre está presente.

Con esa información y con ese nombre, tú ya empiezas a sospechar que ese proceso es algo "especial" y se trate de un servicio o demonio, concretamente el asociado al sistema de impresión cups ¿Con qué comando podrías asegurarte de si realmente es un servicio y, de paso, comprobar su estado? 

systemctl status cups

Efectivamente, tus sospechas se han confirmado y se trata de un servicio que está activo. El usuario te insiste en que quiere detener el proceso, y tú le informas de que puede ser peligroso y hacer que el sistema sea inestable. Sin embargo, investigas y ves que este servicio no es crítico para el sistema, por lo que no parece haber problema en detenerlo. Avisas al usuario de las posibles implicaciones, y procedes a detener el servicio, ¿cómo lo harías?

sudo systemctl stop cups

Tras detener el servicio, pensabas que el usuario no iba a crear más incidencias, pero resulta que al poco tiempo vuelve porque su equipo tiene un "comportamiento" extraño y quiere que vuelvas a activar cups. Tú no crees que eso esté relacionado, pero para probar, decides volver a activarlo, ¿cómo lo harías?

sudo systemctl start cups

Como te temías, el usuario en cuestión vuelve al rato, diciendo que no puede trabajar por culpa de cups, que vuelve a estar consumiendo muchos recursos. En ese momento decides comprobar la configuración del servicio, a ver si hay algún parámetro extraño. ¿Cómo mostrarías la configuración de cups?

systemctl show cups

Al ver la configuración, detectas algunos parámetros que pueden ser algo elevados y estar afectando al consumo de recursos, y decides disminuir los valores a ver si así se resuelve el problema. ¿En qué directorio crees que podría estar la configuración del servicio cups?

/etc

A pesar de haber cambiado la configuración, por alguna razón los nuevos valores parece que no están funcionando y sigue ejecutando la antigua configuración, ¿qué puede estar pasando?

Se necesita reiniciar

¿Cómo harías para asegurarte de que el servicio lee la nueva configuración y permanece en el estado activo/inactivo en el que estaba previamente, de forma que evite interrumpir el servicio si es posible?

sudo systemctl try-reload-or-restart cups

Después de tu esfuerzo, aún así el usuario vuelve después de un rato diciendo que su equipo vuelve a tener problemas, y que quiere que pares el servicio y que no se vuelva a ejecutar al reiniciar la máquina. ¿Cómo harías esto usando UN ÚNICO COMANDO?

sudo systemctl disable --now cups

Te habías olvidado ya de este usuario, pero al día siguiente vuelve a contactar contigo diciendo que a pesar de todo lo que le habías dicho y hecho, algo no es correcto porque el servicio vuelve a estar activo. ¿Cómo es esto posible? Antes que nada, primero comprueba si realmente el servicio está activo (utiliza el comando que únicamente te dice si está activo o inactivo).

systemctl is-active cups

Pues parece que el usuario tiene razón y el servicio está activo. Comprueba ahora si el servicio se carga o no al arrancar la máquina (utiliza el comando que sólo te muestra esta información, NO el estado completo del servicio).

systemctl is-enabled cups

Pues resulta que el servicio está configurado para que NO se cargue en el arranque, aún así está activo... El usuario jura y perjura que había reiniciado su máquina hacía ya rato, ¿qué puede haber pasado?

Lo está lanzando otro servicio

Para evitar que esto suceda otra vez, indica el comando que usarías para asegurar que el servicio NO pueda arrancarse de ninguna forma.

sudo systemctl mask cups

Comprueba ahora que cups NO puede iniciarse (utiliza el comando que sólo te muestra esta información, NO el estado completo del servicio).

systemctl is-enabled cups

Pues pasado un tiempo, cuando ya ni te acordabas de este usuario, resulta que vuelve a contactar contigo diciendo que al final ya sabía que era lo que estaba pasando, y muy contento te dice que él solo resolvió el problema y que la máquina le iba lenta casualmente cuando para distraerse intentaba abrir con el reproductor multimedia un fichero de 300GiB de música relajante de dominio público que alguien le había dado... (sin comentarios).

Ahora que él solito ha descubierto el problema y su solución (no intentar abrir más ese archivo), quiere que dejes el servicio cups tal y como estaba al principio. Para ello, el primer paso es quitar el bloqueo para que el servicio pueda activarse.

sudo systemctl unmask cups

Una vez eliminado el bloqueo, hay que configurar el servicio para que se inicie al arrancar el sistema y también activar el servicio ¿Cómo harías esto usando UN ÚNICO COMANDO?

sudo systemctl enable --now cups

Ya para terminar, el usuario te pide que reinicies la máquina, para quedarse seguro de que el servicio funciona correctamente. Tú le indicas que no es necesario reiniciar, que se puede comprobar ahora, pero él te responde que no se queda tranquilo, que prefieres que reinicies y que, por si no lo sabías, el comando para reiniciar el equipo es reboot.

Tú le indicas que no es el único comando, que hay otros que permiten reiniciar la máquina, pero parece que el usuario no te cree del todo. Muéstrale cómo podrías reiniciar la máquina usando los niveles de ejecución.

sudo systemctl isolate runlevel6.target

WINDOWS

Lista los servicios del sistema

sc query

Lista SOLO los servicios INACTIVOS

sc query state=inactive

Muestra información sobre el servicio XblAuthManager

sc query XblAuthManager

Haz que el servicio XblAuthManager esté en ejecución (no importa si ya lo estaba)

sc start XblAuthManager

Intenta pausar el servicio XblAuthManager (no importa si obtienes un error)

sc pause XblAuthManager

Si el servicio XblAuthManager estuviera pausado, ¿cómo harías para que continuara ejecutándose?

sc continue XblAuthManager

Muestra la configuración de XblAuthManager

sc qc XblAuthManager

Haz que el servicio XblAuthManager se inicie de forma automática (al arrancar el sistema)

sc config XblAuthManager start=auto

Detén el servicio XblAuthManager

sc stop XblAuthManager