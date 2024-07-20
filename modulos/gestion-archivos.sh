#!/bin/bash

while true; do
    
    #TODO: 6) Conexión SFTP; comprobar si unrar/unzip estan instalados, en caso de no estarlo instalarlos y continuar

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
     GESTION DE ACHIVOS
    --------------------
    1. Mover
    2. Copiar
    3. Eliminar
    4. Comprimir
    5. Descomprimir
    0. Salir

__menu__

    #Leer opción
    read -p "Selecciona acción>" accion

    #Ejecutar orden seleccionada
    case $accion in
    1)
        while true; do
        echo "Introduce la ruta del directorio o archivo"
        read ruta
            if [ -d "$ruta" ]; then
                break
            else
                echo "El directorio o archivo especificado no existe"
            fi
        done
        echo "Introduce la ruta de destino"
        read input
        ruta2=$input
        sudo mv $ruta $ruta2 && echo "¡$ruta movido con éxito a $ruta2!" || echo "Ha habido un error"

        echo "Volviendo..."
        sleep 3
    ;;
    2)
        while true; do
        echo "Introduce la ruta del directorio o archivo"
        read input2
        origen=$input2
            if [ -d "$origen" ]; then
                break
            else
                echo "El directorio especificado no existe"
            fi
        done

        echo "Introduce la ruta de destino"
        read input
        destino=$input
        sudo cp $origen $destino && echo "¡$origen copiado con éxito a $ruta2!" || echo "Ha habido un error"

        echo "Volviendo..."
        sleep 3
        ;;
    3)
        while true; do
        echo "Introduce la ruta del directorio o archivo"
        read input2
        origen=$input2
            if [ -d "$origen" ]; then
                break
            else
                echo "El directorio especificado no existe"
            fi
        done

        while true; do
        echo "¿Estás seguro de que quieres eliminar $origen? [S/N]"
        read input
            if [ $input == "S" ] || [ $input == "s" ] ; then
                sudo rm -r $origen && echo "$origen eliminado con éxito" 
            else
                echo "Cancelando"
            fi
        done

        echo "Volviendo..."
        sleep 3
        ;;
    4)
        while true; do
        echo "Introduce la ruta del directorio"
        read ruta
            if [ -d "$ruta" ]; then
                break
            else
                echo "El directorio especificado no existe"
            fi
        done
        
        echo "Introduce un nombre para el archivo comprimido"
        read input
        archivo=$input
        zip -j $archivo.zip $ruta/* && echo "¡$archivo creado con éxito!" || echo "Ha habido un error en la compresión"

        echo "Volviendo..."
        sleep 3
        ;;
    5)  
        while true; do
        echo "Introduce la ruta del archivo"
        read ruta
            if [ -d "$ruta" ]; then
                break
            else
                echo "El archivo especificado no existe"
            fi
        done

        echo "Introduce la ruta de destino"
        read input
        destino=$input
        if [ $ruta == *.zip ] ; then
            sudo unzip $ruta $destino && echo "¡$ruta descomprimido con éxito!" || echo "Ha habido un error"
            
        elif [ $ruta == *.tar.gz ] ; then
            sudo tar -zxvf $ruta $destino && echo "¡$ruta descomprimido con éxito!" || echo "Ha habido un error"

        elif [ $ruta == *.rar ] ; then
            sudo unrar $ruta $destino && echo "¡$ruta descomprimido con éxito!" || echo "Ha habido un error"
        fi
                
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