sp aux --> Mirar todos los procesos
ps u -u root --> Procesos del root
carnet de un programa --> pidof
 dimas  Debian  ~  $  pidof xeyes
3981
 dimas  Debian  ~  $  ps u -p 3981
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
dimas       3981  0.1  0.1  13536  4456 pts/2    S+   15:40   0:00 xeyes

Tiene que esta el proceso activo.
El PID no se reutiliza.
TIME se refiere al tiempo que se ha consumido de CPU
**Watch permite ver los datos actualizados de un proceso

En la practica para donde veamos firefox usar xeyes

Detenido o stopped --> Ctrl+Z
Segundo plano o background --> Los programas en segundo plano no tienen acceso a ningun input
fg pasar a primer plano
bg pasar a segundo plano 

Para mandar directamente a segundo plano un proceso hay terminarlo con "&"
jobs --> Muestro lo que tenemos en segundo plano

Para elegir que proceso quiero llevar a primer plano fg %"Numero que aparece en el jobs"

Si tenemos algo en segudno plano que va a estar sacando datos es preferible redirigir los datos a un txt. El & tiene que ir siempre al final del comando.
Para matar un proceso usar kill. Se puede utilizar con el PID o con el número que aparece en el jobs.
pkill se le puede pasar un usuario, pedazo de nombre...
killall mata a todo lo que tenga el nombre que le estemos pasando
xkill 
sleep

SIGKILL no puede ser atrapada.pst
kill por defecto no se puede ejecutar sobre procesos detenidos

pstree veo las ramas de dependencia

Estados de los procesos:
Estado --> R se está ejecutando
Estado --> S está en un sueño interrumpible
Estado --> T está detenido
Estadp --> I estado ide
Estado --> D está en un sueño ininterrumpible
Estado --> t se está debuggeando
Estado --> W paginación (ya no se ve)
Estado --> X proceso en estado muerto
Estado --> Z estado zombi, jodido.

echo $! --> Devuelve el último que se mandó a background.

#########################################################

Funciona antes de lanzar el comando
nohup --> Sirve para que aún matando al padre de un proceso siga ejecutandose el proceso. El padre pasa a ser el proceso 1.

Funciona si ya lanzaste el comando
disown --> Disocia
disown -a --> Disocia todos
disown -r --> Disocia los que se estan ejecutando
disown -h --> Disocia pero no lo quita de la shell

** Siempre hay que hacer una redirección en los comandos

** Prioridad va desde 100 hasta 140, pero realemte se represta con 0 a 40. No llega a 40, llega a 39
El "nice" da menos prioridad al proceso que se desee.
El "renice" Sirve para cambiar la prioridad

SOLO ROOT PUEDE MEJORAR SU PRIORIDAD. COMO USUARIO SOLO SE PUEDE EMPEORAR.

PARA AUMENTAR LA PRIORIDAD SE BAJA EL NUMERO

