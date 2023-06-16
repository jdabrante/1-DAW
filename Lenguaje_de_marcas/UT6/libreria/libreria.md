## 1.	Mostrar los títulos de los libros con la etiqueta "titulo".
```
for $book in /bookstore/book
return <titulo>{$book/title/text()}</titulo>
```
### 2.	Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.
```
for $book in /bookstore/book
where $book/price < 30
return $book

for $book in /bookstore/book[price < 30]
return $book
```
### 3.	Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.
```
for $book in /bookstore/book
where $book/price < 30
return $book/title/text()
```
### 4.	Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.
```
for $book in /bookstore/book
where $book/price <= 30
return $book/title/text()
```
### 5.	Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".
```
for $book in /bookstore/book 
where $book/year = 2005 
return <lib2005>{$book/author/text()}, {$book/title/text()}</lib2005>
```
### 6.	Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".
```
for $book in /bookstore/book/year/text()
return <publicacion>{$book}</publicacion>

let $book := /bookstore/book/year
return <publicacion>{$book}</publicacion>
```
### 7.	Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.
```
for $book in /bookstore/book
order by $book/@cathegory and $book/title
return $book
```
### 8.	Mostrar cuántos libros hay, y etiquetarlo con "total".
```
let $book := /bookstore/book
let $count := count($book)
return <total>{$count}</total>
```
### 9.	Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.
```
let $count := count(/bookstore/book)
let $book := /bookstore/book/title
return <titles>{$book}</titles>|<total>{$count}</total>
```
### 10.	Mostrar el precio mínimo y máximo de los libros.
```
let $max := max(/bookstore/book/price)
let $min := min(/bookstore/book/price)
return <max_price>{$max}</max_price>|<min_price>{$min}</min_price>
```
### 11.	Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.
```
for $book in /bookstore/book 
order by $book/price * 0.04
return <title>{$book/title/text()}</title>|<price>{$book/price/text()}</price>|<iva_price>{$book/price * 0.04}</iva_price>
```
### 12.	Mostrar la suma total de los precios de los libros con la etiqueta "total".
```
let $prices := /bookstore/book/price
let $total := sum($prices)
return <total>{$total}</total>
```
### 13.	Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.
```
let $prices := /bookstore/book/price
let $total := sum($prices)
return <prices>{$prices}</prices>|<total>{$total}</total>
```
### 14.	Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.
```
for $book in /bookstore/book
return <title>{$book/title/text()}</title>|<authors>{count($book/author)}</authors>
```
### 15.	Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.
```
for $book in /bookstore/book
return <book>({$book/title/text()}){count($book/author)}</book>
```
### 16.	Mostrar los libros escritos en años que terminen en "3".
```
for $book in /bookstore/book
where ends-with($book/year,'3')
return $book
```
### 17.	Mostrar los libros cuya categoría empiece por "C".
```
for $book in /bookstore/book
where starts-with($book/@category,'C')
return $book
```
### 18.	Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.
```
for $book in /bookstore/book
where contains($book/title,'X') or  contains($book/title,'x')
return $book
```
### 19.	Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.
```
for $book in /bookstore/book/title/text()
return <title>{$book}</title>|<length>{string-length($book)}</length>
```
### 20.	Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".
```
distinct-values(
  for $book in /bookstore/book/year/text()
return $book
)
```
### 21.	Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.
```
distinct-values (
  for $book in /bookstore/book/author/text()
  order by (string-length($book))
  return $book
)
```
### 22.	Mostrar los títulos en una tabla de HTML.
```
<html>
    <head>
    </head>
    <body>
        <table>
        <tr><th>Title</th></tr>
        {
            for $book in /bookstore/book/title/text()
            return <tr>{
                <td>{$book}</td>
            }</tr>
        }
        </table>
    </body>
</html>
```
 
