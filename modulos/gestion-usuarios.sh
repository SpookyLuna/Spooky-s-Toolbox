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
    GESTION DE USUARIOS
    --------------------
    1. Alta de usuario
    2. Baja de usuario
    3. Bloquear usuario
    4. Desbloquear usuario
    5. Modificar contraseña de usuario
    0. Salir

__menu__

    #Leer opción
    read -p "Selecciona acción>" accion

    #Ejecutar orden seleccionada
    case $accion in
    1)
        read -p "Indica el nombre de usuario>" usuario
        sudo adduser $usuario
        ;;
    2)
        seleccion_usuario=$(getent passwd {1000..1500} | cut -d: -f1 | grep -v $(whoami))
            while true; do
                echo "Selecciona un usuario: (0-Atrás)"
                select usuario in $seleccion_usuario; do
                    if [ -z "$usuario" ] ; then
                        break
                    fi
                
                    sudo deluser $usuario && echo "¡$usuario eliminado!" || echo "Ha habido un error"
                    break
                done
            break
            echo "Volviendo..."
            sleep 1
        done    
        ;;
    3)
        seleccion_usuario=$(getent passwd {1000..1500} | cut -d: -f1 | grep -v $(whoami))
            while true; do
                echo "Selecciona un usuario: (0-Atrás)"
                select usuario in $seleccion_usuario; do
                    if [ -z "$usuario" ] ; then
                        break
                    fi
                
                    sudo passwd -l $usuario && echo "¡$usuario bloqueado!" || echo "Ha habido un error"
                    break
                done
            break
            echo "Volviendo..."
            sleep 1
        done 
        ;;
    4)
        seleccion_usuario=$(getent passwd {1000..1500} | cut -d: -f1 | grep -v $(whoami))
            while true; do
                echo "Selecciona un usuario: (0-Atrás)"
                select usuario in $seleccion_usuario; do
                    if [ -z "$usuario" ] ; then
                        break
                    fi
                
                    sudo passwd -u $usuario && echo "¡$usuario desbloqueado!" || echo "Ha habido un error"
                    break
                done
            break
            echo "Volviendo..."
            sleep 1
        done 
        ;;
    5)  
        seleccion_usuario=$(getent passwd {1000..1500} | cut -d: -f1 | grep -v $(whoami))
            while true; do
                echo "Selecciona un usuario: (0-Atrás)"
                select usuario in $seleccion_usuario; do
                    if [ -z "$usuario" ] ; then
                        break
                    fi
                
                    sudo passwd $usuario && echo "¡Contraseña de $usuario cambiada!" || echo "Ha habido un error"
                    break
                done
            break
            echo "Volviendo..."
            sleep 1
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