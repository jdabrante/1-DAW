
    Sincroniza tu lista de software local con la de los repositorios oficiales

    sudo apt update

    Lista todo el software que está en los repositorios oficiales, ¿cuántos paquetes hay?

    apt list

    Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?

    apt list --installed

    Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?

    apt list --upgradeable

    Muestra todos los repositorios que usa tu sistema para gestionar el software... ¿son todos oficiales? ¿hay alguno de empresas externas? ¿y PPA?

    sudo cat /etc/apt/sources.list

    Lista todos los repositorios que tienes en tu sistema. Al listarlos aparecerán etiquetas como jammy, vanessa, main, universe, multiverse, restricted, security, backports... ¿qué significan?

    El tipo de repositorio que es.

    Al listar todos los paquetes, verás etiquetas como i386, amd64, beta, rc, etc.. Identifica 7 de estas etiquetas y explica su significado.
    En GNU/Linux hay una pequeña aplicación llamada "galletas de la fortuna" (fortune cookies) que muestra un mensaje al iniciar una shell. Búscala e instálala en tu sistema.

    sudo apt install fortunes

    Instala varios paquetes que te puedan ser útiles: reproductores multimedia, navegadores, juegos, etc. Antes de instalarlos, muestra información sobre los mismos, qué dependencias tienen, qué versión se va a instalar, etc.

    apt show fortunes

    De la lista de software a actualizar, elige un paquete y actualiza sólo ese paquete.

    sudo apt install <paquete>

    Actualiza todos los paquetes del sistema.

    sudo apt upgrade

    Reinstala algún paquete de los que hayas instalado en estos ejercicios.

    sudo apt reinstall

    Elimina algún paquete de los instalados en estos ejercicios, pero dejando su configuración.

    sudo apt remove

    Elimina totalmente algún paquete de los instalados en estos ejercicios.

    sudo apt purge

    Instala el navegador Google Chrome, o MS Teams, o Skype... ¿cómo lo has hecho? ¿por qué?
    Investiga cómo podemos indicar durante la instalación si queremos añadir o no los paquetes recomendados, los sugeridos y/o las mejoras.
    Busca alguna empresa (de reconocido prestigio) que tenga su software en repositorios y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.
    Busca algún usuario (de reconocido prestigio) que tenga software en repositorios personales y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.

    Hay que añadirlo al /etc/apt/sources.list con el comando apt sources

    Elimina el software instalado a través de repositorios externos en los ejercicios anteriores, y elimina también esos repositorios externos.
    Elimina todos los paquetes del sistema que se instalaron como dependencias y ya no son necesarios.


FHS en GNU/Linux

    ¿Qué hace el siguiente comando?: ls -l /

    Lista el contenido mostrando información del directorio del raíz

    Después de ejecutar el comando anterior, explica para qué se utiliza cada directorio de los que aparecen en la salida

    

    ¿Por qué tenemos tres directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: /bin, /usr/bin y /usr/local/bin
    ¿Por qué tenemos varios directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: /lib, /lib32, etc.
    Al instalar un software, gran parte de él va a uno de los siguientes directorios, ¿para qué se usa cada uno? /usr, /usr/local y /opt


Comandos Gestión de Software Windows

    Sincroniza tu lista de software local con la de los repositorios oficiales

    winget source update

    Lista todo el software que está en los repositorios, ¿cuántos paquetes hay?

    winget source list 

    Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?

    wingert list

    Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?

    winget upgrade

    Lista todos los repositorios que tienes en tu sistema.

    winget source list

    Instala varios paquetes que te puedan ser útiles: reproductores multimedia, navegadores, juegos, etc. Antes de instalarlos, muestra información sobre los mismos, qué dependencias tienen, qué versión se va a instalar, etc.
    De la lista de software a actualizar, elige un paquete y actualiza sólo ese paquete.
    Actualiza todos los paquetes.
    Elimina alguno de los paquetes que instalaste en apartados previos.


