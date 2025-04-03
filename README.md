# Configuración Personalizada de `.bashrc`

Este repositorio contiene una configuración personalizada del archivo `.bashrc` para mejorar la experiencia en la terminal de Rocky Linux. Incluye alias, funciones, colores y ajustes avanzados para optimizar el manejo en consola y facilitar tareas comunes.

---

## **Características Principales**
- **Alias personalizados**: Atajos para comandos frecuentes como `rm`, `cp`, `mv`, `docker compose` (`dc`), entre otros.
- **Colores mejorados**: Configuración de colores para una experiencia visual más clara y atractiva.
- **Prompt personalizado**: Un prompt dinámico que muestra información útil como el usuario, host, directorio actual y estado del último comando.
- **Funciones útiles**: Scripts para mostrar información del sistema, buscar archivos rápidamente, y más.
- **Optimización del historial**: Ajustes para evitar duplicados y facilitar la navegación por comandos previos.

---

## **Instrucciones de Uso**

### 1. Modificar y Personalizar la Consola
Para editar el archivo `.bashrc` y personalizar tu consola:
```bash
nano $HOME/.bashrc
```

### 2. Aplicar Cambios Sin Reiniciar la Terminal
Después de realizar modificaciones en el archivo `.bashrc`, ejecuta:
```bash
source ~/.bashrc
```

### 3. Cambiar el Prompt de la Terminal
Si deseas un prompt más avanzado y atractivo, considera usar [Starship](https://starship.rs/guide/). Es una alternativa moderna y altamente personalizable.

---

## **Alias Incluidos**

| Comando | Descripción                                    |
|---------|------------------------------------------------|
| `rm`    | Solicita confirmación antes de eliminar archivos. |
| `cp`    | Solicita confirmación antes de copiar archivos. |
| `mv`    | Solicita confirmación antes de mover archivos. |
| `dc`    | Alias para `docker compose`.                   |
| `ll`    | Listado en formato árbol con detalles.         |
| `la`    | Lista archivos incluyendo ocultos.            |
| `ls`    | Lista todos los archivos con colores.          |
| `grep`  | Resalta coincidencias en búsquedas.            |
| `..`    | Subir un nivel en el directorio.               |
| `...`   | Subir dos niveles en el directorio.            |
| `update`| Comando rápido para actualizar paquetes.       |

---

## **Atajos Útiles en la Terminal**
- **Navegación por historial**:
  - Flecha arriba: Busca comandos previos.
  - Flecha abajo: Avanza en el historial.
- **Comandos rápidos**:
  - `h`: Muestra el historial completo.
  - `c`: Limpia la pantalla.
  - `mkdir`: Crea directorios sin errores si ya existen.

---

## **Funciones Personalizadas**
1. **Información del Sistema**:
   ```bash
   sysinfo
   ```
   Muestra detalles sobre CPU, RAM, espacio en disco y tiempo activo.

2. **Búsqueda Rápida de Archivos**:
   ```bash
   ff 
   ```
   Busca archivos que coincidan con un patrón.

3. **Cambio Rápido de Directorio**:
   ```bash
   g 
   ```
   Cambia al directorio especificado.

---

## **Configuraciones Adicionales**
- **Historial Mejorado**:
  - Evita duplicados y borra entradas antiguas duplicadas.
  - Permite buscar comandos previos según coincidencias.

- **Colores Personalizados**:
  - Colores configurados para resaltar directorios, enlaces simbólicos, archivos ejecutables, entre otros.

- **Soporte Git**:
  - Alias para comandos comunes (`ga`, `gc`, `gp`, etc.).
  - Indicación visual de la rama activa en el prompt.

---

## **Recomendaciones**
1. Realiza una copia de seguridad del archivo original antes de modificarlo:
   ```bash
   cp ~/.bashrc ~/.bashrc.backup
   ```
2. Explora la documentación oficial de Rocky Linux o herramientas externas como Starship para personalizaciones avanzadas.
