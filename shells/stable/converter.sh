#!/usr/bin/env bash

for musica in *.mp4;do
        ffmpeg -i "$musica" -vn -acodec libmp3lame -ab 192k "${musica%.mp4}.mp3";
        echo "${musica[@]}" >> todasasmusicas.txt
        mv -i "${musica[@]}" /home
done
