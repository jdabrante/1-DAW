Resuelve los siguientes apartados en la máquina virtual de GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

- 1 Muestra todos los usuarios de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus usuarios y cómo se organizan?

cat /etc/passwd

- 2 ¿Por qué hay tantos usuarios? De todos ellos, ¿cuáles realmente pueden abrir una consola de comandos? ¿cuáles podrían inciar una sesión con una contraseña válida? ¿Cómo sabes estos datos? ¿Por qué crees que es así?



- 3 Fíjate en el UID de los usuarios. ¿Ves alguna diferencia entre los usuarios con UID < 1000 y los que tiene un UID >= 1000? ¿Por qué es así?



- 4 Muestra todos los grupos de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus grupos y cómo se organizan?

cat /etc/group

- 5 ¿Por qué hay tantos grupos? Intenta buscar información sobre qué funciones tienen los diferentes grupos de tu sistema, en los apuntes hay un enlace con algo de información.

- 6 ¿Cómo comprobarías si un usuario existe ya en el sistema? ¿Y un grupo?

id
getent group 

- 7 Crea el usuario "test01" de forma que su home sea /home/test01 (se deben copiar la configuración básica de /etc/skel) y su shell sea /bin/bash.

sudo useradd -d /home/test01 test01

- 8 Intenta abrir una sesión como "test01" una vez creado... ¿puedes? ¿Por qué? ¿Cómo lo arreglarías?

No, porque no tiene contraseña
sudo passwd test01
su test01

- 9 El usuario "test01", ¿qué grupo principal tiene? Cámbialo para que sea su grupo principal sea "tests".-

sudo groupadd tests
sudo usermod -g tests test01

- 10 Borra el grupo principal antiguo de test01, ¿puedes eliminarlo? ¿Por qué?

sudo groupdel test01

- 11 Borra el grupo "tests", ¿puedes eliminarlo? ¿Por qué?

No, porque se dentro se encuentra el usuario test01

- 12 Asigna algunos grupos secundarios a "test01". Indica para qué sirve cada uno de los grupos creados

sudo usermod -G cdrom test01

- 13 Asigna algunos grupos más secundarios a "test01", SIN borrar los que ya tenía

sudo usermod -a -G dip test01

- 14 Elimina algunos grupos secundarios del usuario test01

sudo gpasswd -d test01 cdrom

- 15 Bloquea al usuario test01. Luego intenta abrir una sesión... ¿puedes? ¿Por qué?

sudo usermod --lock test01

- 16 Desbloquea al usuario test01. ¿Se ha perdido algo de su información?

sudo usermod --unlock test01

- 17 Cambia la información de test01 indicando su nombre completo, oficina, teléfono, etc.

sudo chfn -f "nombre" -r "numero" -w "telefono" -o "other"

- 18 Cambia la shell de test01 a una que no permita ejecutar comandos.

sudo usermod -s  false test01

- 19 Vuelve a dejarle a test01 su shell original

sudo usermod -s /bin/bash test01

- 20 Añade restricciones al usuario test01 de forma que tenga que cambiar la contraseña cada 15 días y que le avisen 3 días antes, dándole 2 días de margen para poder cambiar una contraseña caducada sin que se bloquee su cuenta. Además, la cuenta quedará deshabilitada el 30 de junio.

sudo chage -M 15 test01
sudo chage -W 3
sudo chage -I 2
sudo chage -E 2023-06-30
sudo usermod --expiredate 2023-06-30

- 21 Elimina el usuario test01 con todo el contenido en su espacio personal. Ten en cuenta que test01 podría seguir conectado.

userdel -rf test01

- 22 ¿Qué pasaría si test01 siguiera conectado en el momento que se elimina su cuenta? ¿Podría seguir usando el equipo con normalidad? ¿Cómo harías para cerrar inmediatamente todos sus procesos que estuvieran aún en ejecución?

sudo pkill -u test01

WINDOWS

¿Por qué MS Windows distingue entre usuarios/grupos locales y globales?

Los globales son los del dominio, minetras que los locales no

Muestra todos los usuarios locales de tu máquina virtual. ¿Cuál es la función de cada usuario?

net users

Muestra información detallada del usuario que estás usando ahora mismo. ¿Qué significa cada línea? ¿A qué grupos perteneces?

net user dahp

Muestra todos los grupos locales de tu máquina virtual. ¿Qué función tiene cada grupo (busca unos cuantos)?

net localgroup

Muestra información detallada del grupo "Usuarios". ¿Quién pertenece a este grupo? Repite la operación para el grupo de "Administradores"`

net localgroup Administradores

Crea un usuario test01 SIN indicar contraseña

net user test01 /add 

Crea un usuario test02 indicando la contraseña en el propio comando

net user test02 123 /add

Crea un usuario test03 y solicita que se indique la contraseña por teclado, sin mostrarla

net user test03 * /add

Prueba a abrir sesión con los usuarios creados. ¿Puedes acceder con todos? Si no puedes acceder con alguno(s), indica cuál es el problema y soluciónalo.
¿A qué grupo(s) local(es) pertenecen los usuarios creados?

Pertenece al grupo usuario. Si no puede entrar es porque no tiene contraseña

Crea un grupo local llamado Informática. Añade los tres usuarios anteriores a ese grupo y muestra la lista de usuarios del grupo para ver que así es.

net localgroup Informatica test01 /add
net localgroup Informatica test02 /add
net localgroup Informatica test03 /add

Haz que test03 sea administrador.

net localgroup Administrador test03 /add

Haz que la cuenta de test01 caduque al final de 2023 y que tenga que cambiar la contraseña la próxima vez que inicie sesión.

net user test01 /EXPIRES:23/03/2024

Desactiva al usuario test02.

net user test02 /del

Haz que el usuario test03 NO pueda cambiar su contraseña, y que esta NO sea obligatoria.

net user test03 /paswordchg:no

Prueba a iniciar de nuevo sesión con cada usuario... ¿qué sucede?



Indica el nombre completo del usuario test01 (invéntate uno) y añade comentarios a su cuenta.

net user test01 /comment:"Loquesea"

Elimina al usuario test03 del grupo local de "Informática".

net localgroup Informatica test03 /del

Muestra la configuración global de las cuentas (longitud mínima de las contraseñas, duración, bloqueos, etc.).

wmic useraccount list full
net accounts

Modifica la configuración global para que todas las contraseñas tengan uan longitud mínima de 6 caracteres, se tengan que cambiar cada mes y no se puedan usar las últimas 3 contraseñas. 

net accounts /minpwlen:6 /maxpwage:30 /uniquepw:3

Elimina el grupo local de "Informática". Muestra todos los grupos locales para asegurate de que está eliminado.

net localgroup Informatica /del

Elimina todos los usuarios creados en estos ejercicios. Muestra todos los usuarios locales para asegurarte de que han sido eliminados.

net user nombre /del