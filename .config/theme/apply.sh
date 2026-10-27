#!/usr/bin/env bash
# Lee palette.sh y genera colores y transparencias para cada programa.
set -euo pipefail
DIR="$HOME/.config/theme"
OUT="$DIR/generated"
source "$DIR/palette.sh"
mkdir -p "$OUT"

# Valores por defecto si la paleta no los define
OPACITY="${OPACITY:-0.90}"
BAR_OPACITY="${BAR_OPACITY:-0.85}"
WIN_OPACITY_ACTIVE="${WIN_OPACITY_ACTIVE:-1.0}"
WIN_OPACITY_INACTIVE="${WIN_OPACITY_INACTIVE:-1.0}"
BLUR="${BLUR:-true}"
BLUR_SIZE="${BLUR_SIZE:-6}"
BLUR_PASSES="${BLUR_PASSES:-2}"

VARS=(BG BG_ALT SURFACE SURFACE1 SURFACE2 OVERLAY FG FG_DIM ACCENT ACCENT2 OK WARN URGENT RED GREEN YELLOW BLUE PINK TEAL)

# Waybar (CSS)
{ echo "/* Generado por apply.sh — no editar */"
  for v in "${VARS[@]}"; do printf '@define-color %s #%s;\n' "${v,,}" "${!v}"; done
  printf '@define-color bar_bg alpha(#%s, %s);\n' "$BG" "$BAR_OPACITY"
} > "$OUT/colors.css"

# Hyprland (Lua)
{ echo "-- Generado por apply.sh — no editar"
  echo "return {"
  for v in "${VARS[@]}"; do printf '  %s = "%s",\n' "${v,,}" "${!v}"; done
  printf '  win_opacity_active = %s,\n' "$WIN_OPACITY_ACTIVE"
  printf '  win_opacity_inactive = %s,\n' "$WIN_OPACITY_INACTIVE"
  printf '  blur = %s,\n' "$BLUR"
  printf '  blur_size = %s,\n' "$BLUR_SIZE"
  printf '  blur_passes = %s,\n' "$BLUR_PASSES"
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
background_opacity $OPACITY
transparent_background_colors #$BG_ALT@$OPACITY #$SURFACE@$OPACITY
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
NOTIF_OPACITY="${NOTIF_OPACITY:-0.85}"
NA=$(printf '%02x' "$(awk -v o="$NOTIF_OPACITY" 'BEGIN{printf "%d", o*255}')")
if [ -f "$MAKO/config.base" ]; then
  {
    echo "# Generado por apply.sh — edita config.base, no este archivo"
    echo "background-color=#$BG$NA"
    echo "text-color=#$FG"
    echo "border-color=#$ACCENT"
    echo "progress-color=over #$SURFACE"
    echo "format=<span size=\"x-small\" foreground=\"#$FG_DIM\">%a</span>\\n<span size=\"large\"><b>%s</b></span>\\n<span foreground=\"#$FG_DIM\">%b</span>"
    echo
    cat "$MAKO/config.base"
    echo
    echo "[urgency=low]"
    echo "border-color=#$OVERLAY"
    echo
    echo "[urgency=critical]"
    echo "border-size=2"
    echo "border-color=#$URGENT"
    echo "default-timeout=0"
  } > "$MAKO/config"
fi

# Starship: tu diseño (starship.base.toml) + colores -> starship.toml
STAR="$HOME/.config/starship.base.toml"
if [ -f "$STAR" ]; then
  {
    echo "# Generado por apply.sh — edita starship.base.toml, no este archivo"
    cat "$STAR"
    echo
    echo "[palettes.theme]"
    echo "base   = \"#$BG\""
    echo "c1     = \"#$ACCENT\""
    echo "c2     = \"#$ACCENT2\""
    echo "c3     = \"#$SURFACE2\""
    echo "c4     = \"#$SURFACE\""
    echo "text   = \"#$FG\""
    echo "yellow = \"#$YELLOW\""
    echo "green  = \"#$GREEN\""
    echo "red    = \"#$RED\""
  } > "$HOME/.config/starship.toml"
fi

# Recargar lo que esté abierto
hyprctl reload >/dev/null 2>&1 || true
pkill -SIGUSR2 waybar 2>/dev/null || true
pkill -SIGUSR1 kitty 2>/dev/null || true
makoctl reload 2>/dev/null || true
pkill hyprlauncher 2>/dev/null || true
echo "Tema aplicado."
