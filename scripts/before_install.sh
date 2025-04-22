#!/bin/bash
# Actualizar el sistema e instalar dependencias
sudo apt-get update
sudo apt-get install -y python3-pip python3-venv

# Crear y activar entorno virtual si no existe
if [ ! -d "/home/ubuntu/venv" ]; then
    python3 -m venv /home/ubuntu/venv
fi

# Instalar dependencias del proyecto
source /home/ubuntu/venv/bin/activate
cd /home/ubuntu/proyectoPython
pip install -r requirements.txt 