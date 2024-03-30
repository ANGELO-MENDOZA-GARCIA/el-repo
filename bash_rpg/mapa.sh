#!/bin/bash

mapa=(
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    "X @      O         R        R X"
    "X     XXXXX            XXXX   X"
    "X     X   X     XX     X  X   X"
    "X O O XXXXX     XX     XXXX   X"
    "X                             X"
    "X            X  X       R     X"
    "X  R         X  X OOOOOOOOOOOOX"
    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
)

# Definición de funciones relacionadas con el mapa
mostrar_mapa() {
    clear
    for fila in "${mapa[@]}"; do
        echo "$fila"
    done
}
