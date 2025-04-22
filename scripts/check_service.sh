#!/bin/bash
echo "Verificando procesos Gunicorn..."
ps aux | grep gunicorn

echo -e "\nVerificando puerto 8080..."
sudo netstat -tulpn | grep :8080

echo -e "\nVerificando logs de la aplicación..."
tail -n 20 /home/ec2-user/app.log
tail -n 20 /home/ec2-user/error.log

echo -e "\nVerificando permisos del directorio..."
ls -la /home/ec2-user/proyectoPython/

echo -e "\nVerificando estado del firewall..."
sudo systemctl status firewalld || echo "Firewall no está instalado" 