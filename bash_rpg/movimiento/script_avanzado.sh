#!/bin/bash

# Inicialización del mapa
mapa=(
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    "X @      O         O          X"
    "X  X  XXXXX  X     X   XXXX   X"
    "X  X  X   X  X  X  X   X  X   X"
    "X  X  XXXXX  X  X  X   XXXX   X"
    "X  X         X  X  X   XO     X"
    "X  XXXXXXX   X  X  X   XXXX   X"
    "X         O  X  X  X          X"
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
)

alto_mapa=${#mapa[@]}
ancho_mapa=${#mapa[0]}
pos_x=2
pos_y=1

limite_izquierdo=0
limite_derecho=$((ancho_mapa - 1))
limite_superior=0
limite_inferior=$((alto_mapa - 1))

# Función para mostrar el mapa
mostrar_mapa() {
    clear
    for fila in "${mapa[@]}"; do
        echo "$fila"
    done
}

# Función para destruir objetos destructibles cercanos al jugador
destruir_objetos() {
    local x=$1
    local y=$2

    for ((i = y - 2; i <= y + 2; i++)); do
        for ((j = x - 2; j <= x + 2; j++)); do
            if ((i >= 0 && i < alto_mapa && j >= 0 && j < ancho_mapa)); then
                if [[ ${mapa[$i]:$j:1} == "O" ]]; then
                    mapa[$i]=${mapa[$i]:0:$j}" "${mapa[$i]:$(($j+1))}
                fi
            fi
        done
    done
}

# Función para mover al jugador
mover_jugador() {
    local direccion=$1
    local nueva_pos_x=$pos_x
    local nueva_pos_y=$pos_y

    case $direccion in
        "arriba")
            nueva_pos_y=$((pos_y - 1))
            ;;
        "abajo")
            nueva_pos_y=$((pos_y + 1))
            ;;
        "izquierda")
            nueva_pos_x=$((pos_x - 1))
            ;;
        "derecha")
            nueva_pos_x=$((pos_x + 1))
            ;;
        *)
            echo "Dirección inválida"
            return
            ;;
    esac

    if (( nueva_pos_x >= limite_izquierdo && nueva_pos_x <= limite_derecho && nueva_pos_y >= limite_superior && nueva_pos_y <= limite_inferior )); then
        if [[ ${mapa[$nueva_pos_y]:$nueva_pos_x:1} != "X" ]]; then
            mapa[$pos_y]=${mapa[$pos_y]:0:$pos_x}" "${mapa[$pos_y]:$(($pos_x+1))}
            pos_x=$nueva_pos_x
            pos_y=$nueva_pos_y
            mapa[$pos_y]=${mapa[$pos_y]:0:$pos_x}"@"${mapa[$pos_y]:$(($pos_x+1))}
            destruir_objetos $pos_x $pos_y
        else
            echo "Movimiento no válido"
        fi
    else
        echo "Fuera del mapa"
    fi
}

# Main
mostrar_mapa

while true; do
    read -n 1 -s -r -p "Presiona w (arriba), s (abajo), a (izquierda), d (derecha) para mover al jugador. Presiona q para salir."
    case $REPLY in
        w) mover_jugador "arriba" ;;
        s) mover_jugador "abajo" ;;
        a) mover_jugador "izquierda" ;;
        d) mover_jugador "derecha" ;;
        q) echo "Saliendo del juego."; exit ;;
        *) echo "Tecla inválida" ;;
    esac
    mostrar_mapa
done
