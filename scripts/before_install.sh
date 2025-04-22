#!/bin/bash
# Actualizar el sistema e instalar dependencias
sudo yum update -y
sudo yum install -y python3-pip

# Limpiar el directorio de destino si existe
if [ -d "/home/ec2-user/proyectoPython" ]; then
    sudo rm -rf /home/ec2-user/proyectoPython/*
fi

# Crear el directorio si no existe
sudo mkdir -p /home/ec2-user/proyectoPython
sudo chown -R ec2-user:ec2-user /home/ec2-user/proyectoPython

# Crear y activar entorno virtual si no existe
if [ ! -d "/home/ec2-user/proyectoPython/venv" ]; then
    python3 -m venv /home/ec2-user/proyectoPython/venv
fi

# Instalar dependencias del proyecto
source /home/ec2-user/proyectoPython/venv/bin/activate
cd /home/ec2-user/proyectoPython
pip install -r requirements.txt 