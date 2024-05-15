#!/usr/bin/env bash

#diretorio="/home/brenner/'Área de Trabalho'"

#function version-linux(){
 #       versao=$(cat /etc/os-release) #Variavel Comum
 #       local diretorio="/home/brenner" #Variavel local funcionando somente para a funcao
  #      echo -e "Versao do linux: \n$versao"
#}
#version-linux # Chamando a funcao

#echo -e "\033[31;1mO diretorio 1 é $diretorio"


#function paramentros() {
#    [[ "$1" ]] && echo -e "\033[32;1mO paramentro NÃo é nula\033[m" || echo -e "\033[31;1mÉ nula a variavel\033[m"
#}

#paramentros "$@" #Chamando a a variavel especial de todos os paramentro para nao da erro na chamada com os paramentros


function status-saida() {
    local diretorio=$HOME
    ls "$HOME"
    return 1
}

status-saida
echo -e " Retornando o Status De Saida com \033[31;1mRETURN\033[m $?"