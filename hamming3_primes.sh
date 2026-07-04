#!/bin/bash

# hamming3_primes.sh
# Genera todos los números primos de N bits con exactamente 3 bits en 1
# Uso: ./hamming3_primes.sh <N>

# Función de ayuda
mostrar_ayuda() {
    cat << EOF
Uso: $0 <N>

Genera todos los números primos de exactamente N bits con peso de Hamming igual a 3.

Argumentos:
  N    Longitud en bits de los primos a generar (entero >= 3)

Ejemplo:
  $0 1024

El script imprime cada primo encontrado en formato binario y decimal.
EOF
}

# Validación de argumentos
if [ $# -eq 0 ]; then
    echo "Error: falta el argumento N"
    echo "Use '$0 -h' para ver la ayuda"
    exit 1
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    mostrar_ayuda
    exit 0
fi

if [ $# -ne 1 ]; then
    echo "Error: número incorrecto de argumentos"
    echo "Use '$0 -h' para ver la ayuda"
    exit 1
fi

n=$1

# Validar que N sea un entero positivo
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: N debe ser un entero positivo"
    echo "Valor recibido: '$n'"
    exit 1
fi

# Validar que N sea al menos 3
if [ "$n" -lt 3 ]; then
    echo "Error: N debe ser al menos 3 (mínimo para peso de Hamming 3)"
    echo "Valor recibido: $n"
    exit 1
fi

# Validar que N sea razonable (opcional, pero recomendado)
if [ "$n" -gt 100000 ]; then
    echo "Advertencia: N = $n es muy grande, la ejecución puede tardar mucho"
    read -p "¿Desea continuar? (s/N): " continuar
    if [ "$continuar" != "s" ] && [ "$continuar" != "S" ]; then
        echo "Operación cancelada"
        exit 0
    fi
fi

echo "============================================================"
echo "Generando primos de $n bits con peso de Hamming = 3"
echo "============================================================"
echo ""

# Crear número base: 1 seguido de (n-2) ceros y un 1 final
base="1"
for ((i=0; i<n-2; i++)); do
    base="${base}0"
done
base="${base}1"

echo "Número base: $base"
echo "Candidatos a evaluar: $((n-2))"
echo ""
echo "Iniciando búsqueda..."
echo ""

# Contador de primos encontrados
contador=0
inicio=$(date +%s)

# Recorrer todas las posiciones posibles para el tercer bit activo
for ((i=1; i<n-1; i++)); do
    # Mostrar progreso cada 100 iteraciones
    if [ $((i % 100)) -eq 0 ]; then
        actual=$(date +%s)
        transcurrido=$((actual - inicio))
        echo "  Progreso: $i / $((n-2)) candidatos evaluados (${transcurrido}s transcurridos, $contador primos encontrados)"
    fi
    
    # Crear candidato colocando un 1 en la posición i
    candidato="${base:0:i}1${base:i+1}"
    
    # Convertir binario a decimal usando aritmética de Bash (más rápido que bc)
    decimal=$(echo $((2#$candidato)))
    
    # Convertir a hexadecimal para OpenSSL (más robusto para números grandes)
    hex=$(printf '%x\n' "$decimal")
    
    # Verificar primalidad con OpenSSL
    if openssl prime -hex "$hex" 2>/dev/null | grep -q " is prime"; then
        contador=$((contador + 1))
        echo "------------------------------------------------------------"
        echo "Primo #$contador encontrado:"
        echo "  Binario: $candidato"
        echo "  Decimal: $decimal"
        echo "------------------------------------------------------------"
    fi
done

# Calcular tiempo total
fin=$(date +%s)
tiempo_total=$((fin - inicio))

echo ""
echo "============================================================"
echo "BÚSQUEDA COMPLETADA"
echo "============================================================"
echo "Total de primos encontrados: $contador"
echo "Tiempo total de ejecución: $tiempo_total segundos"
echo "============================================================"
