#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################

read -p $'\E[31;1mQual sua media?\E[m  ' media


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################

if ((media < 8)); then
    if ((media>=5&&media<8)) ; then
        echo -e "Sua média é de: ${media}\nPode fazer a recuperação!"
    elif ((media<5)) ; then
        echo "Infezlimente está reprovado direto"
    fi
else
        echo -e "Aluno bem de vida!\nParabens Você passsou\n\E[37;1mSua media é: ${media}\E[m"
fi
