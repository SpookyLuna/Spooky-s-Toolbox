#!/bin/bash

#Convertir a gestor de paquetes (Instalar, desinstalar y etc); comprobar si el paquete existe, sino, preguntar de nuevo

echo "Introduce el paquete que quieras instalar"
    read input
    paquete=$input
    sudo apt install $paquete
        if [ $? == 0 ]  ; then
            echo "¡$paquete instalado con éxito!"
        else
            echo "Ha habido un error intalando el paquete"
        fi
    sleep 1
    clear
    exec ./menu.sh


