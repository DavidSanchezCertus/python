#!/bin/bash
set -e  # Exit on error

echo "Iniciando la aplicación..."

# Activar entorno virtual
echo "Activando entorno virtual..."
source /home/ec2-user/proyectoPython/venv/bin/activate

# Verificar que el entorno virtual está activo
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: El entorno virtual no se activó correctamente"
    exit 1
fi

# Navegar al directorio del proyecto
cd /home/ec2-user/proyectoPython
echo "Directorio actual: $(pwd)"

# Agregar el directorio del proyecto al PYTHONPATH
export PYTHONPATH="/home/ec2-user/proyectoPython:${PYTHONPATH:-}"

# Verificar que wsgi.py existe
if [ ! -f "src/wsgi.py" ]; then
    echo "Error: wsgi.py no encontrado"
    ls -la src/
    exit 1
fi

# Verificar que __init__.py existe
if [ ! -f "src/__init__.py" ]; then
    echo "Error: src/__init__.py no encontrado"
    ls -la src/
    exit 1
fi

# Matar cualquier proceso existente de Gunicorn
echo "Deteniendo procesos previos de Gunicorn..."
pkill gunicorn || true
sleep 2

# Iniciar la aplicación con Gunicorn en segundo plano
echo "Iniciando Gunicorn..."
gunicorn --bind 0.0.0.0:8080 'src.wsgi:app' \
    --daemon \
    --access-logfile /home/ec2-user/app.log \
    --error-logfile /home/ec2-user/error.log \
    --log-level debug \
    --capture-output \
    --reload

# Verificar que Gunicorn está corriendo
sleep 2
if ! pgrep gunicorn > /dev/null; then
    echo "Error: Gunicorn no se inició correctamente"
    tail -n 20 /home/ec2-user/error.log
    exit 1
fi

echo "Aplicación iniciada correctamente"
echo "Procesos Gunicorn:"
ps aux | grep gunicorn 