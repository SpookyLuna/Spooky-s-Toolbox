#!/bin/bash

#Inicio de bucle en menú
while true; do

    #Printeo menú ¿Añadir más funciones?
    clear
    figlet -f small "SPOOKY'S TOOLBOX"
    echo "
                 ___________  ______________________________
              .'           .'                              .'
           .'           .'                              .'  |
        .'___________.'______________________________.'     |
        |.----------.|.-----___-----.|.-----___-----.|      |
        |]          |||_____________|||_____________||      |
        ||          ||.-----___-----.|.-----___-----.|      |
        ||          |||_____________|||_____________||      |
        ||          ||.-----___-----.|.-----___-----.|      |
        |]         o|||_____________|||_____________||      |
        ||          ||.-----___-----.|.-----___-----.|      |
        ||          |||             |||_____________||      |
        ||          |||             ||.-----___-----.|     .'
        |]          |||             |||             ||  .' o)
        ||__________|||_____________|||_____________||'
        ''----------'''-----------------------------''
        (o)         (o)                            (o)

    "
    cat <<__menu__
    -----------------------
    1. Gestión de usuarios
    2. Firewall
    3. Gestión de archivos
    4. Instalar paquetes
    0. Salir
__menu__

    #Leer opción
    read -p "Seleccionar acción>" accion

    #Ejecutar orden seleccionada (Cargada desde /modulos/)
    case $accion in


    1)
        #Ejecuta el menu de gestión de usuarios desde su modulo
        exec ./modulos/gestion-usuarios.sh
        ;;
    2)  
        #Ejecuta el menu de Firewall desde su modulo
        exec ./modulos/firewall.sh
        ;;
    3)  
        #Ejecuta el menu de Getión de archivos desde su modulo
        exec ./modulos/gestion-archivos.sh
        ;;
    4)
        #Ejecuta el instalador de paquetes desde su modulo
        exec ./modulos/instalar-paquetes.sh  
        ;;
    0)
        clear
        break
        ;;
    esac
    sleep 1

done
