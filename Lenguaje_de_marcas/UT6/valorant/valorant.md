### 1.	Muestra el título del videojuego.
```
for $juego in /videojuego/titulo/text()
return $juego
```
### 2.	Muestra la plataforma del videojuego.
```
for $juego in /videojuego/plataforma/text()
return $juego
```
### 3.	Muestra el nombre de todos los agentes.
```
for $juego in /videojuego/agentes/agente/nombre/text()
return $juego
```
### 4.	Muestra el nombre y la habilidad ultimate de todos los agentes.
```
for $juego in /videojuego/agentes/agente/habilidadUltimate/text()
return $juego
```
### 5.	Muestra los nombres de los agentes cuya habilidad primaria es "Incendiario".<- No da nada
```
for $juego in /videojuego/agentes/agente
where $juego/habilidadPrimaria = "Incendiario"
return $juego/nombre/text()
```
### 6.	Muestra los nombres de los agentes cuya habilidad ultimate es "Fénix". <- No da nada
```
for $juego in /videojuego/agentes/agente
where $juego/habilidadUltimate = "Fenix"
return $juego/nombre/text()
```
### 7.	Muestra las habilidades primarias de los agentes cuyo nombre empieza por "J".<-No da nada
```
for $juego in /videojuego/agentes/agente
where starts-with( $juego/nombre,'J')
return $juego/habilidadPrimaria
```
### 8.	Muestra los nombres de los agentes cuyas habilidades primarias empiezan por "Bola".
```
for $juego in /videojuego/agentes/agente
where contains($juego/habilidadPrimaria,'Bola')
return $juego/nombre/text()
```
### 9. Muestra los nombres de todos los agentes en orden alfabético.
```
for $juego in /videojuego/agentes/agente
order by $juego/nombre
return $juego/nombre/text()
```
### 10. Muestra las habilidades primarias y secundarias de los agentes cuyo nombre contiene la letra "y".
```
for $juego in /videojuego/agentes/agente
where contains($juego/nombre,'y')
return $juego/habilidadPrimaria/text()|$juego/habilidadSecundaria/text()
```
### 11. Muestra los nombres de los agentes cuya habilidad ultimate contiene la palabra "cuchillos".
```
for $juego in /videojuego/agentes/agente
where contains($juego/habilidadUltimate, "Cuchillos")
return $juego/nombre/text()
```
### 12. Muestra las habilidades primarias de los agentes cuyo nombre contiene la letra "o" y la habilidad secundaria contiene la palabra "humo".
```
for $juego in /videojuego/agentes/agente
where contains($juego/nombre, "o") and contains($juego/habilidadSecundaria, "humo")
return $juego/habilidadPrimaria/text()
```
### 13. Muestra los nombres de los agentes que tienen exactamente tres habilidades.
```
for $juego in //agente where count($juego/*[contains(local-bane()'habilidad')]) = 3
return $juego/nombre
```
### 14. Muestra los nombres de los agentes cuya habilidad secundaria no es "Granada Cegadora".
```
for $juego in /videojuego/agentes/agente
where not(contains($juego/habilidadSecundaria,"Granada Cegadora"))
return $juego/nombre/text()
```
### 15. Muestra las habilidades primarias de los agentes cuyos nombres no contienen la letra "e".
```
for $juego in /videojuego/agentes/agente
where not(contains($juego/nombre,"E"))
return $juego/nombre/text()
```
### 16. Muestra los nombres de los agentes cuyas habilidades primarias contienen la palabra "muro" o la palabra "barrera". <-No da nada
```
for $juego in /videojuego/agentes/agente
where contains($juego/habilidadPrimaria,"muro") or contains($juego/habilidadPrimaria,"barrera")
return $juego/nombre/text()
```
### 17. Muestra las habilidades ultimates de los agentes en orden alfabético inverso.
```
for $juego in //habilidadUltimate/text()
order by $juego descending
return $juego
```
### 18. Muestra los nombres de los agentes cuya habilidad ultimate tiene una duración mayor a 8 segundos.
```
for $juego in //agente
where $juego/habilidadUltimate/@duracion < 8
return $juego/nombre/text()
```
### 19. Muestra el nombre del agente con la habilidad ultimate más corta.
```
let $ultimate := (//agente/habilidadUltimate/@duracion)
let $minu := min($ultimate)
for $juego in //agente
where $juego/habilidadUltimate/@duracion = $minu
return $juego/nombre/text()
```
### 20. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias con la misma duración.
```
```
### 21. Muestra el nombre de los agentes que tienen habilidades primarias y secundarias que pertenecen al mismo tipo.
```
```
### 22. Muestra los nombres de los agentes cuyas habilidades primarias son de tipo "Daño" y sus habilidades secundarias son de tipo "Curación".
```
```
### 23. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias que contienen la misma palabra.
```
```
