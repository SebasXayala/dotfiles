# Mapa de configuración — snaplabs-arch

Guía rápida para saber **qué archivo controla qué**, qué sale de la paleta central y qué se edita a mano.
Pensada para poder orientarte sin ayuda.

---

## 1. La regla de oro

```
~/.config/theme/palette.sh   ← EDITAS aquí (colores y transparencias)
            │
            ▼
~/.config/theme/apply.sh     ← EJECUTAS esto (genera archivos y recarga todo)
            │
            ▼
generated/ · mako/config · starship.toml   ← se crean solos, NUNCA editarlos
```

- Cambiar un **color o una transparencia** → `palette.sh` y después `~/.config/theme/apply.sh`.
- Cambiar la **forma, el tamaño, los módulos o los atajos** de una herramienta → su propio archivo (tablas de abajo).
- Si editas un archivo generado, el próximo `apply.sh` **borra tu cambio**.

---

## 2. Qué controla la paleta (`palette.sh`)

### Colores

| Variable | Qué es | Dónde se nota |
|---|---|---|
| `BG` | Fondo principal | Barra, notificaciones, prompt, menú de apagado, bloqueo |
| `BG_ALT` | Fondo más oscuro | Terminal (zonas transparentes) |
| `SURFACE` · `SURFACE1` · `SURFACE2` | Superficies (tarjetas, cajas) | Cajitas de la Waybar, campo de contraseña, botones de wlogout, bloques del prompt |
| `OVERLAY` | Gris de detalles | Borde de ventanas sin foco, escritorios vacíos, notificaciones "low" |
| `FG` · `FG_DIM` | Texto normal / texto apagado | Todo el texto; fecha del bloqueo, cuerpo de notificaciones |
| `ACCENT` · `ACCENT2` | Color de marca (azul Nord) | Borde de ventana activa, logo ⬢, contraseña, hover de wlogout, prompt |
| `OK` · `WARN` · `URGENT` | Estados | Verde/amarillo/rojo: batería, contraseña comprobando/incorrecta, notificación crítica |
| `RED` `GREEN` `YELLOW` `BLUE` `PINK` `TEAL` | Colores sueltos | Terminal (colores ANSI), prompt (git, Python, error) |

### Transparencias y desenfoque (1.0 = sólido · más bajo = más transparente)

| Variable | Controla |
|---|---|
| `OPACITY` | Terminal kitty (abre una ventana nueva para verlo) |
| `BAR_OPACITY` | Waybar |
| `NOTIF_OPACITY` | Notificaciones (mako) |
| `WIN_OPACITY_ACTIVE` / `WIN_OPACITY_INACTIVE` | Ventanas con foco / sin foco |
| `BLUR` · `BLUR_SIZE` · `BLUR_PASSES` | Desenfoque detrás de todo lo transparente |

### Herramientas conectadas a la paleta

| Herramienta | Cómo recibe los colores | Archivo generado (no tocar) |
|---|---|---|
| Hyprland (bordes, opacidad, blur) | `dofile(...colors.lua)` en `hyprland.lua` | `theme/generated/colors.lua` |
| Waybar | `@import` en `style.css` | `theme/generated/colors.css` |
| wlogout (menú de apagado) | `@import` en su `style.css` | `theme/generated/colors.css` |
| hyprlock (bloqueo) | `source =` en `hyprlock.conf` | `theme/generated/colors.conf` |
| kitty | `include` en `kitty.conf` | `theme/generated/kitty-colors.conf` |
| mako (notificaciones) | `apply.sh` une colores + `config.base` | `mako/config` |
| Starship (prompt) | `apply.sh` une `starship.base.toml` + colores | `starship.toml` |
| fastfetch, Yazi, bat, eza, zsh | Usan los colores de la terminal | (heredan de kitty) |

### Lo que NO sale de la paleta (se edita en su archivo)

| Qué | Dónde |
|---|---|
| Color de la sombra de las ventanas | `hyprland.lua` → `decoration` → `shadow` (fijo `0xee1a1a1a`) |
| Transparencia del fondo y botones de wlogout | `wlogout/style.css` (`alpha(@bg, 0.55)`, `alpha(@surface, 0.85)`) |
| Desenfoque y brillo del fondo del bloqueo | `hyprlock.conf` → `background` (`blur_passes`, `brightness`) |
| Colores del logo de fastfetch | `fastfetch/config.jsonc` → `logo.color` (usa nombres ANSI: cyan, blue…) |
| Lanzador (hyprlauncher) | Sin tema propio todavía |
| VS Code, Chrome, Discord | Cada app por su cuenta (pendiente: tema Nord) |
| Íconos (WhiteSur) | Paquete `whitesur-icon-theme`; mako lo usa vía `icon-path` en `config.base` |

---

## 3. Mapa archivo por archivo

**Leyenda:** ✏️ editar a mano · ⚙️ generado (no tocar) · 🎨 recibe colores de la paleta · 📦 en dotfiles (GitHub)

### Tema central

| Archivo | Qué es | |
|---|---|---|
| `~/.config/theme/palette.sh` | **La paleta**: colores y transparencias de todo | ✏️ 📦 |
| `~/.config/theme/apply.sh` | Genera todo y recarga Hyprland, Waybar, kitty y mako | ✏️ 📦 |
| `~/.config/theme/generated/` | `colors.lua` · `colors.css` · `colors.conf` · `kitty-colors.conf` | ⚙️ |

### Escritorio (Hyprland y compañía)

| Archivo | Qué es | |
|---|---|---|
| `~/.config/hypr/hyprland.lua` | **Config principal**: monitores, atajos, autoarranque, bordes, animaciones, blur de capas, tapa del portátil | ✏️ 🎨 📦 |
| `~/.config/hypr/hyprlock.conf` | Diseño de la pantalla de bloqueo (hora, fecha, contraseña, ⬢ snaplabs) | ✏️ 🎨 📦 |
| `~/.config/hypr/hypridle.conf` | Tiempos: atenuar 2,5 min · bloquear 5 · apagar pantalla 5,5 · suspender 30 | ✏️ 📦 |
| `~/.config/hypr/hyprpaper.conf` | Fondo de cada pantalla (lo reescribe Super + W) | ⚙️/✏️ 📦 |
| `~/.config/hypr/scripts/wallpaper-next.sh` | Pasa al siguiente fondo de `~/Pictures/Wallpapers` | ✏️ 📦 |
| `~/.config/waybar/config.jsonc` | **Qué módulos** tiene la barra y qué hacen al hacer clic | ✏️ 📦 |
| `~/.config/waybar/style.css` | **Cómo se ve** la barra (tamaños, espacios, bordes) | ✏️ 🎨 📦 |
| `~/.config/waybar/scripts/gpu.sh` · `fans.sh` | Datos de la RTX y control de ventiladores | ✏️ 📦 |
| `~/.config/wlogout/layout` | Botones del menú de apagado y sus acciones | ✏️ 📦 |
| `~/.config/wlogout/style.css` | Cómo se ve el menú de apagado | ✏️ 🎨 📦 |
| `~/.config/mako/config.base` | Notificaciones: tamaño, esquinas, posición, duración, íconos | ✏️ 📦 |
| `~/.config/mako/config` | Notificaciones final (base + colores) | ⚙️ |

### Terminal

| Archivo | Qué es | |
|---|---|---|
| `~/.config/kitty/kitty.conf` | Terminal: fuente, márgenes, cursor, pestañas, shell | ✏️ 🎨 📦 |
| `~/.zshrc` | Shell: alias, historial, plugins, starship, fastfetch al abrir | ✏️ 📦 |
| `~/.bashrc` | Solo el alias `dot` (por si entras en bash) | ✏️ 📦 |
| `~/.config/starship.base.toml` | **Forma del prompt** (bloques, módulos, símbolos) | ✏️ 📦 |
| `~/.config/starship.toml` | Prompt final (base + colores) | ⚙️ |
| `~/.config/fastfetch/config.jsonc` | Qué datos muestra fastfetch y colores del logo | ✏️ 📦 |
| `~/.config/fastfetch/logo.txt` | El dibujo del logo SnapLabs | ✏️ 📦 |

### Dotfiles

| Archivo | Qué es |
|---|---|
| `~/.dotfiles/` | El repositorio (bare) — se maneja con `dot` |
| `~/.dotfiles/info/exclude` | Lo que git ignora: `theme/generated/`, `mako/config`, `starship.toml` |
| `~/README.md` | Portada del repositorio en GitHub |
| `~/.config/assets/` | Capturas para el README |
| `~/.config/system/` | **Copia de respaldo** de los archivos de `/etc` (sección 4) |
| `~/notas/` | Estas notas (`arch-paquetes.md`, `arch-atajos.md`, `arch-mapa-config.md`) |

> Comprobar qué está realmente en GitHub: `dot ls-files`

---

## 4. Fuera de la carpeta personal (NO están en dotfiles)

Si reinstalas, **hay que recrearlos a mano**. Hay copia en `~/.config/system/` y los comandos están en `arch-paquetes.md`.

| Archivo / ajuste | Para qué |
|---|---|
| `/etc/udev/rules.d/99-hp-fan.rules` | Que el botón de ventiladores de la Waybar funcione sin sudo |
| `/etc/systemd/logind.conf.d/tapa.conf` | Tapa: sin HDMI suspende · con HDMI solo bloquea |
| Servicios `nvidia-suspend`, `nvidia-resume`, `nvidia-hibernate` | Que el HDMI (va por la NVIDIA) despierte bien tras suspender |
| `/etc/mkinitcpio.conf` | Hook `grub-btrfs-overlayfs` (arrancar snapshots) |
| `/etc/default/grub` | Kernel `linux` por defecto |
| `~/.config/yay/config.json` | `--removemake` (borrar dependencias de compilación) — está en home pero no en dotfiles |

---

## 5. "Quiero cambiar… → edito…"

| Quiero cambiar | Edito | Luego ejecuto |
|---|---|---|
| Colores de todo | `theme/palette.sh` | `~/.config/theme/apply.sh` |
| Transparencia de terminal / barra / notificaciones / ventanas | `theme/palette.sh` | `apply.sh` (terminal: abrir una nueva) |
| Un atajo de teclado | `hypr/hyprland.lua` | `hyprctl reload` · `hyprctl configerrors` |
| Escala o posición de los monitores | `hypr/hyprland.lua` (`hl.monitor`) | `hyprctl reload` |
| Tiempo para bloquear o suspender | `hypr/hypridle.conf` | `pkill hypridle; hypridle &` (o cerrar sesión) |
| Diseño del bloqueo | `hypr/hyprlock.conf` | Probar con Super + L |
| Módulos de la barra | `waybar/config.jsonc` | `pkill waybar; nohup waybar >/dev/null 2>&1 &` |
| Espacios o tamaños de la barra | `waybar/style.css` | `pkill -SIGUSR2 waybar` |
| Botones del menú de apagado | `wlogout/layout` | Abrir el menú de nuevo |
| Duración o tamaño de notificaciones | `mako/config.base` | `apply.sh` |
| Forma del prompt | `starship.base.toml` | `apply.sh` |
| Fuente o márgenes de la terminal | `kitty/kitty.conf` | Ctrl + Shift + F5 |
| Alias o plugins de la terminal | `~/.zshrc` | `source ~/.zshrc` |
| Logo o datos de fastfetch | `fastfetch/logo.txt` · `config.jsonc` | `ff` |
| Fondos de pantalla | Poner imágenes en `~/Pictures/Wallpapers` | Super + W |

> Después de cualquier cambio que quieras conservar: `dot add <archivo>` → `dot commit -m "..."` → `dot push`.

---

## 6. Reinstalar desde cero (resumen)

1. Instalar Arch y los paquetes de `arch-paquetes.md` (`pacman` oficiales, `yay` los del AUR).
2. Crear la clave SSH y añadirla a GitHub.
3. Recuperar los dotfiles:
   ```
   git clone --bare git@github.com:SebasXayala/dotfiles.git ~/.dotfiles
   alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
   dot checkout
   dot config status.showUntrackedFiles no
   ```
   (Si `checkout` se queja de archivos existentes, muévelos o bórralos y repite.)
4. Volver a crear `~/.dotfiles/info/exclude` con: `.config/theme/generated/` · `.config/mako/config` · `.config/starship.toml`
5. Generar los archivos del tema: `~/.config/theme/apply.sh`
6. Recrear lo de la sección 4 (fuera de home).
7. `chsh -s /usr/bin/zsh` y volver a entrar en Hyprland.
