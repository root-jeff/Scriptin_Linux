
# 💻 Proyecto Bash – Grupo 5

## 📝 Introducción

Este proyecto tiene como objetivo aplicar comandos esenciales de Linux mediante un script interactivo en Bash. Cada opción del menú está pensada para abordar conceptos clave usados en administración de sistemas y servidores. Cada integrante del grupo explica y demuestra comandos específicos con ejemplos prácticos.

Se busca fomentar el **trabajo colaborativo**, fortalecer el uso de **herramientas de línea de comandos** y promover la creación de scripts reutilizables para tareas comunes en entornos Unix/Linux.

---

## 📋 Menú del Script

```bash
MENU SCRIPT V.1 – GRUPO 5
1. Búsqueda de texto y comparación de archivos  
2. Búsqueda avanzada de archivos con FIND y XARGS  
3. Redirecciones, salidas estándar y comando tee  
4. Uso de joins y reemplazo de texto con SED  
5. Expresiones regulares en comandos Linux  
6. Funciones built-in y comandos comunes  
0. Salir
```

---

## ✅ Desarrollo por opciones

### 2.2 Comando: Built-in Function  
**Estudiante:** Jefferson Palma

**Descripción:**  
Las funciones `built-in` de Bash son comandos internos del shell que no requieren archivos externos ejecutables. Son rápidas y permiten automatizar tareas reutilizables como saludos, comprobaciones o ejecuciones simples.

**Parámetros importantes:**
- `declare`: define variables como enteras (`-i`) o de solo lectura (`-r`).
- `type`: indica si un comando es built-in o externo.
- `eval`: ejecuta comandos contenidos en una variable.
- `exec`: reemplaza el proceso actual por otro.
- `sort`, `wc`, `uname -a`: comandos útiles en scripts.

**Ejemplo de uso:**

```bash
# Definimos una función
saludo() {
  echo "Hola $1, bienvenido al mundo Bash!"
}

# Declaraciones
declare -i edad=20
declare -r VERSION="v1.0"

# Consultar tipo
type saludo

# Información del sistema
uname -a

# Ejecutar comandos con eval
comando="ls -l"
eval $comando

# Procesar archivos temporales
echo -e "manzana\npera\nbanana" > frutas.txt
sort frutas.txt
wc -l frutas.txt

# Limpieza
rm frutas.txt
```

**Utilidad en servidores:**  
Ideal para automatizar tareas administrativas sin depender de binarios externos. Acelera tareas repetitivas como monitoreo, ordenamiento de archivos, ejecución de comandos condicionales, entre otros.

---

_Repositorio mantenido por el Grupo 5 – Sistemas Operativos Linux_
