#!/bin/sh
set -eu

if [ "$(id -u)" -ne 0 ]; then
    echo "Execute como root: sudo sh debian/base.sh"
    exit 1
fi

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_DIR=$(dirname "$SCRIPT_DIR")
PACKAGE_LIST="$REPO_DIR/packages/base.txt"

echo "Atualizando índices do APT..."
apt-get update

echo "Instalando ferramentas básicas..."
apt-get install -y $(grep -Ev '^[[:space:]]*(#|$)' "$PACKAGE_LIST")

echo "Instalação da base concluída."