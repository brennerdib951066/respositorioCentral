#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
abrirCorVermelha="\E[31;1m"
fecharCor="\E[m"

##########################################################


read -p $'\E[31;1msenha de 5 digitos\E[m   ' digitos

# if   [[ "${#digitos}" = 5 ]]; then
#         echo $'\E[32;2m5 Digitos inseridos corretamente\E[m'
# elif [[ "${#digitos}" -eq 3 ]]; then
#         echo $'\E[31;4mErro\nPara 5 digitos faltam 3\E[m'
# elif [[ "${#digitos}" -eq 2 ]]; then
#         echo $'\E[31;4mErro\nPara 5 digitos faltam 3\E[m'
# else
#         echo $'\E[35;1mPresta Atenção Cara!\E[m'
# fi

