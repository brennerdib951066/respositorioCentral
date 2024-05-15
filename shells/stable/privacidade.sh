#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS DO PROGRAMA##################
diretorio="/home/brenner/Área de Trabalho/scripts"
mensagemRemovidoSucesso="Foi retirado a leitura do diretorio com sucesso"
mensagemAdicaoSucesso="Foi adicionado a leitura do diretorio com sucesso"
##########################################################
(($UID>0)) && { printf 'Precisa de root\n'; exit 1 ;}

[ ! -d "${diretorio}" ] && echo "Nao exite" || echo "lalalala"

function adicionar(){
        chown -R brenner "${diretorio}"
        chmod -R +r "${diretorio}"
}

adicionar
# function remover(){
#
#         chown -R root "${diretorio}" ; chmod -R -r "${diretorio}"
# }
#
# [ -r "${diretorio}" ] && remover
# [ ! -r "${diretorio}" ] && adicionar
#
# ls -l "${diretorio%/*}"
