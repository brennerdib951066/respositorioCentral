#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS DO PROGRAMA##################
abrirCorVermelho="\E[31;1m"
abrirCorVerde="\E[32;1m"
abrirCorBranco="\E[37;1m"
fecharCor="\E[m"

##########################################################
shopt -s extglob
shopt extglob
until false; do
    read -p $'\E[31;1mQual sua idade\E[m   ' idade
    idade="${idade//[A-Z-a-z]/}"
    [ "${idade}" ] && break
done


[[ ! "${idade}" =~ ^[0-9] ]] && { printf "${abrirCorVermelho}Só numeros são aceitos${fecharCor}\n"; exit 1 ;}


if [[ "${idade}" -ge "18" && "${idade}" -le "70" ]]; then
        printf "${abrirCorVermelho/1m/2m}Por ter ${idade}, seu voto é obrigatório${fecharCor}\n"
elif [[ "${idade}" -ge "16" && "${idade}" -lt "18" ]]; then
        printf "${abrirCorVerde/1m/2m}Olá com ${idade}, seu voto ainda é opcional${fecharCor}\n"
elif [[ "${idade}" -lt "16" ]]; then
        printf "${abrirCorBranco/1m/2m}Poxa com a idade de ${idade} não existe possibilidade de votar!${fecharCor}\n"
else

    printf "${abrirCorVerde/1m/2m}Você tem mais de 70\nSeu voto é opcional${fecharCor}\n"

fi
