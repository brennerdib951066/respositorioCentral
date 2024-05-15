#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
container="a79f9a8b9aa4"
ContainerStartado=$(docker inspect $container | grep -i '"IPAddress": "172.17.0.2",')
ContainerStop=$(docker inspect $container | grep -i '"IPAddress": "",')
##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################
((UID==0)) && { printf "Precisa de root!"; sleep 2s; clear; exit 1 ;}

##########################################################


if [[ ! "${ContainerStartado}" ]]; then
   if ! docker start $container &>-; then
        printf "Falhou seu docker\n"
    else
        printf "ESTARTANDO O SUE DOKER AGORA!"
        sleep 5s
        printf "Docker startado!\n"
        DISPLAY=:0 notify-send -u normal -t 5000 "Sucesso!" "Seu docker foi startado com sucesso!"

    fi
fi
# notify-send -u normal -t 5000 "Sucesso!" "Seu docker foi startado com sucesso!"
