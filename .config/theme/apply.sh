#!/usr/bin/env bash
# Lee palette.sh y genera los colores para cada programa.
set -euo pipefail
DIR="$HOME/.config/theme"
OUT="$DIR/generated"
source "$DIR/palette.sh"
mkdir -p "$OUT"

VARS=(BG BG_ALT SURFACE SURFACE1 SURFACE2 OVERLAY FG FG_DIM ACCENT ACCENT2 OK WARN URGENT RED GREEN YELLOW BLUE PINK TEAL)

# Waybar (CSS)
{ echo "/* Generado por apply.sh — no editar */"
  for v in "${VARS[@]}"; do printf '@define-color %s #%s;\n' "${v,,}" "${!v}"; done
} > "$OUT/colors.css"

# Hyprland (Lua)
{ echo "-- Generado por apply.sh — no editar"
  echo "return {"
  for v in "${VARS[@]}"; do printf '  %s = "%s",\n' "${v,,}" "${!v}"; done
  echo "}"
} > "$OUT/colors.lua"

# hyprlock (formato hyprlang)
{ echo "# Generado por apply.sh — no editar"
  for v in "${VARS[@]}"; do printf '$%s = rgb(%s)\n' "${v,,}" "${!v}"; done
} > "$OUT/colors.conf"

# kitty
cat > "$OUT/kitty-colors.conf" <<EOF
# Generado por apply.sh — no editar
foreground #$FG
background #$BG
selection_foreground #$BG
selection_background #$ACCENT
cursor #$ACCENT
url_color #$ACCENT2
active_border_color #$ACCENT
inactive_border_color #$OVERLAY
active_tab_foreground #$BG
active_tab_background #$ACCENT
inactive_tab_foreground #$FG
inactive_tab_background #$BG_ALT
color0  #$SURFACE1
color8  #$SURFACE2
color1  #$RED
color9  #$RED
color2  #$GREEN
color10 #$GREEN
color3  #$YELLOW
color11 #$YELLOW
color4  #$BLUE
color12 #$BLUE
color5  #$PINK
color13 #$PINK
color6  #$TEAL
color14 #$TEAL
color7  #$FG_DIM
color15 #$FG
EOF

# mako: colores + tu estructura (config.base) -> config
MAKO="$HOME/.config/mako"
if [ -f "$MAKO/config.base" ]; then
  {
    echo "# Generado por apply.sh — edita config.base, no este archivo"
    echo "background-color=#$BG"
    echo "text-color=#$FG"
    echo "border-color=#$ACCENT"
    echo "progress-color=over #$SURFACE"
    echo
    cat "$MAKO/config.base"
    echo
    echo "[urgency=low]"
    echo "border-color=#$OVERLAY"
    echo
    echo "[urgency=critical]"
    echo "border-color=#$URGENT"
    echo "default-timeout=0"
  } > "$MAKO/config"
fi

# Recargar lo que esté abierto
hyprctl reload >/dev/null 2>&1 || true
pkill -SIGUSR2 waybar 2>/dev/null || true
pkill -SIGUSR1 kitty 2>/dev/null || true
makoctl reload 2>/dev/null || true
echo "Tema aplicado."
