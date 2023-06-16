<ol>

<li>¿Cuál es el propósito principal de XML?</li>

El propósito principal de XML es estructurar y almacenar datos de manera legible para las personas y las máquinas.

<li>¿Qué es un elemento en XML?
</li>

Un elemento en XML es una etiqueta que define un objeto o entidad en el documento.

<li>¿Cuál es la diferencia entre un DTD y un esquema XSD?</li>

Un esquema XSD es más poderoso y flexible que un DTD.


<li>¿Qué es una entidad en una DTD?</li>

Una etiqueta de define un objeto o entidad en el documento.

<li>¿Cómo se valida un documento XML con una DTD?</li>

Utilizando un programa de validación que compare el documento con la DTD.

<li>¿Qué significa XSD?</li>

Esquema de Definicion de XML

<li>¿Cómo se define un esquema XSD en un documento XML?</li>

Mediante una declaración de esquema

<li>¿Cuáles son los tipos de datos que se pueden definir en un esquema XSD?</li>

Tipos de datos primitivos y tipos de datos personalizados

<li>¿Qué es una restricción en un esquema XSD?</li>

 Una regla que limita el contenido permitido en un elemento o atributo


<li>Cree un documento XML que almacene información sobre libros, incluyendo título, autor,
año de publicación y editorial. Utilice una DTD para definir la estructura del documento y
asegurarse de que los elementos y atributos estén correctamente definidos. Luego, cree un
esquema XSD que describa la estructura del documento XML y valide que se cumplan las
restricciones definidas en el esquema. Asegúrese de que el documento XML esté bien formado
y sea válido según la DTD y el esquema XSD</li>

<?xml version="1.0"?>
<!DOCTYPE libros [
<!ELEMNT libros (libro+)>
<!ELEMENT libro(autor+,año,editorial)>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT año (#PCDATA)>
<!ELEMENT editorial (#PCADATA)>
]>

<libros>
    <libro>
        <autor></autor>
        <año></año>
        <editorial></editorial>
    </libro>
<libros>

<?xml version="1.0">
<xs:schema >
    <xs:complexType>
        <xs:sequence>
            <xs:element name="libro">
                <xs:complexType>
                    <xs:sequence>
                        <xs:element name="autor"/>
                        <xs:element name="año"/>
                        <xs:element name="editorial"/>
                    </xs:sequence>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>
</xs:element>

<libros>
    <libro>
        <autor></autor>
        <año></año>
        <editorial></editorial>
    </libro>
<libros>


</ol>


