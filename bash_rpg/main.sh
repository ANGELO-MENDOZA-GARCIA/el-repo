#!/bin/bash

# Llama a los scripts secundarios
source mapa.sh
source inventario.sh
source jugador.sh

# Función principal
main() {
    mostrar_mapa

    while true; do
        read -n 1 -s -r -p "Presiona w (arriba), s (abajo), a (izquierda), d (derecha) para mover al jugador. Presiona i para abrir el inventario. Presiona r para leer un rollo. Presiona q para salir."
        case $REPLY in
            w) mover_jugador "arriba" ;;
            s) mover_jugador "abajo" ;;
            a) mover_jugador "izquierda" ;;
            d) mover_jugador "derecha" ;;
            i) mostrar_inventario ;;
            r) leer_rollo ;;
            q) echo "Saliendo del juego."; exit ;;
            *) echo "Tecla inválida" ;;
        esac
        mostrar_mapa
    done
}

# Llama a la función principal
main
