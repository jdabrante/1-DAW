<div align="justify">

- 1 Sobre el comando que se utiliza para modificar los permisos, indica lo siguiente

    ¿Qué comando es?

    chmod

    ¿Qué opción debo usar para que me vaya mostrando todos los ficheros y directorios afectados?

    chmod -v

    ¿Qué opción debo usar para que me vaya mostrando sólo los ficheros y directorios que han cambiado el permiso?

    chmod -c
 
- 2 El comando para cambiar los permisos tiene una opción para no sólo cambiar los permisos de un directorio, sino también de TODOS su contenido, incluyendo subdirectorios.

    ¿Qué opción permite eso?

    chmod -r

    ¿Por qué puede ser MUY peligroso asignar el mismo permiso a todo el contenido de un directorio?

    Porque los ficheros que están dentro dependen de los permisos que tenga el direcotiro en si mismo. Además si se quiere distinguir entre ficheros diferentes permisos, no se podría

    Investiga cómo se podría evitar este problema que has comentado en el apartado anterior

   Creando grupos

- 3 Indica cómo se ven los permisos de ficheros y directorios en GNU/Linux y qué significa cada uno de ellos. ¿Cómo veo quién es el propietario del fichero y a qué grupo pertenecen?

    ls -lh es una de las maneras de visualizar los permisos de un directorio o fichero. Además también se muestra el autor al igual que con ls -l

- 4 Sobre los permisos:

    ¿Cuáles son los permisos más comunes para ficheros y directorios y qué implican?

    Los más comunes son los permisos de escritura y lectura. Estos implican basicamente que se pueda modificar o no el direcotrio al igual que el fichero

    Cuando creas un fichero cualquiera en tu equipo, ¿qué permisos se establecen por defecto y qué permiten y qué no?

    Solo se disponen los permisos de escritura y lecutra para los usuarios y grupos, mientras que para "otros" solo existe la opción de lecutra.

    Y si en vez de crear un fichero creas un directorio, ¿cuáles son los permisos por defecto?

    Vienen todos activos a excepción de la escritura en el caso de los "otros"

    Investiga cómo se podrían cambiar estos permisos por defecto

    Se utiliza el comando umask seguido de un valor, normalmente de 4 dígitos que se resta a los valores "máximos" de los directorios (777) y ficheros (666). El número resultante serán los permisos en base octal.

- 5 Crea 10 archivos en tu equipo, desde fich01 a fich10. Elige los permisos más adecuados para los siguientes casos e indica el comando y opciones para asignarle los permisos:

    fich01: Es un documento confidencial en el que estás trabajando tú con tu equipo
    fich02: Son unas instrucciones que deberían poder ser consultadas por todos, pero sólo tú puedes modificarlas
    fich03: Es un documento muy confidencial, sólo tú deberías tener acceso
    fich04: Es un documento compartido que todos deberían poder leer y modificar
    fich05: Es un documento que estás modificando y que, además de ti, sólo podrá ser consultado por tu grupo, sin que pueda modificarlo
    fich06: A este documento falta por añadirle el permiso para que otros puedan leerlo y escribirlo
    fich07: Este documento podía ser modificado por tu grupo y otras personas, pero ahora has decidido que sólo tú puedas modificarlo
    fich08: Es un script  que cualquiera puede ejecutar, pero sólo tú puedes modificar
    fich09: Es un script que tanto tú como tu equipo pueden modificar y ejecutar
    fich10: Es un documento que quieres proteger para que sólo tú puedas leerlo, pero no modificarlo


- 6 Crea 5 directorios en tu equipo, desde dir1 a dir5. Elige los permisos más adecuados para los siguientes casos e indica el comando y opciones para asignarle los permisos:

    dir1: Tú y solo tú tienes el control total de este directorio, mientras que el resto no puede hacer nada
    dir2: Tú tienes el control total, pero tu grupo puede acceder y ver el contenido
    dir3: Tú y tu equipo pueden ver el contenido del directorio y acceder a él, pero no modificarlo. Los demás sólo acceder sin ver el contenido ni modificarlo
    dir4: Todos tienen el acceso total
    dir5: Tú tienes control total, tu grupo puede acceder y modificar sin ver contenido, los demás sólo ver contenido

 
- 7 Indica de qué tipo se trata (fichero, directorio, ...) y qué se puede hacer y que no con los siguientes permisos:

    drwxr-xr-x
    -rwxr-xr-x
    lrwxrwxrwx
    drwxr-x---
    -rw-r—r--
    -rw-rw----
    Fichero con permisos 644
    Directorio con permisos 755
    Fichero con permisos 600
    Directorio con permisos 740


- 8 En mi servidor web estoy teniendo un problema y sospecho que es por permisos, ¿es buena idea asignar el permiso 777 a los directorios para ver si así se soluciona el problema? Razona la respuesta

</div>