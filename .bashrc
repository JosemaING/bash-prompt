# .bashrc

# Exit early for non-interactive shells (e.g., scp, rsync) to avoid errors.
case $- in
    *i*) ;;
    *) return ;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dc='docker compose'
#alias trivyinstall='/root/docker.ubi9/trivyinstall.sh'

# Definición de colores (legibles y reutilizables)
rojo='\[\e[1;31m\]'
verde='\[\e[1;32m\]'
amarillo='\[\e[1;33m\]'
azul='\[\e[1;34m\]'
magenta='\[\e[1;35m\]'
blanco='\[\e[1;37m\]'
reset='\[\e[0m\]'

# Función para colores condicionales de éxito/error
color_comando() {
    if [ $? -eq 0 ]; then
        echo -n "$verde"
    else
        echo -n "$rojo"
    fi
}

# Mensaje de bienvenida
welcome_message() {
    printf "\n\033[1;34mBienvenido a la terminal, \033[1;32m$USER\033[0m!\n"
    printf "\033[1;36mFecha:\033[0m \033[1;33m$(date '+%A, %d %B %Y, %H:%M:%S')\033[0m\n"
    printf "\033[1;36mSistema:\033[0m \033[1;33m$(uname -srmo)\033[0m\n"
    printf "\n\033[1;32m¡Que tengas una gran sesión de terminal!\033[0m\n\n"
}
welcome_message

# Alias comunes
alias ll='tree -a -C -h -L 3 --dirsfirst --filelimit 50'   # Listado en formato arbol
alias la='ls -lAh --color=auto'                   # Incluye archivos ocultos
alias ls='ls -lsa --color=auto'                   # Lista todos los archivos con color
alias grep='grep --color=auto'                    # Resalta resultados de grep
alias ..='cd ..'                                  # Subir un nivel de directorio
alias ...='cd ../..'                              # Subir dos niveles
alias update='sudo dnf update && sudo dnf upgrade' # Actualización rápida en Debian/Ubuntu

# Prompt personalizado y atractivo
#export PS1="\[\e[1;32m\][\[\e[m\]\[\e[1;31m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;34m\]\h\[\e[m\] \[\e[1;37m\](\[\e[36m\]\w\[\e[1;37m\])\[\e[m\]\[\e[1;32m\]]\[\e[m\]\n\$ "

export PS1="\$(codigo=\$?; color=\$(if [ \$codigo -eq 0 ]; then echo -n \"$verde\"; else echo -n \"$rojo\"; fi); echo -n \"\$color┌──$reset[$rojo\u$amarillo@$magenta\h$reset]$azul─[\w$magenta\$(parse_git_branch)$azul]\n\$color└─$reset\$ \")"



# Colores para mejorar la experiencia visual en la terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LS_COLORS="di=1;34:fi=0;37:ln=1;36:pi=1;33:so=1;35:bd=1;33:cd=1;33:or=1;31:mi=1;31:ex=1;32"

# Opciones útiles para el historial
HISTSIZE=1000                        # Número de comandos guardados en la sesión actual
HISTFILESIZE=2000                    # Número total de comandos guardados en el archivo de historial
HISTCONTROL=ignoredups:erasedups     # Evita duplicados y borra duplicados antiguos
shopt -s histappend                  # Añade al historial sin sobrescribir

# Opciones avanzadas de búsqueda y autocompletado
bind '"\e[A": history-search-backward'  # Usa las teclas de flecha para navegar el historial según coincidencia
bind '"\e[B": history-search-forward'

# Alias para una navegación mejorada
alias h='history'                    # Muestra el historial de comandos
alias c='clear'                      # Limpia la pantalla
alias mkdir='mkdir -p'               # Crea directorios sin error si ya existen
alias rm='rm -i'                     # Solicita confirmación antes de borrar archivos

# Función para mostrar información del sistema
sys_info() {
    printf "\n\033[1;34mInformación del sistema:\033[0m\n"
    printf "\033[1;36mCPU:\033[0m \033[1;33m$(lscpu | grep 'Model name:' | sed 's/Model name:[ \t]*//')\033[0m\n"
    printf "\033[1;36mMemoria RAM:\033[0m \033[1;33m$(free -h | awk '/^Mem:/ {print $2}')\033[0m\n"
    printf "\033[1;36mEspacio en disco:\033[0m \033[1;33m$(df -h / | awk 'NR==2 {print $4}') libre en /\033[0m\n"
    printf "\033[1;36mUptime:\033[0m \033[1;33m$(uptime -p)\033[0m\n"
}
alias sysinfo='sys_info'

# Función para cambiar rápidamente a un directorio
goto() {
    if [[ -d "$1" ]]; then
        cd "$1" || return
        printf "\033[1;32mMovido a:\033[0m \033[1;33m$PWD\033[0m\n"
    else
        printf "\033[1;31mDirectorio no encontrado:\033[0m \033[1;33m$1\033[0m\n" >&2
    fi
}
alias g='goto'

# Función para buscar archivos rápidamente
fsearch() {
    if [[ -n "$1" ]]; then
        find . -iname "*$1*" 2>/dev/null | grep --color=always "$1"
    else
        printf "\033[1;31mPor favor, proporciona un nombre de archivo o patrón de búsqueda.\033[0m\n" >&2
    fi
}
alias ff='fsearch'

# Configuración para Git si está instalado
parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p'
}

if command -v git &>/dev/null; then
    # Alias útiles para Git
    alias ga='git add'
    alias gc='git commit -m'
    alias gp='git push'
    alias gl='git log --oneline --graph --all --decorate'
fi

# Corrección ortográfica automática para cd
shopt -s cdspell

# Mejoras de rendimiento para navegación y opciones
shopt -s checkwinsize       # Ajusta el tamaño de la ventana al redimensionar
shopt -s globstar           # Permite ** en globs para búsquedas recursivas

# Configuración personalizada para Vim
export VISUAL=vim
export EDITOR="$VISUAL"

# Función para traer solo archivos faltantes de la rama remota
fetch_missing_files() {
  # Traer cambios remotos sin fusionarlos
  git fetch origin

  # Encontrar archivos añadidos en la rama remota que no existen localmente
  missing_files=$(git diff --name-only origin/master --diff-filter=A)

  # Descargar los archivos faltantes
  if [ -n "$missing_files" ]; then
    echo "Trayendo archivos faltantes..."
    git checkout origin/master -- $missing_files
    echo "Archivos faltantes descargados."
  else
    echo "No hay archivos faltantes."
  fi
}
