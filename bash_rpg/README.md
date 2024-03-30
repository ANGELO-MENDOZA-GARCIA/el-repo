# Documento de Proyecto: Juego en Bash

## Resumen del Proyecto
El proyecto consiste en desarrollar un juego simple en Bash que permita a los usuarios mover un personaje representado por "@" en un mapa con obstáculos representados por "X" y que recolecte rollos con texto que puede leer luego representadospor "R". El objetivo es implementar movimientos básicos del personaje y detectar los límites del mapa para evitar movimientos fuera de él y un sistema de inventario y lectura de archivos de texto conforme los va recolectando el jugador.

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
Se ha creado una interfaz de usuario simple utilizando la línea de comandos. Los usuarios pueden usar las teclas "w", "s", "a" y "d" para mover al jugador,"i" para abrir el inventario, "r" para leer los rollos adquiridos, y la tecla "q" para salir del juego.

## Estructura de archivos
El juego final y totalmente jugable es el `main.sh`, este está complementado por el resto de archivos titulados `inventario.sh`, `jugador.sh`, `mapa.sh`, y útlimo pero no menos importante `./rollos`, este es el directorio con los 3 royos disponibles, que conforme se vayan recolectando por el jugador los podrá leer con "r". Estos archivos son totalmente editables y expande la mecánica de dar información al jugador conforme vaya avanzando en los niveles.

### Detalles de la recolección de rollos
En la línea 66, hay un "if" que detecta si la longitud del arreglo del inventario es menor o igual a 3. Esto se debe a que de antemano solo hay 3 rollos en el directorio `./rollos`. Este código se puede eliminar por completo y el juego seguirá funcionando correctamente. Seguiré experimentando con esto, porque aunque ya no detecte si la longitud del arreglo del inventario superó la cantidad de rollos disponibles, como ya no hay, pues ya no añade nada al inventario. Por lo tanto no da error.

## Próximos Pasos
- Mejorar la interfaz de usuario agregando colores y gráficos ASCII.
- Implementar funcionalidades adicionales, como puntos, enemigos o niveles.
- Refactorizar el código para mejorar la legibilidad y la eficiencia.
