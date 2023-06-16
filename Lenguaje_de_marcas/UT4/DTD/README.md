<div align="center">

# DTD

</div>

<div align="justify">

## ¿Qué es un DTD ?

Un DTD es un documento que define la estructura de un documento XML: los elementos,atributos,entidades,notaciones,etc, que puede aparecer, el orden y el número de veces que pueden aparecer, cuales pueden ser sus hijos de cuáles, etc. El procesador XML utiliza la DTD para verificar si un documento es válido, es decir, si el documento cumple las reglas del DTD. En resumidas cuentas el DTD puede: 

- Especificar la estructura del documento
- Reflejar una restricción de integridad mínima utilizando (ID e IDREF)
- Utilizar unos pequeños mecanismos de abstracción comparables a las macros, que son las entidades
- Incluir documentos externos

## ¿Cuales son los principales inconvenientes de los DTD?

Los principales inconvenientes son los siguientes: 

- Su sintaxis no es XML
- No soportan espacioes de nombres
- No definen tipos para los datos. Solo hay un tipo de elementos terminales, que son los datos textuales
- No permite las secuencias no ordenadas
- No es posible formar claves a partir de varios atributos o elementos
- Una vez se define un DTD no es posible añadir nuevos vocabularios

## ¿Dónde se puede ubicar el DTD?

La DTD que debe utilizar el procesador XML para validar el documento XML se indica en la etiqueta DOCTYPE. La DTD puede estar incluida en el propio documento, ser un documento externo o combinarse ambas. A continuación una serie de ejemplos de cada una: 

- La DTD puede incluirse en el propio documento, con la siguiente sintaxis: 

            <!DOCTYPE nombre [
        ... declaraciones ...
        ]>

- La DTD puede estar en un documento externo y, si sólo va a ser utilizada por una única aplicación, la sintaxis es la siguiente: 

            

        <!DOCTYPE nombre SYSTEM "uri">

- Se puede combinar una DTD externa con una DTD interna, con la siguiente sintaxis: 

            <!DOCTYPE nombre SYSTEM "uri" [
        ... declaraciones ...
        ]>

- La DTD puede estar en un documento externo y, si va a ser utilizada por varias aplicaciones, la sintaxis sera: 

            <!DOCTYPE nombre PUBLIC "fpi" "uri">

- Por último, se puede combinar una DTD externa con una DTD interna con la siguiente sintaxis: 

            <!DOCTYPE nombre PUBLIC "fpi" "uri" [
        ... declaraciones ...
        ]>

En todos estos casos: 

- "nombre" es el nombre del tipo de documento XML, que debe de coincidir con el nombre del elemento raíz del documento XML.
- "uri" es el camino (absoluto o relativo) hasta la DTD
- "fpi" es un identificador público formal (Formal Publid Identifier)

## Declaraciones de tipos de elementos terminales

Los elementos terminales son aquellos que se corresponden con hojas de la estructura de árbol formada por los datos del documento XML asociado al DTD. La declaración de tipos de elementos está formada por la cadea **<!ELEMENT>** separada por, al menos un espacio del nombre del elemento XML que se declara, y seguido de la declaración del contenido que puede tener dicho elemento: 

            <!ELEMENT nom_elemento contenido_elemento>

En el caso específico de los elementos terminales, es decir, aquellos que no contienen más elementos, esta delcaración de contenido es dada por uno de los siguientes valores: 

- EMPTY: El elemento no contiene nada

            <!ELEMENT nom_elemento EMPTY>

- ANY: Permite que el contenido del elemento sea cualquier cosa. 

            <!ELEMENT nom_elemento ANY>

- (#PCDATA): Indica que los datos son analizados en busca de etiquetas, resultando que el elemento no puede contener elementos, es deicr solo puede contener datos de tipo carácter exceptuando los siguientes: <, &, ]], >.

            <!ELEMENT nom_elemento (#PCDATA)>


## Declaraciones de tipos de elementos no terminales

Para definir las ramas de un arbol de elementos, se utilizará la siguiente estructura: 

            <!ELEMENT elemento_padre (elemento_hijo1, elemento_hijo2)>

Para difinir la cardinalidad de los elementos (cuantas veces puede aparecer) se hará de la siguiente forma:

- Operador, ?. Indica que el elemento no es obligatorio:

            <!ELEMENT telefono (trabajo?,casa)>

- Operador uno-o-más, +. Define un componente presente al menos una vez:

        <!ELEMENT provincia (nombre, (cp, ciudad)+ )>

- Operador cero-o-mas, *. Define un componente presente cero, una o varias veces: 

        <!ELEMENT provincia (nombre, (cp, ciudad)* )>

- Operador de elección, |. Cuando se utiliza sustituyendo las comas en la declaración de grupos indica que para formar el documento XML hay que elegir entre los elementos separados por este operador:

        <!ELEMENT provincia (nombre, (cp | ciudad) )>

Un ejemplo completo de lo visto: 

- XML 

        <alumno>
        <nombre>Olga</nombre> 
        <dirección>El Percebe 13</dirección>
        </alumno>

- DTD 


        <!ELEMENT alumno (nombre, apellidos, direccion)>
        <!ELEMENT nombre (#PCDATA)>
        <!ELEMENT dirección (#PCDATA))>


## Declaraciones de listas de atributos para los tipos de elementos

Una vez explicado como se declaran los elementos, toca ver la declaración de sus atributos. Para ello se utilizará la siguiente sintaxis:

        <!ATTLIST nom_elemento nom_atributo tipo_atributo modificador>

Los tipos de atributos que podemos declarar son los siguientes: 

- Enumeración: solo se puede tomar uno de los valores determinados dentro de un paréntesis y separados por "|", son como valores de dominio.

            <!ATTLIST fecha dia_semana (lunes|martes|miércoles|jueves|viernes|sábado|domingo) #REQUIRED>

- CDATA: se utiliza cuando el atributo es una cadena de texto
- ID: declara un atributo identificador, teniento este que ser único en el documento. Además hay que tener en cuenta que los números no son nombre válidos en XML, así como tampoco son los espacios.
- IDREF: permite hacer referencias a identificadores. El valor del atributo ha de corresponder con el de un identificador de un elemento existente en el documento.
- NMTOKEN: permite determinar que el valor de un atributo ha de ser una sola palabra compuesta por los caracteres permitidos por XML

Por otro lado tambíen tenemos los modificadores (como el #REQUIRED visto en el segundo ejemplo). Los modificadores nos permitirán especificar ciertas características del atributo:

- \#IMPLIED: determina que el atributo sobre el que se aplica es opcional
- \#REQUIRED: determina que el atributo tiene carácter obligatorio
- \#FIXED, permite definir un valor fijo para un atributo independientemente de que ese atributo se defina explícitamente en una instancia del elemento en el documento XML.
- Literal: asigna a un atributo el valor dado por una cadena entre comillas.

## Declaraciones de entidades

Las entidades nos permiten declarar valores constantes dentro de un documento XML. Cuando se usan dentro del documento XML se limitan por "&" y ";", por ejemplo &entidad;

Al procesar el documento XML, el intérprete sustituye la entidad por el valor que se ha asociado en el DTD.

No admite recursividad, es decir, una entidad no puede hacer referencia a ella misma.

Para definir una entidad en un DTD se usa el elemento <!ENTITY>. Pudiendo ser esta de cuatro tipos: 

- Internas: Existen cinco entidades predefinidas en el lenguaje, son: 
    - \&lt; : Se corresponde con el signo menor que, <.
    - \&gt; : Se corresponde con el signo mayor que, >.
    - \&quot; : Son las comillas rectas dobles, ".
    - \&apos; : Es el apóstrofe o comilla simple, '.
    - \&amp; : Es el et o amperesand, &.

Para declarar una nueva entidad: 

        <!ENTITY nombre_entidad "valor de la entidad">

Por ejemplo: 


        <!ENTITY dtd "Definiciones de Tipo de Documento">

- Externas: Permiten establecer una relación entre el documento XML y todo documento a través de la URL de éste último. Por ejemplo:

        <!ENTITY nombre_entidad SYSTEM "http://localhost/docsxml/fichero_entidad.xml">

Cuando es necesario incluir ficheros con formatos binarios, se utiliza la palabra reservada NDATA en la definición de la entidad y habrá que asociar a dicha entidad una declaración de notación.

- De parámetro: Permita dar nombres a partes de un DTD y hacer referencia a ellas a lo largo del mismo. Son especialmente útiles cuando vcarios elementos del DTD comparten listas de atributos o especificaciones de contenidos. Se denotan por %entidad;

Ejemplo: 

        <!ENTITY %direccion "calle, numero?, ciudad, cp">
        <!ENTITY alumno (dni, %direccion;)>
        <!ENTITY ies (nombre, %direccion;)>

- De parámetros externas: Permite incluir en un DTD elementos externos, lo que se aplica en dividir la definición DTD en varios documentos.
      

        <!ENTITY persona SYSTEM "persona.dtd">


## Declaraciones de notación

Para incluir ficheros binarios dentro de un documento se utilizarán las notaciones. Se seguirá la siguiente sintaxis: 

        <!NOTATION nombre SYSTEM aplicacion>

Por ejemplo, una notación llamada gif donde se indica que se hace referencia a un editror de formatos gif para visualizar imágenes será: 

        <!NOTATION  gif SYSTEM "gifEditor.exe">

Para asociar una entidad externa no analizada a esta notación basta declarar dicha entidad del siguiente modo: 

        <!ENTITY dibujo SYSTEM "imagenes.gif" NDATA gif>

## Secciones condicionales

Permite incluir o ignorar partes de las declaraciones de un DTD. Para ello se usan dos tokens (Cadenas de caracteres que forman parte del vocabulario de un lenguaje de programación):

- INCLUDE, permite que se vea esa partre de la delcaración del DTD. Su sintaxis es:

        

        <![INCLUDE [Declaraciones visibles] ] >


- IGNORE, permite ocultar esa sección de delcaraciones dentro del DTD. Su sintaxis es: 

            

        <![IGNORE [Declaraciones ocultas] ] >



</div>