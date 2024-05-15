#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################



##########################################################

read -p $'\E[31;1mQual Seu Nome?\E[m   ' nome
# Tirando os espaços iniciais
nome="${nome##*( )}"
# Tirando os espaços finais
nome="${nome%%*( )}"
echo "${nome}" >> ver.txt
#kate ver.txt
#echo "${nome% *}"
