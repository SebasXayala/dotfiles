# Atajos y comandos — snaplabs-arch

Guía rápida de uso de lo instalado. **Super** = tecla Windows.

> Los atajos de Hyprland marcados como *(por defecto)* vienen de la configuración generada. Para ver la lista real de tu archivo:
> `grep -n "hl.bind" ~/.config/hypr/hyprland.lua`

---

## 1. Hyprland — ventanas y escritorios

### Abrir y cerrar

| Atajo | Acción |
|---|---|
| Super + Q | Abrir terminal (kitty) |
| Super + R | Abrir lanzador de apps (hyprlauncher) |
| Super + E | Abrir explorador de archivos (Yazi) |
| Super + C | Cerrar la ventana activa *(por defecto)* |
| Super + M | **Salir de Hyprland** (cierra todo y vuelve al login) |

### Organizar ventanas *(por defecto)*

| Atajo | Acción |
|---|---|
| Super + flechas | Mover el foco a la ventana de esa dirección |
| Super + V | Alternar ventana flotante / en mosaico |
| Super + J | Cambiar la división (horizontal / vertical) |
| Super + P | Modo pseudo-mosaico |
| Super + clic izquierdo (arrastrar) | Mover ventana |
| Super + clic derecho (arrastrar) | Cambiar tamaño de ventana |

### Escritorios (workspaces) *(por defecto)*

| Atajo | Acción |
|---|---|
| Super + 1…0 | Ir al escritorio 1 a 10 |
| Super + Shift + 1…0 | Mover la ventana activa al escritorio 1 a 10 |
| Super + rueda del ratón | Pasar al escritorio anterior / siguiente |
| Super + S | Mostrar / ocultar el espacio especial ("magic") |

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
| Bloquear ahora | `loginctl lock-session` (o `hyprlock`) |
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

## 5. Lanzador y notificaciones

| Acción | Cómo |
|---|---|
| Abrir app | Super + R → escribir nombre → Enter (Esc para cancelar) |
| Cerrar notificación | Clic sobre ella |
| Cerrar todas | `makoctl dismiss -a` |
| Recuperar la última cerrada | `makoctl restore` |
| Enviar una de prueba | `notify-send "Título" "Mensaje"` |

---

## 6. Portapapeles y capturas por terminal

| Comando | Acción |
|---|---|
| `comando \| wl-copy` | Copiar la salida de un comando |
| `wl-copy < archivo.txt` | Copiar el contenido de un archivo |
| `wl-paste` | Mostrar lo que hay en el portapapeles |
| `wl-paste > archivo.png` | Guardar el portapapeles (por ejemplo, una captura) |
| `grim -g "$(slurp)" foto.png` | Capturar una zona a un archivo |
| `grim foto.png` | Capturar la pantalla completa |

---

## 7. Red, Bluetooth y audio

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

## 8. Paquetes (pacman y yay)

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

## 9. Snapshots y recuperación

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

## 10. Sistema, NVIDIA y firmware

| Comando | Para qué |
|---|---|
| `nvidia-smi` | Estado de la RTX 3050 (uso, temperatura, memoria) |
| `uname -r` | Kernel en uso |
| `systemctl status <servicio>` | Estado de un servicio |
| `journalctl -b -p err` | Errores del arranque actual |
| `sudo ufw status verbose` | Estado del firewall |
| `fwupdmgr refresh && fwupdmgr get-updates` | Buscar actualizaciones de firmware |

---

## 11. neovim (lo mínimo)

| Tecla | Acción |
|---|---|
| i | Entrar en modo escritura |
| Esc | Volver al modo normal |
| `:w` / `:q` / `:wq` | Guardar / salir / guardar y salir |
| `:q!` | Salir **sin** guardar |
| `"+y` / `"+p` | Copiar / pegar con el portapapeles del sistema |
| u / Ctrl + R | Deshacer / rehacer |
| `/texto` | Buscar |
