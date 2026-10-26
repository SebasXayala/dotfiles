#!/usr/bin/env bash
# Pasa a la siguiente imagen de ~/Pictures/Wallpapers en todas las pantallas y la guarda
DIR="$HOME/Pictures/Wallpapers"
STATE="$HOME/.cache/wallpaper-current"
mapfile -t imgs < <(find "$DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort)
[ ${#imgs[@]} -eq 0 ] && { notify-send "Fondo" "No hay imágenes en $DIR"; exit 1; }

actual=$(cat "$STATE" 2>/dev/null)
siguiente="${imgs[0]}"
for i in "${!imgs[@]}"; do
  [ "${imgs[$i]}" = "$actual" ] && siguiente="${imgs[$(( (i + 1) % ${#imgs[@]} ))]}"
done

conf="splash = false"$'\n'
for m in $(hyprctl monitors -j | jq -r '.[].name'); do
  hyprctl hyprpaper wallpaper "$m,$siguiente" >/dev/null
  conf+=$'\n'"wallpaper {"$'\n'"    monitor = $m"$'\n'"    path = $siguiente"$'\n'"}"$'\n'
done
printf '%s' "$conf" > "$HOME/.config/hypr/hyprpaper.conf"
echo "$siguiente" > "$STATE"
notify-send "Fondo" "$(basename "$siguiente")"
