# Mantenimiento y actualizaciones — snaplabs-arch

Guía para mantener el PC al día sin romper nada.

---

## 1. Rutina semanal (5 minutos)

```
checkupdates          # 1. Ver qué hay pendiente (no instala nada)
yay                   # 2. Actualizar TODO (oficiales + AUR)
pacman -Qdt           # 3. Ver paquetes huérfanos
```

| Paso | Qué hacer |
|---|---|
| 1 · `checkupdates` | Leer la lista. Fijarse si aparece **`linux`**, **`linux-lts`**, **`nvidia-open-dkms`**, **`hyprland`** o **`mesa`** |
| 2 · `yay` | Pide la contraseña → en "Packages to exclude" pulsar **Enter** (no excluir nada) → confirmar con **Enter** |
| 3 · `pacman -Qdt` | Si muestra algo: `sudo pacman -Rns $(pacman -Qdtq)`. Si no muestra nada, no hay que hacer nada |

### ¿Hay que reiniciar?

| Se actualizó… | Reiniciar |
|---|---|
| `linux`, `linux-lts`, `nvidia-open-dkms`, `nvidia-utils`, `amd-ucode`, `systemd` | **Sí** |
| `hyprland`, `mesa`, `waybar`, `mako` | Cerrar sesión y volver a entrar (o reiniciar) |
| Una app (Discord, Chrome, VS Code…) | No; solo cerrar y abrir esa app |
| Librerías y herramientas (`llvm-libs`, `btrfs-progs`…) | No hace falta |

> Si se actualizó el kernel y en la salida aparece `dkms` compilando NVIDIA sin errores, todo bien.

---

## 2. Rutina mensual: firmware

BIOS, SSD, cámara y certificados de arranque **no** se actualizan con `yay`:

```
fwupdmgr refresh && fwupdmgr get-updates
```

- `No updates available` → nada que hacer.
- Si hay algo: **conectar el cargador** y ejecutar `fwupdmgr update`. Puede reiniciar solo; no apagar durante el proceso.

---

## 3. Reglas de oro

| ✅ Hacer | ❌ No hacer |
|---|---|
| Actualizar **todo** de una vez con `yay` | `sudo pacman -Sy paquete` (sincroniza sin actualizar el resto → puede romper el sistema) |
| Leer la lista antes de confirmar | Excluir paquetes en "Packages to exclude" |
| Reiniciar tras kernel o NVIDIA | Apagar el PC a mitad de una actualización |
| Instalar programas nuevos con `sudo pacman -S` o `yay -S` | Usar `sudo yay` (yay **nunca** con sudo) |
| Actualizar al menos cada 2–3 semanas | Dejar pasar meses sin actualizar |

Antes de una actualización grande o después de mucho tiempo sin actualizar, mirar las noticias de Arch:
**archlinux.org** (sección *Latest News*). Si hay un aviso, explica qué hacer.

---

## 4. Snapshots: la red de seguridad

**Automáticos (no hay que hacer nada):** `snap-pac` crea dos snapshots en cada `pacman`/`yay`:
uno **antes** (pre) y otro **después** (post). En la salida se ve así:

```
Performing snapper pre snapshots... ==> root: 93
...
Performing snapper post snapshots... ==> root: 94
```

Snapper borra solo los automáticos viejos para no llenar el disco.

**Manuales:** solo para marcar momentos importantes o antes de algo arriesgado
(tocar GRUB, mkinitcpio, NVIDIA, archivos de `/etc`):

```
sudo snapper -c root create -d "Descripción clara"
sudo snapper list                       # ver todos
```

> Los snapshots de `root` **no incluyen `/home`**. La configuración personal (Hyprland, Waybar, etc.)
> está protegida por los dotfiles en GitHub (`dot`).

---

## 5. Si algo sale mal después de actualizar

### A. Arranca, pero algo falla (una app, la barra, el sonido…)

1. Ver qué se actualizó: `grep -i upgraded /var/log/pacman.log | tail -20`
2. **Volver un paquete a la versión anterior** (las versiones viejas quedan en la caché):
   ```
   ls /var/cache/pacman/pkg/ | grep nombre-del-paquete
   sudo pacman -U /var/cache/pacman/pkg/nombre-del-paquete-VERSION-ANTERIOR.pkg.tar.zst
   ```
3. O **deshacer toda la actualización** con los números de snapshot (pre..post):
   ```
   sudo snapper list                     # buscar el par pre/post de esa actualización
   sudo snapper undochange 93..94        # devuelve los archivos del sistema al estado del 93
   ```
   Reiniciar después.

### B. No arranca el escritorio, pero sí la consola

- Pulsar **Ctrl + Alt + F2**, iniciar sesión y hacer el punto A desde ahí.
- Volver al escritorio con **Ctrl + Alt + F1**.

### C. No arranca nada

1. En el menú de **GRUB** elegir **Advanced options → linux-lts** (kernel de respaldo).
2. Si tampoco: en GRUB entrar a **Arch Linux snapshots** y elegir el snapshot *pre* de la última actualización.
   El sistema arranca como estaba antes (en modo de solo lectura).
3. Ya dentro, abrir una terminal y aplicar el punto A (`undochange` o `pacman -U`) para dejarlo arreglado de forma permanente. Reiniciar normal.

---

## 6. Avisos que pueden aparecer

| Aviso | Qué significa | Qué hacer |
|---|---|---|
| `warning: ... installed as ....pacnew` | Hay una versión nueva de un archivo de configuración de `/etc` que tú modificaste | `sudo pacdiff` para comparar y decidir. Si dudas, no borrar nada y revisarlo con calma |
| `error: failed to commit transaction (conflicting files)` | Un archivo pertenece a dos paquetes | **No forzar.** Buscar el mensaje exacto en archlinux.org/news o en la wiki |
| `invalid or corrupted package (PGP signature)` | Llaves de firma desactualizadas | `sudo pacman -Sy archlinux-keyring && yay` |
| `unable to lock database` | Hay otro pacman abierto (o uno se cortó) | Cerrar el otro. Si no hay ninguno: `sudo rm /var/lib/pacman/db.lck` |
| Pide importar una **PGP key** al instalar del AUR | Normal en algunos paquetes del AUR | Aceptar (**y**) |

---

## 7. Limpieza (opcional)

| Comando | Qué hace |
|---|---|
| `paccache.timer` | **Ya activo:** borra solo las versiones viejas de la caché (guarda las 3 últimas) |
| `yay -Sc` | Limpiar la caché de yay (paquetes del AUR descargados) |
| `du -sh /var/cache/pacman/pkg/` | Ver cuánto ocupa la caché |
| `df -h /` | Espacio libre en el disco |

---

## Resumen en una línea

**Cada semana:** `yay` → reiniciar si hubo kernel/NVIDIA → `pacman -Qdt`.
**Cada mes:** `fwupdmgr refresh && fwupdmgr get-updates`.
**Si algo se rompe:** snapshots (`snapper list` → `undochange pre..post`) o `linux-lts` desde GRUB.
