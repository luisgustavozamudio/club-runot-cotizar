#!/usr/bin/env bash
# Sube el cotizador a https://clubrunot.cl/cotizar/ (Hostinger, misma cuenta SSH que ozmedia.cl).
# Uso: bash subir.sh
set -euo pipefail
cd "$(dirname "$0")"
SSH=(ssh -i "$HOME/.ssh/hostinger_jro" -p 65002 -o BatchMode=yes -o LogLevel=ERROR)
REMOTE="domains/clubrunot.cl/public_html/cotizar/"
"${SSH[@]}" u716183049@147.93.37.197 "mkdir -p $REMOTE"
rsync -tz -e "${SSH[*]}" index.html icon-180.png "u716183049@147.93.37.197:$REMOTE"
curl -s -o /dev/null -w "clubrunot.cl/cotizar → %{http_code}\n" "https://clubrunot.cl/cotizar/?v=$(date +%s)"
