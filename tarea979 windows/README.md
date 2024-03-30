# Documento de Proyecto: Juego en Bash

## Resumen del Proyecto
El proyecto consiste en desarrollar un juego simple en Bash que permita a los usuarios mover un personaje representado por "@" en un mapa con obstáculos representados por "X". El objetivo es implementar movimientos básicos del personaje y detectar los límites del mapa para evitar movimientos fuera de él.

## Detalles Importantes

### Mapa
Se ha diseñado un mapa inicial utilizando una matriz en Bash. El mapa está representado por caracteres, donde "X" representa obstáculos y "." representa espacios vacíos. El personaje del jugador está representado por "@".

```bash
mapa=(
    "XXXXXXXXX"
    "X . . . X"
    "X . @ . X"
    "X . . . X"
    "X X X X X"
)
```
## Movimiento del Personaje
Se ha implementado la funcionalidad para que el jugador pueda moverse hacia arriba, abajo, izquierda y derecha en el mapa. Se han establecido límites para evitar que el jugador salga del mapa.

## Detección de Límites del Mapa
Se han agregado algoritmos para detectar los límites del mapa de manera dinámica. Se exploran todas las filas y columnas del mapa para encontrar los bordes exteriores, excluyendo los obstáculos "X".

## Interfaz de Usuario
Se ha creado una interfaz de usuario simple utilizando la línea de comandos. Los usuarios pueden usar las teclas "w", "s", "a" y "d" para mover al jugador, y la tecla "q" para salir del juego.

## Próximos Pasos
- Mejorar la interfaz de usuario agregando colores y gráficos ASCII.
- Implementar funcionalidades adicionales, como puntos, enemigos o niveles.
- Refactorizar el código para mejorar la legibilidad y la eficiencia.
