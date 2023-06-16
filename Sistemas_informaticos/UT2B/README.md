## Servicios

systemctl + acción + servicio
acción = status, start, stop

Para ver todos los servicios: systemctl lists-units
Si quiero especificar

Para cambiar la configuración mientras se está utilizando
sudo systemclt reload +servicio
Reload no es muy común, también existe restart que es como un stop y un start junto.
Para saber si un servicio está activo --> systemctl is-active +servicio
try-restart deja el servicio como estaba

Servicios quew se cargan en el arranque se les denomina Enabled, los que no son disabled. No condufir activo con enabled y inactivo con disabled.
Enmarcarar un servicio hace que el servicio no se pueda activar en ningún caso. Se enmascara el trigger
