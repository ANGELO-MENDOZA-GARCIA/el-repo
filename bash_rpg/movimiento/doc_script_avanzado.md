### Documentación del Código Bash

El siguiente script implementa un juego simple donde un jugador representado por el símbolo "@" puede moverse por un laberinto representado por una matriz de caracteres. El jugador puede destruir objetos "O" dentro de un cierto rango de su posición actual.

El juego proporciona las siguientes funcionalidades:

1. **Inicialización del Mapa:**
   - Se define un mapa representado como una matriz de caracteres en la cual:
     - "X" representa las paredes del laberinto.
     - "@" representa la posición inicial del jugador.
     - "O" representa los objetos destructibles.
     - Espacios en blanco representan áreas accesibles.

2. **Función `mostrar_mapa()`:**
   - Limpia la pantalla.
   - Muestra el estado actual del mapa en la terminal.

3. **Función `destruir_objetos()`:**
   - Toma la posición actual del jugador como entrada.
   - Destruye objetos "O" cercanos al jugador dentro de un radio de 2 casillas a la redonda.

4. **Función `mover_jugador()`:**
   - Toma una dirección ("arriba", "abajo", "izquierda", "derecha") como entrada.
   - Calcula la nueva posición del jugador después de moverse en la dirección especificada.
   - Verifica si la nueva posición es válida y no está bloqueada por paredes.
   - Actualiza la posición del jugador en el mapa y destruye objetos si es necesario.

5. **Bucle Principal (`Main`):**
   - Muestra el mapa inicial.
   - Permite al jugador moverse utilizando las teclas "w" (arriba), "s" (abajo), "a" (izquierda), "d" (derecha).
   - Al presionar "q", el juego se termina.

#### Uso:
- Ejecuta el script en una terminal Bash.
- Usa las teclas "w", "a", "s", "d" para mover al jugador.
- Presiona "q" para salir del juego.

Este script proporciona una base simple para crear juegos en la terminal de Linux utilizando Bash.
