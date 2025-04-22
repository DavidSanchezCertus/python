#!/bin/bash
set -e  # Exit on error

echo "Iniciando after_install.sh"

# Navegar al directorio del proyecto
cd /home/ec2-user/proyectoPython
echo "Cambiado al directorio del proyecto"

# Verificar que requirements.txt existe
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt no encontrado"
    exit 1
fi

# Crear y activar entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando nuevo entorno virtual..."
    python3 -m venv venv
fi

# Activar entorno virtual
echo "Activando entorno virtual..."
source venv/bin/activate

# Actualizar pip
echo "Actualizando pip..."
python3 -m pip install --upgrade pip

# Instalar dependencias del proyecto
echo "Instalando dependencias..."
pip install -r requirements.txt

echo "Instalación completada exitosamente" 