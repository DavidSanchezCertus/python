#!/bin/bash
set -e  # Exit on error

echo "Iniciando after_install.sh"

# Navegar al directorio del proyecto
cd /home/ec2-user/proyectoPython
echo "Cambiado al directorio del proyecto"

# Esperar un momento para asegurarse de que los archivos estén copiados
sleep 5

# Verificar que requirements.txt existe
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt no encontrado en $(pwd)"
    ls -la
    exit 1
fi

# Crear y activar entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando nuevo entorno virtual..."
    python3 -m venv venv
    echo "Entorno virtual creado"
fi

# Asegurar permisos del entorno virtual
echo "Estableciendo permisos del entorno virtual..."
chmod -R 755 venv

# Activar entorno virtual
echo "Activando entorno virtual..."
source venv/bin/activate

# Verificar activación del entorno virtual
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: El entorno virtual no se activó correctamente"
    exit 1
fi

# Actualizar pip
echo "Actualizando pip..."
python3 -m pip install --upgrade pip

# Mostrar contenido del directorio
echo "Contenido del directorio actual:"
ls -la

# Instalar dependencias del proyecto
echo "Instalando dependencias..."
pip install -r requirements.txt

echo "Instalación completada exitosamente" 