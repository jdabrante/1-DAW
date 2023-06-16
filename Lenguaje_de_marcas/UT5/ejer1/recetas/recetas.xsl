<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<link rel="stylesheet" type="text/css" href="recetas.css"/>
</head>
<body>
    <div id="content">
    <div id="header">
    <h2>Transformacion con XSLT</h2>
    <p> XML -&gt; HTML </p>
    </div>
    <div id="section">
    <h2>Mis recetas de cocina canaria</h2>
    <p>Listado de mis recetas de cocina favoritas, características y modo de elaboración, ordenado alfabéticamente</p>
    <xsl:for-each select="recetas/receta">
    <p id="nombre_receta"> Nombre de la receta: <xsl:value-of select="nombre"/></p>
    <p> Tipo de receta: <xsl:value-of select="tipo/@definicion"/></p>
    <p> Dificultad: <xsl:value-of select="dificultad"/></p>
    <p> Tiempo de elaboracion: <xsl:value-of select="tiempo"/></p>
    <p> Esta receta puedes elaborarla en un/a: <xsl:value-of select="elaboracion"/></p>
    <p> Calorias <xsl:value-of select="calorias"/></p>
    
    <table>
    <caption>Listado de ingredientes de <xsl:value-of select="nombre"/></caption>
        <tr>
            <th> Nombre del ingrediente</th>
            <th> Cantidad necesaria </th>
        </tr>
        <xsl:for-each select="ingredientes/ingrediente">
        <tr>
            <td><xsl:value-of select="@nombre"/></td>
            <td><xsl:value-of select="@cantidad"/></td>
        </tr>
        </xsl:for-each>
    </table>
    <p id="pasos"> Pasos necesarios: </p>
    <xsl:for-each select="pasos/paso">
    <p> Paso número <xsl:value-of select="@orden"/>: </p>
    <p id="descripcion_pasos"><xsl:value-of select="."/></p>
    </xsl:for-each>
    </xsl:for-each>
    </div>
    </div>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>