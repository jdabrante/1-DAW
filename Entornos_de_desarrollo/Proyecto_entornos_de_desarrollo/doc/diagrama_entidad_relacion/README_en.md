<div align="right">

<a href="README.md">Español</a> / <a href="README_en.md">English</a>

</div>

# Entity-relationship diagram

<div align="justify">

The following diagram shows the existing relationship as well as the attributes of each database table.


<br>

<div align="center">

<img src="img/diagrama_entidad_relacion.png">

</div>

<br>

The first entity found in the diagram is "Game". This will be a record table of each saved game, so it will have as attributes the start date of the game, a unique identifier (numeric autoincremental), the time or duration of the same and the result obtained at the end. Therefore, this entity is related with the table "hand" which has stored all the possible hands withidn a poker game, being this relationship N:M because a game is made up of many hands and at the same time a hand can be in one or more games.

Following the diagram reading, as mentioned in the previous paragraph, the next entity is "hand" which will have a recursive relationship with a cardinality of N:M where a hand can be compared to all other possibles hands, keeping the probability of winning as an attribute in the entity relationship.

</div>
