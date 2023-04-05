#!/bin/bash

# Leer las operaciones del archivo per_fer.txt y guardar los resultados en fets.txt
while read -r linea; do
    # Separar la línea en los operandos y el operador
    operandos=($(echo $linea | awk '{print $1, $3}'))
    operador=$(echo $linea | awk '{print $2}')

    # Resolver la operación utilizando el operador correspondiente
    if [ "$operador" == "+" ]; then
        resultado=$((${operandos[0]} + ${operandos[1]}))
    elif [ "$operador" == "-" ]; then
        resultado=$((${operandos[0]} - ${operandos[1]}))
    elif [ "$operador" == "*" ]; then
        resultado=$((${operandos[0]} * ${operandos[1]}))
    elif [ "$operador" == "/" ]; then
        resultado=$((${operandos[0]} / ${operandos[1]}))
    else
        echo "Error: Operador no reconocido en la línea \"$linea\""
        continue
    fi

    # Escribir el resultado en el archivo fets.txt
    echo "$linea = $resultado" >> fets.txt
done < per_fer.txt

echo "Operaciones resueltas correctamente."
