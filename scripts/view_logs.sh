#!/bin/bash

function show_menu() {
    echo "=== Monitor de Logs ==="
    echo "1) Ver logs de acceso (app.log)"
    echo "2) Ver logs de error (error.log)"
    echo "3) Ver logs de CodeDeploy"
    echo "4) Ver todos los logs simultáneamente"
    echo "5) Ver últimas 50 líneas de cada log"
    echo "q) Salir"
    echo "===================="
}

function view_access_logs() {
    echo "Mostrando logs de acceso (Ctrl+C para salir)..."
    tail -f /home/ec2-user/app.log
}

function view_error_logs() {
    echo "Mostrando logs de error (Ctrl+C para salir)..."
    tail -f /home/ec2-user/error.log
}

function view_codedeploy_logs() {
    echo "Mostrando logs de CodeDeploy (Ctrl+C para salir)..."
    sudo tail -f /var/log/aws/codedeploy-agent/codedeploy-agent.log
}

function view_all_logs() {
    echo "Mostrando todos los logs (Ctrl+C para salir)..."
    tail -f /home/ec2-user/app.log /home/ec2-user/error.log /var/log/aws/codedeploy-agent/codedeploy-agent.log
}

function view_last_50() {
    echo "=== Últimas 50 líneas de logs de acceso ==="
    tail -n 50 /home/ec2-user/app.log
    echo -e "\n=== Últimas 50 líneas de logs de error ==="
    tail -n 50 /home/ec2-user/error.log
    echo -e "\n=== Últimas 50 líneas de logs de CodeDeploy ==="
    sudo tail -n 50 /var/log/aws/codedeploy-agent/codedeploy-agent.log
}

while true; do
    show_menu
    read -p "Selecciona una opción: " choice
    case $choice in
        1) view_access_logs ;;
        2) view_error_logs ;;
        3) view_codedeploy_logs ;;
        4) view_all_logs ;;
        5) view_last_50 ;;
        q|Q) exit 0 ;;
        *) echo "Opción inválida" ;;
    esac
done 