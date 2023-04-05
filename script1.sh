#!/bin/bash

# Ejecutar el comando w para obtener una lista de usuarios conectados
# y filtrar los resultados para obtener solo las líneas que representan
# conexiones remotas
w -h | grep -v "pts/0" | grep "pts/" > usuarios.txt

# Iterar sobre cada línea de la lista de usuarios conectados y extraer
# el nombre de usuario y la dirección IP, y agregarlos al archivo usuarios.txt
while read -r linea; do
    usuario=$(echo $linea | awk '{print $1}')
    ip=$(echo $linea | awk '{print $3}')
    echo "${usuario}: ${ip}" >> usuarios.txt
done < usuarios.txt

echo "Archivo generado correctamente."