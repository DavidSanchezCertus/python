#!/bin/bash
# Actualizar el sistema e instalar dependencias
sudo apt-get update
sudo apt-get install -y python3-pip python3-venv

# Crear y activar entorno virtual si no existe
if [ ! -d "/home/ec2-user/proyectoPython/venv" ]; then
    python3 -m venv /home/ec2-user/proyectoPython/venv
fi

# Instalar dependencias del proyecto
source /home/ec2-user/proyectoPython/venv/bin/activate
cd /home/ec2-user/proyectoPython
pip install -r requirements.txt 