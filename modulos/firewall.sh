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
    -------------------
          FIREWALL
    --------------------
    1. Instalar UFW
    2. Abrir puertos
    3. Cerrar puertos
    4. Comprobar puertos abiertos
    5. Activar UFW
    6. Recargar UFW
    0. Salir

__menu__

    #Leer opción
    read -p "Selecciona acción>" accion

    #Ejecutar orden seleccionada
    case $accion in
    1)
        while true; do
        echo "¿Quieres realizar instalar UFW? [S/N]"
        read input
        input=$input 
            if [ $input == "S" ] || [ $input == "s" ] ; then
                sudo apt update && sudo apt install ufw && echo "Se ha instalado UFW" || echo "Se ha producido un error"
            else
                echo "Cancelando..."
            fi
        break

        echo "Volviendo..."
        sleep 3
        done 
        ;;
    2)
        while true; do
            ##echo "Introduce el/los puertos que quieres abrir (Los puertos deben ir separados por ','"
            echo "Introduce el puerto que deseas abrir"
            read input
            puertos=$input
            #sudo ufw allow $puertos && echo "Se han abiertos los puertos $puertos" || echo "Ha habido un error"
            sudo ufw allow $puertos && echo "Se ha abierto el puerto $puertos" || echo "Ha habido un error"
        break
        
        echo "Volviendo..."
        sleep 3
        done
        ;;
    3)
        while true; do
        ##echo "Introduce la/las reglas de puertos que quieres cerrar (Las reglas deben ir separados por ','"
        echo "Introduce la regla de puertos que deseas cerrar"
            read input
            reglas=$input
            #sudo ufw delete $puertos && echo "Se han cerrado las reglas de puertos $reglas" || echo "Ha habido un error"
            sudo ufw delete $reglas && echo "Se ha cerrado la regla de puertos $reglas" || echo "Ha habido un error"
        break
        
        echo "Volviendo..."
        sleep 3
        done
        ;;
    4)
        sudo ufw status

        echo "Volviendo..."
        sleep 3
        ;;
    5)  
        while true; do
        echo "¿Quieres activar el Firewall? [S/N]"
        read input
        input=$input 
            if [ $input == "S" ] || [ $input == "s" ] ; then
                sudo ufw enable && echo "Se ha activado el Firewall" || echo "Se ha producido un error"
            else
                echo "Cancelando..."
            fi
        break

        echo "Volviendo..."
        sleep 3
        done
        ;;
    6)  
        while true; do
        echo "¿Quieres recargar el Firewall? [S/N]"
        read input
        input=$input 
            if [ $input == "S" ] || [ $input == "s" ] ; then
                sudo ufw reload && echo "Se ha recargado el Firewall" || echo "Se ha producido un error"
            else
                echo "Cancelando..."
            fi
        break

        echo "Volviendo..."
        sleep 3
        done
        ;;


    0)
        clear
        exec ./menu.sh
        break
        ;;
    esac
    sleep 1

done