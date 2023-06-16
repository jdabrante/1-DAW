1. Sincroniza tu lista de software local con la de los repositorios oficiales

        sudo apt update
        sudo apt upgrade

2. Lista todo el software que está en los repositorios oficiales, ¿cuántos paquetes hay?

 sudo apt list | wc -l

3. Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?

sudo apt list --installed | wc -l

4. Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?

sudo apt list --upgradeable | wc -l

5. Muestra todos los repositorios que usa tu sistema para gestionar el software... ¿son todos oficiales? ¿hay alguno de empresas externas? ¿y PPA?

cat /etc/apt/sources.list

<!-- # deb cdrom:[Debian GNU/Linux 11.6.0 _Bullseye_ - Official amd64 NETINST 20221217-10:42]/ bullseye main

# deb cdrom:[Debian GNU/Linux 11.6.0 _Bullseye_ - Official amd64 NETINST 20221217-10:42]/ bullseye main

deb http://deb.debian.org/debian/ bullseye main contrib non-free
deb-src http://deb.debian.org/debian/ bullseye main contrib non-free #Added by software-properties

deb http://security.debian.org/debian-security bullseye-security main contrib non-free
deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free #Added by software-properties

# bullseye-updates, to get updates before a point release is made;
# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free #Added by software-properties

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.
deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
# deb-src [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
 -->


6. Lista todos los repositorios que tienes en tu sistema. Al listarlos aparecerán etiquetas como jammy, vanessa, main, universe, multiverse, restricted, security, backports... ¿qué significan?

rep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*

7. Al listar todos los paquetes, verás etiquetas como i386, amd64, beta, rc, etc.). Identifica 7 de estas etiquetas y explica su significado.

apt list

8. En GNU/Linux hay una pequeña aplicación llamada "galletas de la fortuna" (fortune cookies) que muestra un mensaje al iniciar una shell. Búscala e instálala en tu sistema.

apt search xeyes 

sudo apt install xfce4-eyes-plugin

9. Instala varios paquetes que te puedan ser útiles: reproductores multimedia, navegadores, juegos, etc. Antes de instalarlos, muestra información sobre los mismos, qué dependencias tienen, qué versión se va a instalar, etc.

apt show vlc 

apt install vlc

10. De la lista de software a actualizar, elige un paquete y actualiza sólo ese paquete.
11. Actualiza todos los paquetes del sistema.
12. Reinstala algún paquete de los que hayas instalado en estos ejercicios.
13. Elimina algún paquete de los instalados en estos ejercicios, pero dejando su configuración.
14. Elimina totalmente algún paquete de los instalados en estos ejercicios.
15. Instala el navegador Google Chrome, o MS Teams, o Skype... ¿cómo lo has hecho? ¿por qué?
16. Investiga cómo podemos indicar durante la instalación si queremos añadir o no los paquetes recomendados, los sugeridos y/o las mejoras.
17. Busca alguna empresa (de reconocido prestigio) que tenga su software en repositorios y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.
18. Busca algún usuario (de reconocido prestigio) que tenga software en repositorios personales y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.
19. Elimina el software instalado a través de repositorios externos en los ejercicios anteriores, y elimina también esos repositorios externos.
20. Elimina todos los paquetes del sistema que se instalaron como dependencias y ya no son necesarios.
