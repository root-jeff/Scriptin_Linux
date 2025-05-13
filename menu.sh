#!/bin/bash

# AUTOINSTALADOR: Instala el script en PATH si aún no lo está
SCRIPT_NAME="menu"
TARGET_PATH="/usr/local/bin/$SCRIPT_NAME"
USER_PATH="$HOME/bin/$SCRIPT_NAME"

# Detectar si ya está en el PATH y no se ejecuta como menu
if [[ "$(basename "$0")" != "$SCRIPT_NAME" ]]; then
  if ! command -v $SCRIPT_NAME &> /dev/null; then
    echo "🛠️ Instalando '$SCRIPT_NAME' para acceso global..."

    if [ "$EUID" -eq 0 ]; then
      cp "$0" "$TARGET_PATH"
      chmod +x "$TARGET_PATH"
      echo "✅ Instalado en $TARGET_PATH"
    else
      mkdir -p "$HOME/bin"
      cp "$0" "$USER_PATH"
      chmod +x "$USER_PATH"

	if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
	echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
	export PATH="$HOME/bin:$PATH"
	echo "📌 Se agregó ~/bin al PATH en .bashrc"
	source "$HOME/.bashrc"
	echo "🔄 Se recargó .bashrc para aplicar los cambios"
	fi

      echo "✅ Instalado en $USER_PATH"
    fi

    echo "ℹ️ A partir de ahora puedes usar el script simplemente con el comando: $SCRIPT_NAME"
    echo "Presiona Enter para continuar..."
    read
  fi
fi

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

menu_interactivo() {
	while true; do
		clear 
		echo "----------------------------------------"
		echo " MENU INTERACTIVO LINUX "
		echo "----------------------------------------"
		echo "1. Mostrar contenido de un archivo"
		echo "2. Buscar texto en un archivo"
		echo "3. Ver las primeras líneas de un archivo"
		echo "4. Ver las últimas líneas de un archivo"
		echo "5. Comparar dos archivos"
		echo "6. Crear un archivo nuevo"
		echo "7. Salir"
		echo "----------------------------------------"
		read -p "Selecciona una opción: " opcion 

		case $opcion in 
			1) 
				read -p "Nombre del archivo a mostrar: " archivo
				cat "$archivo"
				read -p "Presiona Enter para continuar..." ;;
				
			2)
				read -p "Nombre del archivo: " archivo
				read -p "Texto a buscar: " texto
				grep "$texto" "$archivo"
				read -p "Presiona Enter para continuar..." ;;

			3) 
				read -p "Nombre del archivo: " archivo 
				read -p "¿Cuántas líneas quieres ver?: " num 
				head -n "$num" "$archivo"
				read -p "Presiona Enter para continuar..." ;;

			4) 	
				read -p "Nombre del archivo: " archivo 
				read -p "¿Cuántas líneas quieres ver?: " num 
				tail -n "$num" "$archivo" 
				read -p "Presiona Enter para continuar..." ;;

			5) 
				read -p "Nombre del primer archivo: " archivo1
				read -p "Nombre del segundo archivo: " archivo2
				diff "$archivo1" "$archivo2"
				read -p "Presiona Enter para continuar..." ;;

			6) 
				read -p "Nombre del nuevo archivo: " nuevo_archivo
				touch "$nuevo_archivo"
				echo "Archivo '$nuevo_archivo' creado exitosamente."
				read -p "Presiona Enter para continuar..." ;;

			7)
				echo "Saliendo del menú..."
				break ;;

			*)
				echo "Opción inválida, intenta de nuevo."
				read -p "Presiona Enter para continuar..." ;;
		esac
	done
}

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
    1) 
		echo "Opcion 1 - Busqueda de texto Tryshel Leiva"  
		menu_interactivo
		;;
    2) echo "Opcion 2" ;;
    3) echo "Opcion 3" ;;
    4) echo "Opcion 4" ;;
    5)
		echo -e "\n📌 Ejemplos de uso de expresiones regulares en Linux:\n"

		echo "1. Buscar líneas que comienzan con 'Error' en un archivo:"
		echo "   grep '^Error' archivo.log"
		echo ""

		echo "2. Buscar líneas que terminan con '.conf' en un archivo:"
		echo "   grep '\.conf$' archivo.txt"
		echo ""

		echo "3. Reemplazar números de teléfono por 'XXX-XXX-XXXX' en un archivo:"
		echo "   sed -E 's/[0-9]{3}-[0-9]{3}-[0-9]{4}/XXX-XXX-XXXX/g' archivo.txt"
		echo ""

		echo "4. Validar si una cadena es un número entero:"
		read -p '   Ingrese un número: ' numero
		if [[ $numero =~ ^[0-9]+$ ]]; then
			echo '   ✅ Es un número entero válido.'
		else
			echo '   ❌ No es un número entero válido.'
		fi
		echo ""

		echo "5. Validar formato de correo electrónico:"
		read -p '   Ingrese un correo electrónico: ' email
		if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
			echo '   ✅ Correo electrónico válido.'
		else
			echo '   ❌ Correo electrónico inválido.'
		fi
		echo ""
		;;
	6)
		echo -e "\n2.2 Comando: Built-in Function - Estudiante: Jefferson Palma"
		echo -e "\nDescripción:"
		echo "Las funciones built-in son comandos integrados en Bash que permiten automatizar tareas sin llamar procesos externos."

		read -p $'\nPresiona Enter para continuar con la demostración paso a paso...'

		echo -e "\n📌 Paso 1: Definir una función saludo personalizada"
		read -p "Ingrese su nombre: " nombre
		saludo() {
			echo "Hola $1, bienvenido al mundo Bash!"
		}
		saludo "$nombre"

		read -p $'\nPresiona Enter para declarar una variable de tipo entero...'
		read -p "¿Cuál es tu edad? " edad_usuario
		declare -i edad=$edad_usuario
		echo "Has declarado la edad como entero. Edad = $edad"

		read -p $'\nPresiona Enter para declarar una constante...'
		declare -r VERSION="v1.0"
		echo "Se ha declarado una constante: VERSION = $VERSION"

		read -p $'\n¿Quieres ver el tipo de la función saludo con el comando type? [s/n]: ' confirm_type
		if [[ "$confirm_type" =~ ^[sS]$ ]]; then
			type saludo
		fi
		read -p $'\n¿Te gustaria ver tambien el de la funcion de busqueda de texto (Opcion 1)? [s/n]: ' confirm_type
		if [[ "$confirm_type" =~ ^[sS]$ ]]; then
			type menu_interactivo
		fi

		read -p $'\nPresiona Enter para mostrar la información del sistema con uname...'
		uname -a

		read -p $'\n¿Deseas ejecutar un comando con eval (ls -l)? [s/n]: ' confirm_eval
		if [[ "$confirm_eval" =~ ^[sS]$ ]]; then
			comando="ls -l"
			eval $comando
		else
			echo "⏭️ Saltando eval..."
		fi

		read -p $'\nAhora vamos a ordenar frutas. Presiona Enter para continuar...'
		echo -e "manzana\npera\nbanana" > frutas.txt
		sort frutas.txt

		read -p $'\n¿Quieres contar las líneas del archivo frutas.txt? [s/n]: ' confirm_wc
		if [[ "$confirm_wc" =~ ^[sS]$ ]]; then
			wc -l frutas.txt
		else
			echo "⏭️ Saltando wc..."
		fi

		echo -e "\n7. Comentamos el uso de exec para evitar reemplazar el proceso del menu:"
		echo "# exec ls -l"
		echo "⚠️ El comando 'exec' reemplaza el script actual por otro proceso."
		echo "   Si ejecutáramos: exec ls -l"
		echo "   Entonces el menú dejaría de funcionar y solo verías el resultado de ls -l."

		read -p $'\n¿Quieres eliminar el archivo frutas.txt ahora? [s/n]: ' confirm_rm
		if [[ "$confirm_rm" =~ ^[sS]$ ]]; then
			rm frutas.txt
			echo "🧹 Archivo eliminado."
		else
			echo "📁 Archivo conservado como frutas.txt"
		fi
		;;
    0) echo "Saliendo..." ;;
    *) echo "Opcion no valida" ;;
	esac

	echo -e "\nPresiona Enter para continuar..."
	read
done
