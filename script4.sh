#!/bin/bash

fecha=$(date +%x)

declare -A vacunaciones
registro=0
while read -r linea; do
    campos=($(echo $linea | tr ':' ' '))

    usuario=${campos[0]}
    vacunas=${campos[1]}

    ((vacunaciones["$usuario"]+=vacunas))

    registro=${campos[2]}
done < vacunacio.txt

((registro++))

echo "Introduce el nombre del usuario:"
read usuario
echo "Introduce el número de vacunas que ha recibido:"
read vacunas

((vacunaciones["$usuario"]+=vacunas))

echo "$usuario:${vacunaciones["$usuario"]}:$registro:$fecha" >> vacunacio_1.txt

echo "Registro de vacunaciones actualizado correctamente."
