#!/bin/bash
# Activar entorno virtual
source /home/ubuntu/venv/bin/activate

# Navegar al directorio del proyecto
cd /home/ubuntu/proyectoPython

# Iniciar la aplicación con Gunicorn en segundo plano
gunicorn --bind 0.0.0.0:8080 wsgi:app --daemon --access-logfile /home/ubuntu/app.log --error-logfile /home/ubuntu/error.log 