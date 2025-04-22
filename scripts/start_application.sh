#!/bin/bash
# Activar entorno virtual
source /home/ec2-user/proyectoPython/venv/bin/activate

# Navegar al directorio del proyecto
cd /home/ec2-user/proyectoPython

# Iniciar la aplicación con Gunicorn en segundo plano
gunicorn --bind 0.0.0.0:8080 wsgi:app --daemon --access-logfile /home/ec2-user/app.log --error-logfile /home/ec2-user/error.log 