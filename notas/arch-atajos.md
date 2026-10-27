# Atajos y comandos — snaplabs-arch

Guía rápida de uso de lo instalado. **Super** = tecla Windows.

> Los atajos de Hyprland marcados como *(por defecto)* vienen de la configuración generada. Para ver la lista real de tu archivo:
> `grep -n "hl.bind" ~/.config/hypr/hyprland.lua`

---

## 1. Hyprland — ventanas y escritorios

### Abrir y cerrar (personalizados, estilo dotfiles populares)

| Atajo | Acción |
|---|---|
| **Super + T** | Abrir terminal (kitty) |
| **Super + Q** | **Cerrar la ventana activa** |
| Super + R | Abrir lanzador de apps (hyprlauncher) |
| Super + E | Abrir explorador de archivos (Yazi) |
| **Super + F** | Maximizar (llena la pantalla, conserva Waybar y la interfaz de la app) |
| **Super + Shift + F** | Pantalla completa real (videos, juegos; oculta pestañas del navegador) |
| **Super + W** | Siguiente fondo de pantalla (carpeta `~/Pictures/Wallpapers`) |
| **Super + L** | Bloquear pantalla |
| Super + M | **Salir de Hyprland** (cierra todo y vuelve al login) |

### Organizar ventanas

| Atajo | Acción |
|---|---|
| Super + flechas | Mover el foco a la ventana de esa dirección |
| **Super + Shift + flechas** | **Mover la ventana** (intercambia posición; en el borde pasa a la otra pantalla) |
| **Super + Ctrl + flechas** | **Cambiar el tamaño** (mantén pulsado para seguir) |
| Super + V | Alternar ventana flotante / en mosaico |
| Super + J | Cambiar la división (horizontal / vertical) *(por defecto)* |
| Super + P | Modo pseudo-mosaico *(por defecto)* |
| Super + clic izquierdo (arrastrar) | Mover ventana con el ratón |
| Super + clic derecho (arrastrar) | Cambiar tamaño con el ratón |

### Escritorios (workspaces) *(por defecto)*

| Atajo | Acción |
|---|---|
| Super + 1…0 | Ir al escritorio 1 a 10 |
| Super + Shift + 1…0 | Mover la ventana activa al escritorio 1 a 10 |
| Super + rueda del ratón | Pasar al escritorio anterior / siguiente |
| Super + S | Mostrar / ocultar el espacio especial ("magic") |

### Monitores

| Pantalla | Posición | Modo |
|---|---|---|
| HDMI-A-1 (monitor de mesa) | Izquierda (0×0) | 1920×1080 @ 100 Hz, escala 1 |
| eDP-1 (portátil) | Derecha (1920×0) | 1920×1080 @ 144 Hz, escala 1.2 (espacio útil 1600×900) |

El cursor pasa al portátil por el borde **derecho** del monitor de mesa. Ver: `hyprctl monitors`.

Escalas válidas en 1920×1080 (dan números enteros): 1 · 1.2 · 1.25 · 1.5 · 1.6 · 2.

### Capturas de pantalla (personalizados)

| Atajo | Acción |
|---|---|
| **Super + Shift + S** | Seleccionar zona → copiada al portapapeles |
| Impr Pant | Seleccionar zona → copiada al portapapeles |
| Shift + Impr Pant | Pantalla completa → guardada en `~/Pictures/Screenshots` |

### Teclas de función del portátil

| Tecla | Acción |
|---|---|
| Volumen + / − / silencio | Subir, bajar, silenciar (`wpctl`) |
| Silenciar micrófono | Silencia el micrófono |
| Brillo + / − | Brillo de la pantalla del portátil (`brightnessctl`) |
| Play / Siguiente / Anterior | Control multimedia (`playerctl`) |

### Iniciar y emergencias

| Acción | Cómo |
|---|---|
| Iniciar Hyprland tras el login | `start-hyprland` |
| Terminal de rescate (fuera de Hyprland) | **Ctrl + Alt + F2** · volver: **Ctrl + Alt + F1** |
| Recargar la configuración | `hyprctl reload` |
| Editar la configuración | `nvim ~/.config/hypr/hyprland.lua` |

---

## 2. Bloqueo e inactividad (hyprlock + hypridle)

| Acción | Cómo |
|---|---|
| Bloquear ahora | **Super + L** o `loginctl lock-session` |
| Desbloquear | Escribir tu contraseña + Enter |
| Suspender | `systemctl suspend` (bloquea antes de dormir) |

**Automático:** 2,5 min atenúa · 5 min bloquea · 5,5 min apaga pantalla · 30 min suspende.
Tiempos en `~/.config/hypr/hypridle.conf`.

---

## 3. kitty (terminal)

| Atajo | Acción |
|---|---|
| Ctrl + Shift + C / V | Copiar / pegar |
| Ctrl + Shift + T | Nueva pestaña |
| Ctrl + Shift + Q | Cerrar pestaña |
| Ctrl + Shift + → / ← | Pestaña siguiente / anterior |
| Ctrl + Shift + Enter | Nueva ventana dividida dentro de kitty |
| Ctrl + Shift + W | Cerrar esa ventana de kitty |
| Ctrl + Shift + = / − | Agrandar / reducir texto |
| Ctrl + Shift + Retroceso | Tamaño de texto original |
| Ctrl + Shift + ↑ / ↓ | Desplazarse una línea |
| Ctrl + Shift + H | Ver todo el historial de la terminal |
| Ctrl + Shift + F2 | Editar configuración de kitty |
| Ctrl + D o `exit` | Cerrar la terminal |
| Ctrl + Shift + A → M / L / 1 | Más / menos transparencia / opaco (solo esa ventana, temporal) |
| Ctrl + Shift + F5 | Recargar la configuración de kitty |

**Configuración:** fuente JetBrains Mono Nerd Font 11 · transparencia 0.90 · márgenes 12 · cursor línea · pestañas abajo · shell zsh.

---

## 3b. zsh, Starship y herramientas

**Prompt (Starship):** `⬢ snaplabs` › carpeta › rama y cambios de git › Python/Node › tiempo del comando (si pasa de 2 s). La flecha `❯` se pone **roja** si el último comando falló. Configuración: `~/.config/starship.toml`.

**fastfetch al abrir:** logo SnapLabs + ficha del equipo. Configuración: `~/.config/fastfetch/config.jsonc` y `logo.txt`. Verlo de nuevo: `ff`.


| Atajo / comando | Acción |
|---|---|
| → (flecha derecha) | Aceptar la sugerencia gris del historial |
| Ctrl + R | Buscar en el historial (fzf) |
| Ctrl + T | Buscar un archivo e insertarlo en el comando (fzf) |
| Tab | Autocompletar con menú (flechas para elegir) |
| Ctrl + → / ← | Saltar palabra |
| `z <parte del nombre>` | Ir a una carpeta frecuente (zoxide), p. ej. `z wall` |
| `ls` · `ll` · `tree` | Listar con íconos · detallado con git · árbol (eza) |
| `cat <archivo>` | Ver archivo con colores (bat) |
| `ff` | fastfetch |

> Rojo al escribir = el comando no existe. Configuración en `~/.zshrc`.

---

## 4. Yazi (explorador de archivos)

| Tecla | Acción |
|---|---|
| ← ↓ ↑ → o h j k l | Moverse (izquierda = carpeta padre, derecha = entrar) |
| Enter u o | Abrir archivo |
| gg / G | Ir al principio / final de la lista |
| Espacio | Seleccionar / deseleccionar |
| v | Modo selección múltiple (visual) |
| y | Copiar |
| x | Cortar |
| p | Pegar |
| d | Mover a la papelera |
| D | Borrar **definitivamente** |
| a | Crear archivo (termina en `/` para crear carpeta) |
| r | Renombrar |
| . | Mostrar / ocultar archivos ocultos |
| s | Buscar archivos por nombre (fd) |
| S | Buscar texto dentro de archivos (ripgrep) |
| z | Saltar a una carpeta frecuente (zoxide) |
| Z | Buscar y saltar con fzf |
| t | Nueva pestaña · 1…9 cambiar de pestaña |
| ~ o F1 | **Ayuda con todos los atajos** |
| q | Salir |

---

## 5. Waybar (barra superior)

| Acción | Cómo |
|---|---|
| Ver fecha completa | Clic en la hora |
| Ventiladores al máximo / automático | Clic en 󰈐 (rojo = máximo) |
| Cambiar perfil de energía | Clic en el ícono de perfil (verde ahorro · azul equilibrado · rojo rendimiento) |
| Menú apagar / reiniciar / bloquear | Clic en ⏻ (wlogout) |
| Bluetooth | Clic en el ícono → `bluetoothctl` |
| Detalles de RAM, GPU, ventiladores, batería | Pasar el ratón por encima |
| Ver calendario | Pasar el ratón sobre la hora |
| Abrir menú de Wi-Fi (nmtui) | Clic en la red |
| Silenciar / activar sonido | Clic en el volumen |
| Cambiar de escritorio | Clic en el número |
| Recargar estilo | `pkill -SIGUSR2 waybar` |
| Reiniciar la barra | `pkill waybar; nohup waybar >/dev/null 2>&1 &` |
| Quitar un módulo | Borrar su nombre de `modules-left/center/right` en `config.jsonc` y reiniciar la barra |

Orden: escritorios · ventana activa · hora · CPU · RAM · temperatura · GPU · ventiladores · bandeja · Bluetooth · brillo · volumen · red · perfil · batería · apagado.

> El módulo de GPU mantiene despierta la RTX: en batería conviene quitarlo o subir su `interval`.

---

## 6. Lanzador y notificaciones

| Acción | Cómo |
|---|---|
| Abrir app | Super + R → escribir nombre → Enter (Esc para cancelar) |
| Cerrar notificación | Clic sobre ella |
| Cerrar todas | `makoctl dismiss -a` |
| Recuperar la última cerrada | `makoctl restore` |
| Enviar una de prueba | `notify-send "Título" "Mensaje"` |
| Duración | `default-timeout` en `~/.config/mako/config.base` (3000 = 3 s) |

---

## 7. Tema y colores (paleta central)

| Acción | Cómo |
|---|---|
| Cambiar colores y transparencias | Editar **`~/.config/theme/palette.sh`** (paleta actual: Nord) |
| Aplicar los cambios | `~/.config/theme/apply.sh` (regenera y recarga todo) |
| Estructura de kitty | `~/.config/kitty/kitty.conf` (debajo de la línea `include`) |
| Fondo de pantalla | Imágenes en `~/Pictures/Wallpapers` (nombres **sin espacios ni comas**) · Super + W rota · probar al momento: `hyprctl hyprpaper wallpaper "eDP-1,$HOME/Pictures/Wallpapers/x.jpg"` |
| Estructura de mako | `~/.config/mako/config.base` (**no** editar `config`) |
| Estructura de Waybar | `~/.config/waybar/config.jsonc` y `style.css` |
| Bordes, espacios, animaciones | `~/.config/hypr/hyprland.lua` |
| Abrir todas las configs en VS Code | `code ~/.config` |

> `~/.config/theme/generated/` se crea solo: no editar.

**Transparencias en `palette.sh`** (1.0 = sólido; números más bajos = más transparente):

| Variable | Controla | Valor actual |
|---|---|---|
| `OPACITY` | Terminal | 0.50 |
| `BAR_OPACITY` | Waybar | 0.45 |
| `WIN_OPACITY_ACTIVE` | Ventana con foco | 1.0 |
| `WIN_OPACITY_INACTIVE` | Ventanas sin foco | 0.60 |
| `BLUR` / `BLUR_SIZE` / `BLUR_PASSES` | Desenfoque detrás de lo transparente | true / 12 / 3 |

> Tras cambiar `OPACITY`, abre una terminal nueva (kitty solo la aplica al crear la ventana).

---

## 8. Dotfiles (configuración en git)

`dot` = `git` apuntando a `~/.dotfiles` (repo bare). Remoto: `github.com/SebasXayala/dotfiles` (privado).

| Comando | Acción |
|---|---|
| `dot status -sb` | Ver si estás al día con GitHub (`ahead N` = commits sin subir) y qué cambió |
| `dot diff` | Ver exactamente qué líneas cambiaron |
| `dot add <archivo>` | Añadir un archivo nuevo o cambiado |
| `dot commit -m "mensaje"` | Guardar el cambio |
| `dot push` | Subir a GitHub |
| `dot --no-pager log --oneline -6` | Últimos commits |
| `dot checkout -- <archivo>` | Descartar cambios y volver a la última versión guardada |
| `ssh -T git@github.com` | Probar la conexión SSH con GitHub |

> Nunca añadir `~/.ssh` ni archivos con contraseñas o tokens. Para proyectos normales se usa `git`, no `dot`.
> Ignorados (se generan solos): `theme/generated/` y `mako/config`, en `~/.dotfiles/info/exclude`.
> `hyprpaper.conf` cambia con cada Super + W: súbelo cuando quieras guardar el fondo actual.

---

## 9. Portapapeles y capturas por terminal

| Comando | Acción |
|---|---|
| `comando \| wl-copy` | Copiar la salida de un comando |
| `wl-copy < archivo.txt` | Copiar el contenido de un archivo |
| `wl-paste` | Mostrar lo que hay en el portapapeles |
| `wl-paste > archivo.png` | Guardar el portapapeles (por ejemplo, una captura) |
| `grim -g "$(slurp)" foto.png` | Capturar una zona a un archivo |
| `grim foto.png` | Capturar la pantalla completa |

---

## 10. Red, Bluetooth y audio

| Comando | Acción |
|---|---|
| `nmtui` | Menú para conectar Wi-Fi |
| `nmcli device wifi list` | Ver redes disponibles |
| `nmcli device status` | Estado de las conexiones |
| `bluetoothctl` | Consola Bluetooth: `power on`, `scan on`, `pair <MAC>`, `connect <MAC>` |
| `wpctl status` | Ver dispositivos de audio |
| `wpctl set-default <ID>` | Cambiar la salida de audio |
| `powerprofilesctl list` / `set balanced` | Ver / cambiar perfil de energía |

---

## 11. Paquetes (pacman y yay)

| Comando | Acción |
|---|---|
| `yay -Syu` | **Actualizar todo** (oficial + AUR). Hacerlo 1–2 veces por semana |
| `sudo pacman -S <paquete>` | Instalar desde repos oficiales |
| `yay -S <paquete>` | Instalar desde el AUR |
| `pacman -Ss <texto>` / `yay -Ss <texto>` | Buscar paquetes |
| `sudo pacman -Rns <paquete>` | Desinstalar con dependencias no usadas |
| `checkupdates` | Ver actualizaciones disponibles sin instalar |
| `paccache -dv` | Ver cuánta caché se puede limpiar |
| `pacdiff` | Revisar archivos `.pacnew` tras actualizar |

---

## 12. Snapshots y recuperación

| Comando / acción | Para qué |
|---|---|
| `sudo snapper list` | Ver snapshots |
| `sudo snapper -c root create -d "Descripción"` | Crear un punto de retorno manual |
| `sudo snapper -c root delete <número>` | Borrar una snapshot |
| GRUB → **Arch Linux snapshots** | Arrancar desde una snapshot (cambios temporales) |
| GRUB → **Advanced options** | Arrancar con el kernel LTS de respaldo |
| `findmnt /` | Saber si estás en el sistema real (`[/@]`) o en una snapshot (`overlay`) |

> Cada `pacman` / `yay` crea automáticamente snapshots "pre" y "post".

---

## 13. Sistema, NVIDIA y firmware

| Comando | Para qué |
|---|---|
| `nvidia-smi` | Estado de la RTX 3050 (uso, temperatura, memoria) |
| `uname -r` | Kernel en uso |
| `systemctl status <servicio>` | Estado de un servicio |
| `journalctl -b -p err` | Errores del arranque actual |
| `sudo ufw status verbose` | Estado del firewall |
| `fwupdmgr refresh && fwupdmgr get-updates` | Buscar actualizaciones de firmware |
| `cat /sys/firmware/acpi/platform_profile` | Perfil térmico actual |
| `cat /sys/devices/platform/hp-wmi/hwmon/hwmon*/fan{1,2}_input` | RPM de los ventiladores |
| `echo 0 \| sudo tee /sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable` | Ventiladores al máximo (`2` = automático) |

---

## 14. neovim (lo mínimo)

| Tecla | Acción |
|---|---|
| i | Entrar en modo escritura |
| Esc | Volver al modo normal |
| `:w` / `:q` / `:wq` | Guardar / salir / guardar y salir |
| `:q!` | Salir **sin** guardar |
| `"+y` / `"+p` | Copiar / pegar con el portapapeles del sistema |
| u / Ctrl + R | Deshacer / rehacer |
| `/texto` | Buscar |
