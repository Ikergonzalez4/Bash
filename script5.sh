#!/bin/bash

echo "Introduce el primer valor:"
read valor1

echo "Introduce el segundo valor:"
read valor2

echo "Selecciona la operación a realizar:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"
read operacion

case $operacion in
    1)
        resultado=$(echo "scale=2; $valor1 + $valor2" | bc)
        echo "El resultado de la suma es: $resultado"
        ;;
    2)
        resultado=$(echo "scale=2; $valor1 - $valor2" | bc)
        echo "El resultado de la resta es: $resultado"
        ;;
    3)
        resultado=$(echo "scale=2; $valor1 * $valor2" | bc)
        echo "El resultado de la multiplicación es: $resultado"
        ;;
    4)
        resultado=$(echo "scale=2; $valor1 / $valor2" | bc)
        echo "El resultado de la división es: $resultado"
        ;;
    *)
        echo "Operación no válida. Por favor, seleccione una operación válida."
        ;;
esac
