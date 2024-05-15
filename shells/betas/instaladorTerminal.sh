#!/usr/bin/env bash


instalarLista=("/usr/bin/flameshot" "/usr/bin/curl" "/usr/bin/grep")

for instalar in "${instalarLista[@]}";do
	[[ -e "${instalar}" ]] && continue || echo -e "O \E[31;1m${instalar}\E[m  não existe"; pkexec apt install "${instalar##*/}"
	((i++))
	echo "${i}"
done
