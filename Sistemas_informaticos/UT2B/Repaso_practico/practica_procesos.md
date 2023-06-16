Vamos a ejecutar una aplicación para realizar dibujos. Para ello, primero abre el menú del sistema de la barra de tareas (botón con logo de Linux Mint-LM en la esquina inferior izquierda) y en el buscador escribe "Dibujo". Debería aparecerte un icono azul y en la descripción algo así como "Utilidad de dibujo sencilla", pulse ahí para abrir la aplicación.

Una vez lanzada la aplicación de dibujo, ahora quieres saber su PID. Supón que la aplicación se llama exactamente dibujo, indica cómo obtendrías su PID utilizando el NOMBRE EXACTO de la aplicación 

pidof dibujo

Vaya, pues ejecutando el comando anterior no se obtuvo ningún resultado. Probablemente es que la aplicación no se llamaba dibujo, quizá el nombre estaba en inglés. Prueba ahora a obtener el PID usando el texto draw, aunque no estás seguro/a del nombre, quizá la aplicación se llame de forma parecida, pero NO exactamente así.  

pgrep draw

Ahora sí has obtenido un PID. ¿Cómo se llamaba exactamente esa aplicación? Indica cómo obtendrías un resumen de la información del proceso, incluido el nombre del comando/aplicación, a partir de su PID.

NOTA: RECUERDA QUE AL COPIAR EL COMANDO AQUÍ DEBES USAR EL PID: 1234

ps -p 1234
ps f 1234
ps 1234

Ahora que sabes el PID de la aplicación, ¿cómo harías para TERMINAR la aplicación desde consola, permitiendo que se cierre de forma orden

kill 1234

Probablemente con el apartado anterior la aplicación ya se haya cerrado, pero imagínate que estuviera colgada y no se hubiera cerrado ¿cómo harías para MATAR la aplicación desde consola usando su PID, cerrándola inmediatamente? 

kill -9 1234

Ahora que ya sabes cómo se llama el comando de la aplicación de dibujo que hemos usado en los apartados anteriores, ejecútalo en una terminal (si no sabes el comando, puedes usar otro como xeyes, gnome-calculator, etc.)

Al lanzarlo, verás que se abre la aplicación. Vuelve a la terminal donde ejecutaste el comando, e intenta lanzar otro comando, por ejemplo ls -l. ¿Qué ocurre? Verás que aunque escribas el comando y pulses Enter, el comando NO se va a ejecutar.

Como vimos en clase, esto se debe a que la terminal está bloqueada por el primer comando. ¿Qué comandos o acciones tendrías que realizar para desbloquear la terminal y poder ejecutar nuevos comandos en ESA MISMA TERMINAL, pero de forma que la aplicación de Dibujo (o la que hayas lanzado) siga funcionando con normalidad?

Ctrl + Z; bg

Ahora que has liberado la terminal y puedes lanzar más comandos. Ejecuta un nuevo comando, por ejemplo el editor xed, pero ejecútalo de forma que NO bloquee la terminal, para que puedas seguir lanzando más comandos.

TEN EN CUENTA que en clase hemos visto que para lanzar comandos de forma que no bloqueen la terminal es muy recomendable que estos comandos NO muestren la salida en pantalla, para que no interfieran.De este modo, en lugar de usar la pantalla, debemos guardar las salidas de estos comandos en ficheros. Ejecuta xed de forma que no bloquee la terminal, que la salida normal se guarde en ~/xed.out y que se ignoren los errores.

xed > ~/xed.out 2> /dev/null &

Aunque la terminal no esté bloqueada, se están ejecutando varios comandos (los que has lanzado anteriormente). Muestra todos los comandos que se están ejecutando en esa terminal, indicando también su PID

jobs -l

Imagínate que el primer comando que lanzaste (la aplicación de Dibujo u otra similar) necesitara que le introdujeras algún dato por teclado directamente al comando (no por la interfaz gráfica). Como el comando no está bloqueando la terminal, no puedes interaccionar por teclado con él. ¿Cómo harías para que el comando de la aplicación de dibujo volviera a bloquear la terminal y así puedas interaccionar?

fg %1

Ahora que el comando de la aplicación Dibujo está bloqueando la terminal, imagínate que la aplicación se hubiera quedado "colgada" (no responde) y tú deseas cerrarla DESDE ESA MISMA TERMINAL. No puedes ejecutar ningún comando porque la terminal está bloqueada, pero hay una forma de cancelar (Interrumpir) el comando desde esa misma terminal, prueba a hacerlo e indica cómo lo has hecho.

Ctrl + C

En el apartado anterior finalizaste una de las aplicaciones que se ejecutaban en esa terminal, pero aún te debería quedar otra que se ejecuta sin bloquear. ¿Cómo harías para que esa aplicación se siguiera ejecutando aunque se cerrara la terminal?

Una vez que hayas ejecutado el comando, puedes cerrar la terminal y comprobar si se sigue ejecutando.

disown 1234

Abre una nueva terminal, vamos a ejecutar una aplicación que sabemos que suele solicitar muchos recursos y hacer que nuestro equipo vaya más lento, así que vamos a lanzarla con una prioridad un poco peor a la normal. Imaginemos que esta aplicación es xeyes, ejecútala de forma que su prioridad sea 5 puntos peor que la normal.

nice -5 xeyes

Aunque la aplicación que lanzaste en el apartado anterior fue enviada con menos prioridad, la máquina ha empezado a ir cada vez más lenta. Haz que esta aplicación que sigue en ejecución, empeore su prioridad en otros 5 puntos.

renice 10 1234

Parece que el equipo ya va mejor, indica el comando que usarías para dejar la aplicación anterior con su prioridad inicial.

NO SE PUEDE

Para finalizar, muestra la carga del sistema (utiliza cualquier de los comandos que hemos indicado en clase).

top
uptime

WINDOWS

Lista todos los procesos en MS Windows que consuman más de 1MiB de memoria

tasklist /fi "MEMUSAGE" gt 1024

Lanza un bloc de notas (notepad.exe) con la prioridad más baja posible

start "" /low notepad.exe

Obtén el PID de la aplicación que lanzaste en el apartado anterior

wmic process where name="notepad.exe" get processid

Vuelve a dejar al Bloc de Notas en su prioridad normal

wmic process where name="notepad.exe" CALL setpriority "normal"

Finaliza el Bloc de Notas de forma inmediata

taskkill /f /PID 1234s