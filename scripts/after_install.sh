#!/bin/bash

# Navegar al directorio del proyecto
cd /home/ec2-user/proyectoPython

# Crear y activar entorno virtual si no existe
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activar entorno virtual
source venv/bin/activate

# Actualizar pip
python3 -m pip install --upgrade pip

# Instalar dependencias del proyecto
pip install -r requirements.txt 