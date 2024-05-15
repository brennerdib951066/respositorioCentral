#!/usr/bin/env bash

#Loop qualquer

listagem="$(ls *.htlm)"
local="$(cd /home/brenner/'Área de Trabalho')"

#for musica in "$listagem"; do ffmpeg -i "$musica" -vn -acodec libmp3lame -ab 192k "${musica%.mp4}.mp3"; done

for pasta in "$listagem"; do cp "$pasta" "${pasta%.html}.css"; done
