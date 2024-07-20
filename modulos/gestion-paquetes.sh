#!/bin/bash

while true; do

    # Mostrar menú
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
    cat << __menu__
    --------------------
     GESTION DE PAQUETES
    --------------------
    1. Buscar
    2. Comprobar paquetes instalados
    3. Instalar
    4. Desinstalar
    0. Salir

__menu__

    #Leer opción
    read -p "Selecciona acción>" accion

    #Ejecutar orden seleccionada
    case $accion in

    1)
        echo "Introduce el nombre del paquete que deseas buscar"
        read paquete
        paquete=$paquete
        sudo apt search $paquete || echo "No se ha encontrado el paquete $paquete"

        echo "Volviendo..."
        sleep 3
    ;;
    
    2)
        apt list --installed
        
        echo "Volviendo..."
        sleep 3
    ;;

    3)
        echo "Introduce el nombre del paquee que deseas instalar"
        read paquete
        paquete=$paquete
        sudo apt install $paquete && echo "$paquete se ha instalado con éxito" || echo "No se ha podido instalar $paquete"

        echo "Volviendo..."
        sleep 3
    ;;

    4)
        echo "Introduce el nombre del paquete que deseas desinstalar"
        read paquete
        paquete=$paquete
        sudo apt remove $paquete && echo "$paquete se ha desinstalado con éxito" || echo "No se ha podido desinstalar $paquete"

        echo "Volviendo..."
        sleep 3
    ;;

    0)
        clear
        exec ./menu.sh
        break
        ;;

    esac
    sleep 1

done
