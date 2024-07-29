#!/bin/bash

GITHUB_USER=jyopablo

# Verificar si la variable GITHUB_USER está vacía
if [ -z "$GITHUB_USER" ]; then
    echo "Debe proporcionar un nombre de usuario de GitHub."
    exit 1
fi

# Construir la URL de la API de GitHub usando el nombre de usuario
URL="https://api.github.com/users/$GITHUB_USER"

# Obtener los datos del usuario de GitHub en formato JSON
USER_DATA=$(curl -s $URL)

# Verificar si el usuario no fue encontrado (verifica el campo 'message' del JSON)
if [ "$(echo "$USER_DATA" | jq -r '.message')" == "Not Found" ]; then
    echo "Usuario no encontrado."
    exit 1
fi

# Extraer datos específicos del JSON usando 'jq'
USER_ID=$(echo "$USER_DATA" | jq -r '.id')
CREATED_AT=$(echo "$USER_DATA" | jq -r '.created_at')

# Formatear el mensaje
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
echo $MESSAGE

# Crear un directorio basado en la fecha actual para almacenar el log
DATE=$(date +%Y-%m-%d)
LOG_DIR="/tmp/$DATE"
mkdir -p $LOG_DIR

# Escribir el mensaje en el archivo de log
echo $MESSAGE >> "$LOG_DIR/saludos.log"

