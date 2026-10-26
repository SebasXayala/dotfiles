#!/usr/bin/env bash
# Uso y temperatura de la GPU NVIDIA para Waybar
read -r uso temp mem < <(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used --format=csv,noheader,nounits | tr -d ',')
echo "{\"text\": \"󰢮 ${uso}% ${temp}°C\", \"tooltip\": \"RTX 3050\\nUso: ${uso}%\\nTemperatura: ${temp}°C\\nVRAM: ${mem} MiB\"}"
