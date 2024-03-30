#!/bin/bash

# Función para seleccionar personaje
seleccionar_personaje() {
    echo "Selecciona tu personaje:"
    echo "1. Hechicero"
    echo "2. Asesino"
    read -p "Ingresa el número correspondiente al personaje: " opcion_personaje

    case $opcion_personaje in
        1)
            personaje="Hechicero"
            ;;
        2)
            personaje="Asesino"
            ;;
        *)
            echo "Opción inválida"
            seleccionar_personaje
            ;;
    esac

    echo "Soy $personaje"

    # Guardar la elección del personaje en el archivo partida_guardada.txt
    echo "Personaje: $personaje" > partida_guardada.txt
}

# Función para cargar la partida
cargar_partida() {
    if [[ -f partida_guardada.txt ]]; then
        # Leer el estado del juego desde el archivo
        estado=$(<partida_guardada.txt)
        # Mostrar el estado del juego
        echo "Estado de la partida: $estado"
    else
        echo "No hay una partida guardada para cargar."
    fi
}

# Main
while true; do
    echo "1. Seleccionar personaje"
    echo "2. Cargar partida"
    echo "3. Salir"
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1)
            seleccionar_personaje
            ;;
        2)
            cargar_partida
            ;;
        3)
            echo "Saliendo del juego."
            exit 0
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
done
