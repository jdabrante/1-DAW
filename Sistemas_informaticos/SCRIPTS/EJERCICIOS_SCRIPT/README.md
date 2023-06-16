19/01/23

powerline --> Marcan el código de error cuando se da un error

dolar almohadilla --> Da el número de argumentos que hemos pasado
$@ --> Da el número de argumentos como array
$? --> Da el error del último comando ejecutado

Para hacer un menú, por ejemplo, tenemos la opción case, que se escribe de la siguiente manera, por ejemplo

            case $opcion in 
                1) 	echo "Ante estaban en $PWD"
                    cd
                    echo "Ahora estoy en $PWD"
                ;;
                2) read -p "Dime el nombre del directorio: " dir
                    mkdir $dir
                ;;
                3) whoami
                ;;
                4) date
                ;;
                5) read -p "Dime el directorio que quieres borrar: " dir
                    rmdir $dir
                ;;
                6) read -p "Dime el nombre del fichero que quieres crear: " fich
                    nano $fich
                ;; 
            esac

En los números, cuando no se introduce una de las opciones se puede utilizar *) para indicar que todo lo demás hará una determinada acción.

20/01/23

Modo POSIX para que sea más compatible.

*El corchete doble acepta casi todos los errores de sintaxis [[]]. No obstante no es muy portable. La más portable es la siempre [].

# Bucles

Para realizar un bucle se seguirá la sinstaxis: 
    for i "Lo que sea"
    do
        acción
    done

Ejemplo: 

            for i in 4 5 6 7 9
        do 
                echo $i
        done

        for i in {20..30}
        do 
                echo $i
        done

*El step admite operadores.

Los rangos no admiten apliación por lo que se usará "seq". En el seq el step va en medio.

Ejemplo: 

                for i in 4 5 6 7 9
        do 
                echo $i
        done

        for i in {20..30}
        do 
                echo $i
        done


Para los bucles while

            i=1
        while [ "$i" -lt 10 ]
        do
                echo "W: $i"
                (( i++ ))
        done


Para for y while se puede utilizar break y continue.

Tambien existe la condición "until". Es como un while negado o un do while.

Siempre habrá que utilizar las "" para que se muestre literalmente el comando que se ha utilizado en el bucle, por ejemplo.

# Select

Nos permite hacer menús de forma más cómoda. Funciona como un bucle, va a estar preguntando por las opciones hasta que salgamos.

Para personalizar el mensaje habría que cambiar el pront del sistema, el cual sería el PS3.

# Array

Los elementos en bash se separan con espacios. Si queremos poner un elemento que tenga un espacio hay que añadir las comillas.

# Borrado de índices

Para borrar es unset.

# Array asociativo (diccionarios)

en vez de usar -a se utiliza -A.

# Funciones en bash

Las variables en bash son globales, para ser locales tenemos que especificarlo con la palabra "local" detrás de cada variable de la función.

Lo más habitual es sólo poner un echo al final de la función, para que solo nos de el valor pedido y poder utilizarlo en otras operaciones dentro del script.