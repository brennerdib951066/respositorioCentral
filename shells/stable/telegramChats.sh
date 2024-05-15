#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
arquivo="/home/brenner/Área de Trabalho/scripts/"


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################
source bibliotecas/telegram


##########################################################

####################VERIFICAÇÕES##########################


##########################################################

i=1
for listar in * ; do
    printf ${listar}'\n'
    read incremente[$i] <<< "${listar}"
    printf "INCREMENTE ${incremente[i]}\n"
    for ids in "${chatIdsTelegram[@]}" ; do
    printf "\E[31;1m${ids}\E[m\n"
    curl -s -F chat_id="${ids}" -F document="@${incremente[i]}" https://api.telegram.org/bot$TOKEN/sendDocument
done

    ((i++))

done


for ids in "${chatIdsTelegram[@]}" ; do
    printf "\E[31;1m${ids}\E[m\n"
    curl -s -F chat_id="${ids}" -F document="@${incremente[i]}" https://api.telegram.org/bot$TOKEN/sendDocument
done
