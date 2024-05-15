#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
particao=$(lsblk | grep -iE '(14,5G)[ ]+[0-9]+[ ]+(part)')
particao=${particao%% *}
particao=${particao//[^A-Za-z0-9]/}
nomeDispositivo="pendriver"
montagem="/mnt/backup"
particao="/dev/${particao}"
corVermelho="\E[31;1m"
corVerde="\E[32;1m"
fecharCor="\E[m"
##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################
((UID>0)) && { printf "Precisa de root!"; exit 1 ;}

##########################################################
lsblk | grep -iE '(14,5G)[ ]+[0-9]+[ ]+(part)'
printf "${particao}\n"

formatar(){
    { mkfs.vfat -n "${nomeDispositivo}" "${particao}" &>-; printf "${corVerde}${particao} foi formatado com sucesso!\n"${fecharCor} ;}
}

if ! mountpoint -q "${montagem}" &>-; then
    lsblk | grep -iE '(14,5G)[ ]+[0-9]+[ ]+(part)'
    formatar ${@}
    #printf "Falhou a formatação do ${particao}\n"

else
    { printf "${corVermelho}O ${particao} está montado em ${montagem}\n${fecharCor}"; sleep 5s ;}
    umount -v "${montagem}"
    formatar ${@}
fi
