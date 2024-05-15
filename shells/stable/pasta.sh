#!/usr/bin/env bash

diretorio="$HOME/Área de Trabalho/testando"
vermelho="\E[31;5m"
fechar="\E[1m"

while :; do
    sleep 3s
    ((i++))
    notify-send -i "face-cool" -t 2000 "Falta Pasta" "A pasta que necessita ainda não existe!"
    [[ ! -d "$diretorio" ]] && { echo -e "${vermelho}${i}${fechar}" ; continue ;}\
    || break


done

notify-send -i "face-cool" -t 3000 "Agora Sim" "Criação da pasta feita com sucesso"
clear
exit 0
