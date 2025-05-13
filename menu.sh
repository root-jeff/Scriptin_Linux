#!/bin/bash

case "$1" in
	-h|--help)
		echo "Menu de opciones Grupo #5"
		echo "Uso: ./menu.sh [opción]"
		echo ""
	        echo "Opciones:"
        	echo "  -h, --help       Muestra esta ayuda."
	        echo "  -V, --version    Muestra la versión del script."
	        echo ""
	        echo "Este script presenta un menú interactivo con comandos comunes de Linux."
	        exit 0
        	;;
	-V|--version)
        	echo "menu.sh - versión 1.0"
	        exit 0
	        ;;
esac

opcion=1
while [ "$opcion" != "0" ]; do
	clear
	echo "MENU SCRIPT V.1"
	echo "1. Busqueda de texto"
	echo "2. Busqueda de archivos FIND"
	echo "3. Redirecciones y Salidas"
	echo "4. Uso de Joins"
	echo "5. Expresiones regulares"
	echo "6. Funciones built-in y comandos comunes"
	echo "0. Salir"
	echo -n "Escoger opción: "
	read opcion

	case $opcion in
		1) echo "Opcion 1" ;;
		2) echo "Opcion 2" ;;
		3) echo "Opcion 3" ;;
		4) echo "Opcion 4" ;;
		5) echo "Opcion 5" ;;
		6)
			echo -e "\n Ejemplo de funciones built-int y comando comunes:\n"

			saludo() {
				echo "Hola $1, bienvenido al mundo Bash!"
			}

			declare -i edad=20
			declare -r VERSO="v1.0"

			echo "Informacion del sistema:"
			uname -a
			echo

			saludo "Usuario"

			echo "La edad declarada es: $edad"
			type saludo

			echo -e "\nOrdenando frutas:"
			echo -e "manzana\npera\nbanana" > frutas.txt
			sort frutas.txt

			echo -e "\nLineas del archivo:"
			wc -l frutas.txt

			echo -e "\n Ejecutando eval:"
			comando="ls -l"
			eval $comando

			echo -e "\nBorrando archivo frutas.txt"
			rm frutas.txt
			;;
		0) echo "Saliendo..." ;;
		*) echo "Opcion no valida" ;;
	esac

	echo -e "\nPresiona Enter para continuar..."
	read

done

