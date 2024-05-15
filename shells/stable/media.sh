#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
read -p "Nota:   " nota1 nota2 nota3 nota4
soma="$((nota1+nota2+nota3+nota4))"
read media <<<"$((soma/4))"

##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################

if ((media>=7)); then
    responder="Aprovado"
else
    responder="Reprovado"
fi
printf "${responder}! Sua nota: ${media}\n"
