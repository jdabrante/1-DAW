Antes de instalar el paquete, te han comentado que es recomendable sincronizar la lista local de software con la de los servidores externos. ¿Cómo realizas esta sincronización?

sudo apt update

Ahora indica qué comando usarías para buscar el paquete del editor de texto sublime (ten en cuenta que el nombre del paquete no siempre coincide exactamente con el nombre con el que conocemos la aplicación).

apt search sublime-text

Antes de instalar sublime, te interesa saber qué versión se va a instalar, ¿qué comando usarías?

apt show sublime-text

Instala ahora el editor de texto sublime en tu equipo

sudo apt install sublime-text

Ahora muestra un listado de todo el software que tienes instalado en el sistema

apt list --installed

Ahora muestra un listado con todo el software de tu sistema que puede ser actualizado

apt list --upgradeable

Actualiza el paquete zfs-initramfs (SÓLO ese paquete)

sudo apt list install zfs-initramfs

Reinstala el paquete zenity

sudo apt reinstall zenity

limina el cliente de correo thunderbird, pero deja su configuración por si en el futuro quisieras volver a instalarlo.

sudo apt remove thunderbird

Elimina totalmente el paquete mplayer

sudo apt purge mplayer

Parece que el disco está bastante lleno, y tienes sospechas que de tanto instalar y desinstalar software, se hayan podido quedar paquetes que ya no son necesarios. Elimina los paquetes sobrantes (paquetes que se han instalado para satisfacer alguna dependencia, pero ya no están en uso)

sudo apt autoremove

