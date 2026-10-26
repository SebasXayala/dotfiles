# Arch Linux — snaplabs-arch

Registro de lo instalado y configurado, agrupado por función.
Equipo: HP Victus 15-fb0xxx · Ryzen 5 5600H · RTX 3050 Laptop 4 GB · 16 GB RAM · NVMe 512 GB · BIOS F.24 (placa 8A3D)

> **Origen:** `oficial` = repos de Arch (pacman) · `AUR` = comunidad (yay) · `archinstall` = lo puso el instalador
> **Tipo:** `elegido` = lo pedimos nosotros · `dependencia` = lo necesita otro paquete

---

## 1. Kernel y arranque

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| linux | Kernel principal (por defecto en GRUB) | archinstall | elegido |
| linux-lts | Kernel de respaldo (Advanced options) | archinstall | elegido |
| linux-firmware | Firmware de Wi-Fi, Bluetooth, GPU, etc. | archinstall | elegido |
| amd-ucode | Microcódigo del procesador AMD | archinstall | dependencia |
| grub | Gestor de arranque | archinstall | elegido |
| efibootmgr | Administrar entradas de arranque de la BIOS | archinstall | dependencia |

## 2. Sistema de archivos y snapshots (red de seguridad)

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| btrfs-progs | Herramientas de Btrfs | archinstall | dependencia |
| snapper | Crear y gestionar snapshots | archinstall | elegido |
| snap-pac | Snapshot automática antes/después de cada pacman | oficial | elegido |
| grub-btrfs | Snapshots en el menú de GRUB | archinstall | elegido |

## 3. Red, audio, Bluetooth y energía

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| networkmanager | Red por cable y Wi-Fi (`nmtui`, `nmcli`) | archinstall | elegido |
| pipewire | Servidor de audio | archinstall | elegido |
| wireplumber | Gestor de sesiones de PipeWire (`wpctl`) | archinstall | dependencia |
| pipewire-pulse / pipewire-alsa / pipewire-jack | Compatibilidad con apps de PulseAudio, ALSA y JACK | archinstall | dependencia |
| bluez / bluez-utils | Bluetooth (`bluetoothctl`) | archinstall | elegido |
| power-profiles-daemon | Perfiles de batería/rendimiento | archinstall | elegido |

## 4. Seguridad y permisos

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| sudo | Ejecutar como administrador | archinstall | elegido |
| ufw | Firewall (bloquea entrante, permite saliente) | archinstall | elegido |
| hyprpolkitagent | Ventana de contraseña para apps gráficas | oficial | elegido |
| hyprlock | Pantalla de bloqueo | oficial | elegido |
| hypridle | Bloqueo, apagado de pantalla y suspensión por inactividad | oficial | elegido |

## 5. Gráficos NVIDIA

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| nvidia-open-dkms | Driver NVIDIA 615.78 (compilado para ambos kernels) | oficial | elegido |
| nvidia-utils | Librerías del driver, `nvidia-smi` | oficial | dependencia |
| lib32-nvidia-utils | Soporte 32 bits (Steam/juegos) | oficial (multilib) | elegido |
| linux-headers | Necesario para compilar el driver en `linux` | oficial | elegido |
| linux-lts-headers | Necesario para compilar el driver en `linux-lts` | oficial | elegido |
| dkms | Recompila el driver al actualizar el kernel | oficial | dependencia |

## 6. Escritorio (Hyprland)

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| hyprland | Gestor de ventanas | oficial | elegido |
| xdg-desktop-portal-hyprland | Compartir pantalla, capturas desde apps | oficial | elegido |
| xdg-desktop-portal-gtk | Ventanas de "Abrir / Guardar archivo" | oficial | elegido |
| kitty | Terminal (Super + T) | oficial | elegido |
| hyprlauncher | Lanzador de apps (Super + R) | oficial | elegido |
| waybar | Barra superior (escritorios, hora, batería, red, volumen) | oficial | elegido |
| wlogout | Menú de apagado / reinicio / bloqueo (botón ⏻ de Waybar) | AUR | elegido |
| mako | Notificaciones | oficial | elegido |
| libnotify | Comando `notify-send` | oficial | elegido |
| noto-fonts | Fuente base para el texto | oficial | elegido |
| ttf-jetbrains-mono-nerd | Fuente de kitty (JetBrains Mono Nerd Font, con ligaduras e íconos) | oficial | elegido |
| hyprpaper | Fondo de pantalla (Super + W rota las imágenes) | oficial | elegido |
| ttf-nerd-fonts-symbols | Íconos en terminal y Yazi | oficial | elegido |
| brightnessctl | Teclas de brillo | oficial | elegido |
| playerctl | Teclas multimedia (play/pausa) | oficial | elegido |

## 7. Terminal: zsh y herramientas

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| zsh | Shell por defecto (`chsh` + `shell` en kitty.conf) | oficial | elegido |
| zsh-autosuggestions | Sugerencias en gris desde el historial (→ acepta) | oficial | elegido |
| zsh-syntax-highlighting | Comandos en verde/rojo según existan | oficial | elegido |
| zsh-completions | Más autocompletados | oficial | elegido |
| starship | Prompt (carpeta, rama de git, versión de Python/Node, tiempo) | oficial | elegido |
| eza | `ls` con íconos, colores y estado de git | oficial | elegido |
| bat | `cat` con resaltado de sintaxis | oficial | elegido |
| fastfetch | Logo y datos del equipo al abrir la terminal (`ff`) | oficial | elegido |

## 7b. Portapapeles y capturas

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| wl-clipboard | Portapapeles en terminal (`wl-copy`, `wl-paste`) | oficial | elegido |
| grim | Tomar capturas de pantalla | oficial | elegido |
| slurp | Seleccionar zona de pantalla | oficial | elegido |

## 8. Explorador de archivos: Yazi

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| yazi | Explorador en terminal (Super + E) | oficial | elegido |
| ffmpeg | Miniaturas de video | oficial | complemento de yazi |
| 7zip | Ver archivos comprimidos | oficial | complemento de yazi |
| jq | Vista previa de JSON | oficial | complemento de yazi |
| poppler | Vista previa de PDF | oficial | complemento de yazi |
| fd | Búsqueda de archivos | oficial | complemento de yazi (útil al programar) |
| ripgrep | Búsqueda de texto en archivos | oficial | complemento de yazi (útil al programar) |
| fzf | Búsqueda difusa | oficial | complemento de yazi |
| zoxide | Saltar rápido entre carpetas | oficial | complemento de yazi |
| imagemagick | Vista previa de más formatos de imagen | oficial | complemento de yazi |

## 9. Aplicaciones

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| firefox | Navegador | oficial | elegido |
| google-chrome | Navegador con sincronización de cuenta Google | AUR | elegido |
| discord | Chat y llamadas | oficial | elegido |
| visual-studio-code-bin | VS Code oficial de Microsoft (editor) | AUR | elegido |

## 10. Herramientas y mantenimiento

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| neovim | Editor de texto | archinstall | elegido |
| git | Control de versiones (yay, dotfiles) | oficial | elegido |
| openssh | Clave SSH para GitHub (`~/.ssh/id_ed25519`) | oficial | elegido |
| base-devel | Herramientas de compilación (requerido para AUR) | oficial | elegido |
| yay-bin | Ayudante para instalar desde el AUR | AUR | elegido |
| pacman-contrib | Limpieza de caché, `pactree`, `pacdiff`, `checkupdates` | oficial | elegido |
| fwupd | Actualizaciones de firmware (BIOS, SSD, cámara) | oficial | elegido |
| less | Paginador para `git log`, `dot log`, `git diff` | oficial | elegido |

## 11. Dependencias que trajo wlogout

Las de **compilación** (meson, ninja, scdoc, python-tqdm) y `wlogout-debug` ya se **borraron**. Estas se quedan porque wlogout las declara como dependencia:

| Paquete | Para qué | Origen | Tipo |
|---|---|---|---|
| gobject-introspection (+ runtime, libgirepository) | Herramientas de GTK que pide wlogout | oficial | dependencia de wlogout |
| python-setuptools, python-wheel, python-packaging, python-platformdirs, python-mako, python-markdown, python-markupsafe, python-more-itertools, python-autocommand, python-jaraco.* | Librerías Python que necesita gobject-introspection | oficial | dependencia |

---

## Servicios activados al arranque

**Sistema:** NetworkManager · bluetooth · power-profiles-daemon · ufw · fstrim.timer · grub-btrfsd · paccache.timer
**Al iniciar Hyprland** (`hl.on("hyprland.start")` en `hyprland.lua`): hyprpolkitagent · hypridle · mako · waybar · hyprpaper

## Cambios de configuración hechos a mano

| Archivo / lugar | Cambio |
|---|---|
| `/etc/mkinitcpio.conf` | `grub-btrfs-overlayfs` añadido al final de `HOOKS` (arrancar snapshots) |
| `/etc/default/grub` | `GRUB_TOP_LEVEL="/boot/vmlinuz-linux"` (kernel principal por defecto) |
| BIOS (efibootmgr) | Borradas entradas viejas Boot0000/0001/0002 (Windows, GRUB, Ubuntu). Quedan 0008 (disco) y 9999 (USB) |
| `~/.config/hypr/hyprland.lua` | Carga la paleta (`local theme = dofile(...)`) y la usa en los bordes · autoarranque de polkit, hypridle, mako, waybar y hyprpaper · `fileManager = "kitty -e yazi"` · `menu = "hyprlauncher"` · monitores (HDMI-A-1 izquierda 100 Hz, eDP-1 derecha 144 Hz escala 1.2) · atajos: Super+T terminal, Super+Q cerrar, Super+F maximizar, Super+Shift+F pantalla completa, Super+W siguiente fondo, Super+L bloquear, Super+Shift+flechas mover, Super+Ctrl+flechas tamaño, capturas (Print, Shift+Print, Super+Shift+S) · eliminado el atajo original Super+Shift+S (mover a espacio especial) |
| `~/.config/hypr/hyprlock.conf` | Copiado del ejemplo `/usr/share/hypr/hyprlock.conf` |
| `~/.config/hypr/hypridle.conf` | Copiado del ejemplo: atenuar 2,5 min · bloquear 5 min · apagar pantalla 5,5 min · suspender 30 min |
| `~/.config/theme/palette.sh` | **Paleta central** (base Catppuccin Mocha). El único archivo de colores que se edita |
| `~/.config/theme/apply.sh` | Genera `generated/` (Hyprland, Waybar, hyprlock, kitty) y `mako/config`; recarga todo |
| `~/.config/waybar/config.jsonc` · `style.css` | Módulos: escritorios, ventana activa, reloj, CPU, RAM, temperatura (k10temp), GPU, ventiladores, bandeja, Bluetooth, brillo, volumen, red, perfil de energía, batería y apagado (wlogout). El estilo importa `colors.css` de la paleta |
| `~/.config/waybar/scripts/gpu.sh` | Uso, temperatura y VRAM de la RTX 3050 (`nvidia-smi`) |
| `~/.config/waybar/scripts/fans.sh` | RPM de los ventiladores; clic alterna máximo (`pwm1_enable=0`) / automático (`2`) |
| `/etc/udev/rules.d/99-hp-fan.rules` | Permite al grupo `wheel` escribir `pwm1_enable` sin sudo. **Fuera de home: no está en dotfiles, recrear si reinstalas** |
| `~/.config/kitty/kitty.conf` | `include` de los colores · JetBrains Mono Nerd Font 11 · transparencia 0.90 · márgenes 12 · cursor línea · pestañas abajo (powerline) · sin pitido · copiar al seleccionar · `shell /usr/bin/zsh` |
| `~/.zshrc` | Historial, autocompletado, alias (`dot`, `ls`, `ll`, `tree`, `cat`, `ff`), zoxide, fzf, starship, plugins y fastfetch al abrir |
| `~/.config/hypr/hyprpaper.conf` | Fondo por pantalla; lo reescribe Super + W |
| `~/.config/hypr/scripts/wallpaper-next.sh` | Pasa a la siguiente imagen de `~/Pictures/Wallpapers` y la guarda |
| `~/.dotfiles/info/exclude` | Ignora en git `theme/generated/` y `mako/config` (se generan solos) |
| `~/.config/mako/config.base` | Estructura de mako (timeout 3000 ms); `config` se genera solo |
| `~/.bashrc` | Alias `dot` para los dotfiles |
| Git | `user.name SebasXayala`, rama por defecto `main`; dotfiles en `~/.dotfiles` → `github.com/SebasXayala/dotfiles` (privado) |
| Wi-Fi | Red guardada con `nmtui`; se conecta sola |

## Ventiladores y perfiles térmicos (hp-wmi)

El kernel ya soporta el Victus 15-fb0xxx (placa 8A3D).

| Qué | Dónde / valor |
|---|---|
| Perfiles térmicos | `/sys/firmware/acpi/platform_profile` → cool · quiet · balanced · performance (los cambia el botón de perfil de Waybar) |
| Modo ventiladores | `/sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable` → `0` máximo · `2` automático |
| RPM | `fan1_input` (CPU) · `fan2_input` (GPU) en la misma carpeta |
| Medidas | Automático en reposo ≈ 2700 / 2400 RPM · Máximo ≈ 5390 / 5208 RPM |

> Automático = el firmware ajusta según temperatura. El perfil cambia la agresividad, no fija el máximo.

## Snapshots manuales (puntos de retorno)

| Descripción | Estado del sistema |
|---|---|
| Instalacion limpia | Recién instalado, sin cambios |
| Base configurada | Snapper, firewall, TRIM, GRUB y EFI listos |
| Hyprland + NVIDIA + Chrome funcionando | Escritorio funcional |
| Yazi, launcher y Wi-Fi configurados | Explorador, launcher y Wi-Fi |
| Utilidades esenciales instaladas | Bloqueo, notificaciones, portapapeles, mantenimiento y capturas |
| Config Hyprland: monitores, capturas, autoarranque (config **home**) | Carpeta personal con la configuración de Hyprland |

> Comprueba cuáles creaste realmente con `sudo snapper list`.

## Pendiente (opcional)

- Luz del teclado en `hypridle.conf`: verificar el nombre con `brightnessctl -l | grep -i kbd`.
- `gnome-keyring`: guardar contraseñas de Chrome/Discord cifradas.
- `noto-fonts-emoji`: emojis en web y Discord (verificar si está con `pacman -Q noto-fonts-emoji`).
- fastfetch: elegir diseño (planeta, imagen, GIF o logo de Arch compacto).
- Starship: personalizar el prompt.
- Conectar hyprlock y la transparencia de kitty a la paleta.
- Agente SSH para no escribir la passphrase en cada `push`.
- Revisar huérfanos de vez en cuando: `pacman -Qdt` → borrar con `sudo pacman -Rns $(pacman -Qdtq)`.
- Que yay borre solas las dependencias de compilación: `yay --save --removemake`.
- Autoarranque de Hyprland al iniciar sesión (ahora sería en `~/.zprofile`, porque el shell es zsh).

---

## Comandos para revisar y depurar

| Comando | Qué muestra |
|---|---|
| `pacman -Qe` | Todo lo instalado explícitamente (lista real para comparar con este archivo) |
| `pacman -Qm` | Solo lo instalado desde el AUR |
| `pacman -Qdt` | Huérfanos: dependencias que ya nadie necesita |
| `pacman -Qi <paquete>` | Detalles, incluido "Required By" (quién lo necesita) |
| `pactree -r <paquete>` | Qué depende de ese paquete |
| `sudo pacman -Rns <paquete>` | Desinstalar con sus dependencias no usadas |
| `sudo snapper list` | Ver snapshots |
