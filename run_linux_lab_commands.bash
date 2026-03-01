#!/usr/bin/env bash
set -u
set -o pipefail

LOG_FILE="${LOG_FILE:-./linux_lab_commands.log}"
exec > >(tee "$LOG_FILE") 2>&1

WORKDIR="$(mktemp -d)"
trap 'cd /; rm -rf "$WORKDIR"' EXIT

echo "Working directory: $WORKDIR"
cd "$WORKDIR"

grep_cmd_name() {
  local cmd="$1"
  local -a parts
  read -r -a parts <<< "$cmd"
  local token
  for token in "${parts[@]}"; do
    if [[ "$token" == *=* ]]; then
      continue
    fi
    echo "$token"
    return 0
  done
}

run_cmd() {
  local cmd="$1"
  local name
  name="$(grep_cmd_name "$cmd")"
  echo ">>> $cmd"
  if [[ -n "$name" ]] && ! command -v "$name" >/dev/null 2>&1; then
    echo "!! skipping (missing command: $name)"
    echo
    return 0
  fi
  eval "$cmd"
  local status=$?
  if [[ $status -ne 0 ]]; then
    echo "!! command failed ($status)"
  fi
  echo
}

# LABORATORIO 2 -- Obtencion de ayuda
run_cmd "date"
run_cmd "MANPAGER=cat man date | head -n 40"
run_cmd "man -k password | head -n 20"
run_cmd "man -f date"
run_cmd "apropos password | head -n 20"
run_cmd "whatis passwd"
run_cmd "info date | head -n 40"
run_cmd "date --help | head -n 40"
run_cmd "ls /usr/share/doc"

# Busqueda de archivos
run_cmd "locate crontab"
run_cmd 'locate -b "\crontab"'
run_cmd "whereis passwd"

# LABORATORIO 3 -- Archivos y directorios
run_cmd "pwd"
run_cmd 'echo $HOME'
run_cmd 'echo ~'

run_cmd "cd /"
run_cmd "pwd"
run_cmd "cd"
run_cmd "pwd"
run_cmd "cd ~"
run_cmd "pwd"
run_cmd "cd .."
run_cmd "pwd"
run_cmd "cd /usr/bin"
run_cmd "pwd"
run_cmd "cd \"$WORKDIR\""

# Listado de archivos
run_cmd "ls"
run_cmd "ls -a"
run_cmd "ls -l"
run_cmd "ls -la ~"

# Globbing (comodines)
run_cmd "ls -d /etc/s*"
run_cmd "ls -d /etc/????"
run_cmd "ls -d /etc/[abcd]*"

# Copiar, mover y eliminar
run_cmd "cp /etc/hosts hosts"
run_cmd "cp -v /etc/hosts hosts"
run_cmd "cp -rv /etc/ssh ./ssh_backup"
run_cmd "mv hosts hosts_backup"
run_cmd "mv hosts_backup /tmp/"
run_cmd "cp /etc/hosts hosts"
run_cmd "rm hosts"

run_cmd "echo temp > archivo.txt"
run_cmd "printf 'y\\n' | rm -i archivo.txt"

run_cmd "mkdir directorio"
run_cmd "rm -r directorio/"

run_cmd "mkdir proyectos"
run_cmd "mkdir -p proyectos/java/src"
run_cmd "ls -R proyectos"

run_cmd "touch nuevo_archivo.txt"
run_cmd "cat /etc/hosts"

# Combinaciones utiles
run_cmd "ls -lt"
run_cmd "ls -lt | head -n 10"
run_cmd "find /home -name \"*.txt\""
run_cmd "df -h"
run_cmd "free -h"

echo "Done. Log saved to $LOG_FILE"

