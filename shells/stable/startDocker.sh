#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
conteinerID="b34d14973c53"
chave="0" # 0 desligado E 1 Ligado
##########################################################

function dockando(){
if ! docker top "${conteinerID}" &>-; then
     docker start "$conteinerID" &>-
     DISPLAY=:0 notify-send -u normal -t 5000 'DOCKER' 'Seu Docker foi startado com sucesso'
     { sleep 35s; DISPLAY=:0 mysql-workbench ;}
else
     function desdokando(){
     echo -e "\E[31;2mO Conteiner ${conteinerID} esta em uso\E[m"
     docker stop "$conteinerID" &>-
     #[ "${chave}" = "1" ] && dockando
     }
     [ "${chave}" -eq "1" ] && desdokando
fi
}
dockando
