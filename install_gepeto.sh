#!/bin/bash

GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
RESET='\033[0m'

# Función para imprimir en verde
print_green() {
    echo -e "${GREEN}$1${RESET}"
}

# Función para imprimir en amarillo
print_yellow() {
    echo -e "${YELLOW}$1${RESET}"
}

# Función para imprimir en rojo
print_red() {
    echo -e "${RED}$1${RESET}"
}

# Verificar si el archivo install_chatbot.sh existe y es legible
if [ -f gepeto.py ]; then
    # Verificar e instalar colorama
    if python3 -c "import colorama" &> /dev/null; then
        print_green "Colorama ya está instalado."
    else
        print_yellow "Instalando colorama..."
        pip3 install colorama
    fi

    # Verificar e instalar python3
    if command -v python3 &> /dev/null; then
        print_green "Python3 ya está instalado."
    else
        print_yellow "Instalando python3..."
        sudo apt-get update
        sudo apt-get install -y python3
    fi

    # Verificar e instalar openai
    if python3 -c "import openai" &> /dev/null; then
        print_green "OpenAI ya está instalado."
    else
        print_yellow "Instalando openai..."
        pip3 install openai
    fi

    # Mensaje final en colores múltiples
    echo -e "${GREEN}Instalación completada.${RESET}"

    # Cambiar el nombre del archivo a "gepeto"
    mv gepeto.py gepeto

    # Dar permisos de ejecución
    chmod +x gepeto
    # Mover a la carpeta /usr/local/bin
    if [ -d /usr/local/bin ]; then
        sudo mv gepeto /usr/local/bin/
        print_green "El comando 'gepeto' se ha instalado y está listo para usar."
    else
        print_red "No se puede acceder a /usr/local/bin. La instalación no se pudo completar."
    fi
    
else
    # Mensaje de error
    print_red "Gepeto ya está instalado."

fi
