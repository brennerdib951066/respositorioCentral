#!/usr/bin/env bash


#====VARS==========|
nome="debugger"
versao="1.2-Beta"
dir_home="/root"
#=====Config do user
DEBUG="0"  #Desligado/ 1 Ligado
#=================|

if [[ "$DEBUG" -eq "1" ]]; then
    echo "Esta ligado o debugger"
    set -x
fi

asas

