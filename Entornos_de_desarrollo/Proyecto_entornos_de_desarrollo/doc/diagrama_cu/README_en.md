<div align="right">
    <a href="README.md">Español</a>
    <span> / </span>
    <a href="README_en.md">English</a>
</div>

<div align="center">

# Use case diagram
  
</div>

<div align="justify">

The following diagram corresponds to the use case diagram of this project.

<div align="center>

<img src="img/diagrama_cu.png">

</div>

## Specification of actors

  | Actors          | Player                                                                                                                   |
  | --------------- | ------------------------------------------------------------------------------------------------------------------------ |
  | Description     | The player interacts with the system, requesting information and deciding how to save the results, if desired.           |
  | Characteristics | The player is an abstraction of any user who is using the program. Players are indistinguishable.                        |
  | Relations       |                                                                                                                          |
  | References      |                                                                                                                          |
  | Notes           |                                                                                                                          |
  | Author          | _Javier García Hernández_                                                                                                |
  | Date            | _27/03/2023_                                                                                                             |

## Specification of use cases

| Use Case 	CU.1   | Indicate hand                                                                                                                                 |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by the following document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md  |
| Actors           | Player                                                                                                                                        |
| Description      | The player indicates his current hand.                                                                                           |
| basic flow       |                                                                                                                                               |
| Pre-conditions   |                                                                                                                                               |
| Post-conditions  |                                                                                                                                               |
| Requirements     |                                                                                                                                               |
| Notes            |                                                                                                                                               |
| Author           | _Javier García Hernández_                                                                                                                     |
| Date             | _27/03/23_                                                                                                                                    |

| Use Case   CU.2 | Import data                                                                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by the following document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md  |
| Actors           | Player                                                                                                                                        |
| Description      | The player selects the file on the basis of which the probabilities of success of the move will be calculated.                                |
| basic flow       |                                                                                                                                               |
| Pre-conditions   |                                                                                                                                               |
| Post-conditions  |                                                                                                                                               |
| Requirements     |                                                                                                                                               |
| Notes            |                                                                                                                                               |
| Author           | _Javier García Hernández_                                                                                                                     |
| Date             | _27/03/23_                                                                                                                                    |

| Caso de Uso	CU.3 | Show probabilities                                                                                                                            |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by the following document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md  |
| Actors           | System                                                                                                                                        |
| Description      | According to the hand indicated by the player, the probability of winning with this hand is searched in the file indicated by the player.     |
| basic flow       |                                                                                                                                               |
| Pre-conditions   | The hand (CU1) and imported data (CU2) of the calculations must be indicated.                                                                 |
| Post-conditions  |                                                                                                                                               |
| Requirements     |                                                                                                                                               |
| Notes            |                                                                                                                                               |
| Author           | _Javier García Hernández_                                                                                                                     |
| Date             | _27/03/23_                                                                                                                                    |

| Caso de Uso	CU.4 | Analyze the item                                                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by this document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md   |
| Actors           | Player                                                                                                                                |
| Description      | The player can analyze a saved game by selecting it.                                                                                  |
| basic flow       |                                                                                                                                       |
| Pre-conditions   |                                                                                                                                       |
| Post-conditions  |                                                                                                                                       |
| Requirements     | The file must be in the proper format.                                                                                                 |
| Notes            |                                                                                                                                       |
| Author           | _Raúl Rodríguez Farrais_                                                                                                              |
| Date             | _27/03/23_                                                                                                                            |

| Caso de Uso	CU.5 | Load game                                                                                                                             |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by this document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md   |
| Actors           | Player                                                                                                                                |
| Description      | A new object is generated from the imported file.                                                                                     |
| basic flow       |                                                                                                                                       |
| Pre-conditions   | The player must have selected the analyzed game (CU.4).                                                                               |
| Post-conditions  |                                                                                                                                       |
| Requirements     |                                                                                                                                       |
| Notes            |                                                                                                                                       |
| Author           | _Raúl Rodríguez Farrais_                                                                                                              |
| Date             | _27/03/23_                                                                                                                            |

| Caso de Uso	CU.6 | Start game                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by this document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md   |
| Actors           | Player                                                                                                                                |
| Description      | The player indicates that the hands, from this moment on, are part of the same game.                                                  |
| basic flow       |                                                                                                                                       |
| Pre-conditions   |                                                                                                                                       |
| Post-conditions  |                                                                                                                                       |
| Requirements     |                                                                                                                                       |
| Notes            |                                                                                                                                       |
| Autor            | _Raúl Rodríguez Farrais_                                                                                                              |
| Date             | _27/03/23_                                                                                                                            |

| Caso de Uso	CU.7 | Save game                                                                                                                             |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | El caso de uso se sustenta en este documento:https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md |
| Actors           | Player                                                                                                                                |
| Description      |                                                                                                                                       |
| basic flow       |                                                                                                                                       |
| Pre-conditions   | The player must have started a match (CU.6).                                                                                          |
| Post-conditions  |                                                                                                                                       |
| Requirements     |                                                                                                                                       |
| Notes            |                                                                                                                                       |
| Author           | _Juan Dimas Abrante Hernández_                                                                                                        |
| Date             | _29/02/23_                                                                                                                            |

| Caso de Uso	CU.8 | Save result hand                                                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by this document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md   |
| Actors           | System                                                                                                                                |
| Description      | The result of the played hand is saved.                                                                                                |
| basic flow       | Show odds > Save hand result.                                                                                                         |
| Pre-conditions   | Game must be started (CU.6)                                                                                                           |
| Post-conditions  |                                                                                                                                       |
| Requirements     |                                                                                                                                       |
| Notes            |                                                                                                                                       |
| Author           | _Juan Dimas Abrante Hernández_                                                                                                        |
| Date             | _29/03/23_                                                                                                                            |

| Caso de Uso	CU.9 | End game                                                                                                                              |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | The use case is supported by this document: https://github.com/jdabrante/proyecto_ets/blob/develop/doc/anteproyecto/README_en.md   |
| Actors           | Player                                                                                                                                |
| Description      | The game is over and the hands are no longer kept.                                                                                    |
| basic flow       |                                                                                                                                       |
| Pre-conditions   | Have a game started (CU.6)                                                                                                            |
| Post-conditions  |                                                                                                                                       |
| Requirements     |                                                                                                                                       |
| Notes            | Unsaved game data is lost.                                                                                                                |
| Author           | _Juan Dimas Abrante Hernández_                                                                                                        |
| Date             | _29/03/23_                                                                                                                            |
</div>
