<div align="center">

# XML

</div>

<div align="justify">

## ¿Qué es XML?

XML, o lenguaje de Etiquetas Extendido, es un lenguauje de etiquetas, que estructura y guarda la información de forma ordenada.

El proceso de creación de un documento XML para por diversas etapas: 
- Especificación de requisitos
- Diseño de etiquetas
- Marcado de los documentos

Para trabajar en XML es necesario editar los documentos y luego procesarlos, existen pues dos tipos de herramientas: 

- Editores XML: Para la creación de documentos XML complejos e ir añadiendo datos se puede utilizar un editor XML. Los editores ayudan a crear estructuras y etiquetas de los elementos en los documentos. Además algunos incluyen ayuda para la creación de otroso elementos como DTD. W3C ha desarrollado un editor, <a href=https://www.w3.org/Amaya/>Amaya</a>

- Procesadores XML: Para interpretar código XML se puede utilizar cualquierº navegador. Un procesador es un conjunto de módulos de software entre los que se encuentra un parser o analizador de XML que comprueba que el documento cumpla con las normas establecidas para que pueda abrirse. Estas normas pueden corresponderse con las necesarias para trabajar sólo con documentos de tipo válido o sólo exigir que el documento esté bien formado. El modo en que los procesadores deber leer los datos XML está descrito en la recomendación de XML establecida por <a href=https://www.w3schools.com/xml/xml_syntax.asp >W3C</a>

## Los elementos: prólogo y ejemplar

Los documentos XML pueden estar constituidos por una parte opcional denominada prólogo y otra obligatoria denominada ejemplar. 

- Prólogo: Da la información necesaria al intérprete encargado de procesar el documento de todos aquellos datos que necesita para realizar su trabajo. Así pues el prólogo consta de: 

    - Definición de XML: Donde se indica la versión de XML que se está utilizando, la codificación empleada para representar los caracteres y la autonomía del documento.<br>
    Por ejemplo: 

            <?xml version="1.0" encoding="UTF-8"?>
    -  Declaración del tipo de documento: Define qué tipo de documento estamos creando para sder procesado correctamente.<br>
    Toda declaración de tipo de documento comienza de la siguiente manera: 

            <!DOCTYPE Nombre_ejemplar ...>

- Ejemplar: Es la parte más importante de un documento XML, ya que en esta se encuentran los datos reales del documento. Está formada por elementos anidados. Los elementos son distintos bloques de información que permiten definir la estructura del documento XML. Están delimitados por una etiqueta de apertura y otra de cierre. A su vez los elementos pueden estar formados por otros elementos y/o por atributos.

_El elemento raíz es el ejemplar de un documento XML. Todos los demás elementos están contenido en el mismo_

## Documentos XML bien formados

Los documentos XML tienen una serie de normas que han de cumplir para que no se produzca ningún error. Estas reglas son: 

- Sólo debe existir un elemento raíz, pero siempre debe existir uno
- Todos los elementos tienen etiqueta de apertura y de cierre. En el caso de que sea un elemento vació puede sustituirse por &lt;element/&gt;
- Hay que cerrar siempre los elementos por orden de apertura
- Los nombre de los elementos deben ser iguales en su etiqueta de apertura y cierre, no puede contener espacios, no puede comenzar por ":" ni por la cadena "xml" en todas sus variantes.
- El contenido de los elementos no puede contener la cadena "]]>" por compatibilidad con SGML. Además no se puede utilizar directamente los caracteres >, <, &, ", '. Para ello tiene que usarse la siguiente sintaxis: 
    - &gt; por &gt
    - &lt; por &lt
    - & por &amp
    - " por &quot
    - ' por &apos

_Todos estos deben llevar ; al final_

- Para caracteres especiales se utilizará &#D; o &#H. Las letras se cambian por el codigo bien hexadecimal o decimal.
- Los nombres de las etiquetas tienen que ser autodescriptivos
- Los aitributos tienen que ir entre comillas
- Se pueden utilizar comentarios con "<--! -->". Estos pueden ir en todos lados menos antes del prólogo o dentro de una etiqueta

## Definición de la sintaxis de documentos XML

Hemos visto que en los elementos el orden es importante. No obstante en el caso de los atributos esto no es significativo, pero si el hecho de que no pueden haber dos con el mismo nombre.
Para saber si un dato del documento se presentará como un elemento o como un atributo, se pueden seguir los siguientes criterios: 
- El dato será un elemento si cumple con: 
    - Contiene subestructuras
    - Es de un tramaño considerable
    - Su valor cambia frecuentemente
    - Su valor va a ser mostrado a un usuario o aplicación

- El dato será un atributo si cumple con: 
    - Es un dato pequeño y su valor raramente cambia
    - El dato solo pouede tener unos cuantos valores fijos
    - El dato guía el procesamiento XML pero no se va a mostrar

_Sección CDATA: &lt;![CDATA[contenido del bloque]]&gt;_

</div>
