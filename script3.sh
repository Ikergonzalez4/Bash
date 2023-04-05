#!/bin/bash

# Leer el archivo vacunacio.txt y contar las dosis de vacuna para cada usuario
while read -r linea; do
    # Separar la línea en campos utilizando el carácter ':' como separador
    campos=($(echo $linea | tr ':' ' '))

    usuario=${campos[0]}
    dosis=${campos[1]}

    if [ "$dosis" == "1" ]; then
        ((pauta1["$usuario"]++))
    elif [ "$dosis" == "2" ]; then
        ((pauta2["$usuario"]++))
    elif [ "$dosis" == "3" ]; then
        ((pauta3["$usuario"]++))
    fi
done < vacunacio.txt

for usuario in "${!pauta1[@]}"; do
    echo "$usuario: ${pauta1[$usuario]} dosis" >> una_pauta.txt
done

for usuario in "${!pauta2[@]}"; do
    echo "$usuario: ${pauta2[$usuario]} dosis" >> dues_pautes.txt
done

for usuario in "${!pauta3[@]}"; do
    echo "$usuario: ${pauta3[$usuario]} dosis" >> tres_pautes.txt
done

echo "Listas de usuarios y dosis de vacuna generadas correctamente."
