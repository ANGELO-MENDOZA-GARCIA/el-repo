#!/bin/bash

# Lista de rollos
rollos=("Rollo1" "Rollo2" "Rollo3")

# Estado del inventario
inventario=()

# Directorio para los archivos de rollos
directorio_rollos="./rollos"

# Definición de funciones relacionadas con el inventario

# Función para mostrar el inventario
# Esta función muestra los rollos disponibles en el inventario.
mostrar_inventario() {
    clear
    echo "Inventario:"
    echo "------------"
    if [ ${#inventario[@]} -eq 0 ]; then
        echo "Inventario vacío"
    else
        for rollo in "${inventario[@]}"; do
            echo "$rollo"
        done
    fi
    echo "------------"
    read -n 1 -s -r -p "Presiona cualquier tecla para cerrar el inventario"
}

# Función para leer un rollo desde el inventario
# Esta función lee el contenido de un rollo seleccionado del inventario.
leer_rollo() {
    clear
    echo "Selecciona un rollo para leer:"
    select rollo in "${inventario[@]}"; do
        if [ -n "$rollo" ]; then
            clear
            if [ -f "$directorio_rollos/$rollo.txt" ]; then
                echo "Leyendo $rollo:"
                echo "------------"
                cat "$directorio_rollos/$rollo.txt"
                echo "------------"
                read -n 1 -s -r -p "Presiona cualquier tecla para cerrar el rollo"
            else
                echo "Error: No se encontró el archivo del rollo."
            fi
        else
            echo "Error: Selecciona un rollo válido."
        fi
        break
    done
}


# Función para recoger rollos
recoger_rollos() {
    local x=$1
    local y=$2

    for ((i = y - 2; i <= y + 2; i++)); do
        for ((j = x - 2; j <= x + 2; j++)); do
            if ((i >= 0 && i < alto_mapa && j >= 0 && j < ancho_mapa)); then
                if [[ ${mapa[$i]:$j:1} == "R" ]]; then
                    # Verificar si ya se recogieron los tres rollos
                    if [ ${#inventario[@]} -lt 3 ]; then
                        # Obtener la longitud del arreglo
                        longitud_inventario=${#inventario[@]}
                        # Sumar 1 a la longitud del arreglo
                        numero_rollo=$((longitud_inventario + 1))

                        # Agregar el rollo al inventario si no está ya en él
                        if ! [[ " ${inventario[@]} " =~ "Rollo${numero_rollo}" ]]; then
                            inventario+=("Rollo${numero_rollo}")
                        fi
                    else
                        echo "Ya no hay más rollos disponibles."
                    fi
                    # Limpiar el rollo del mapa
                    mapa[$i]=${mapa[$i]:0:$j}" "${mapa[$i]:$(($j+1))}
                fi
            fi
        done
    done
}
