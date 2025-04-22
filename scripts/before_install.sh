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

# Establecer permisos correctos
sudo chown -R ec2-user:ec2-user /home/ec2-user/proyectoPython
sudo chmod -R 755 /home/ec2-user/proyectoPython 