# UT4-TE2: Objetos y clases

### TAREA EVALUABLE

## Objetivo

Escriba un programa en Python que permita simular el comportamiento de una partida de cartas de poker modalidad **TEXAS HOLDEM** utilizando técnicas de programación orientada a objetos.

## Propuestas de datos y responsabilidades

### Game

- Datos:
  - Deck
  - Players
  - Dealer
- Responsabilidades:
  - Crear un mazo
  - Crear los jugadores
  - Crear el dealer
  - Comenzar la partida (repartir cartas, buscar mejor combinación)
  - Finalizar la partida (mostrar el ganador y su mano)

### Dealer

- Datos:
  - Mazo
  - Jugadores
- Responsabilidades:
  - Dar cartas a los jugadores
  - Destapar cartas comunes

### Player

- Datos:
  - Nombre
  - 2 cartas propias
  - 5 cartas comunes
- Responsabilidades:
  - Encontrar su mejor combinación de cartas

### Card

- Datos:
  - Número de la carta
  - Palo de la carta
- Responsabilidades:
  - Saber si una carta es menor que otra
  - Representar la carta

### Deck

- Datos:
  - 52 cartas
- Responsabilidades:
  - Dar una carta aleatoria
  - Dar la carta de "arriba"
  - Dar la carta de "abajo"
  - Barajar
  - Ver una carta aleatoria
  - Ver la carta de "arriba"
  - Ver la carta de "abajo"

### Hand

- Datos:
  - 5 cartas
- Responsabilidades:
  - Descubrir la categoría de la mano
  - Asignar una puntuación a la categoría
  - Saber si una mano es mejor que otra (ranking)

## Propuesta de módulos

Propuesta de módulos y clases por módulo:

```
├── main.py
├── game.py
│   └── Game
├── cards.py
│   ├── Card
│   ├── Deck
│   └── Hand
└── roles.py
    ├── Dealer
    └── Player
```

### Módulo helpers

El fichero [helpers.py](./helpers.py) contiene funciones de apoyo al desarrollo del proyecto.

#### `randint(a, b)`

Genera un valor entero aleatorio entre `a` y `b` incluidos:

```python
>>> import helpers

>>> helpers.randint(1, 52)
8

>>> helpers.randint(1, 4)
2
```

Si sólo se pasa un argumento, devolverá un valor aleatorio entre 0 y el argumento pasado:

```python
>>> helpers.randint(10)
1

>>> helpers.randint(10)
6
```

#### `shuffle(items)`

Baraja los elementos que hay en `items`. No devuelve nada. La modificación queda en `items`:

```python
>>> cards = ['A', 'J', 'K', 'Q']

>>> helpers.shuffle(cards)

>>> cards
['Q', 'A', 'K', 'J']
```

#### `combinations(values, n)`

Genera todas las combinaciones posibles de `values` de tamaño `n`:

```python
>>> list(helpers.combinations((1, 2, 3, 4, 5), n=3))
[(1, 2, 3),
 (1, 2, 4),
 (1, 2, 5),
 (1, 3, 4),
 (1, 3, 5),
 (1, 4, 5),
 (2, 3, 4),
 (2, 3, 5),
 (2, 4, 5),
 (3, 4, 5)]
```

> 💡 El parámetro `n` debe pasarse por nombre.

## Notas

- El programa **no debe ser interactivo**, simplemente se ejecuta y dice quién gana la partida.
- Los nombres de los jugadores pueden ser generados aleatoriamente o secuencialmente empezando desde 1.
- No se puede usar ningún módulo de la librería estándar salvo las funciones de apoyo que se aportan.

## Referencias

https://en.wikipedia.org/wiki/List_of_poker_hands