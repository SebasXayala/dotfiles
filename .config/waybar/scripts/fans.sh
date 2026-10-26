#!/usr/bin/env bash
# Ventiladores HP: muestra RPM; con "toggle" alterna máximo (0) / automático (2)
H=$(echo /sys/devices/platform/hp-wmi/hwmon/hwmon*)
if [ "$1" = "toggle" ]; then
  [ "$(cat "$H/pwm1_enable")" = "0" ] && echo 2 > "$H/pwm1_enable" || echo 0 > "$H/pwm1_enable"
  pkill -RTMIN+8 waybar
  exit 0
fi
f1=$(cat "$H/fan1_input"); f2=$(cat "$H/fan2_input")
if [ "$(cat "$H/pwm1_enable")" = "0" ]; then modo="MÁXIMO"; clase="max"; else modo="Automático"; clase="auto"; fi
echo "{\"text\": \"󰈐 ${f1} ${f2}\", \"class\": \"${clase}\", \"tooltip\": \"Ventiladores: ${modo}\\nCPU: ${f1} RPM\\nGPU: ${f2} RPM\\nClic: alternar máximo / automático\"}"
