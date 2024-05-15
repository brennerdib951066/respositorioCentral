#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################



##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################

login(){
    read -p 'Nome:   ' nomeLogin
    read -p 'Senha   :' senhaLogin

}
login
[ "$nomeLogin" != "${nome}" ] && { printf "Nome de usuario errado!"; sleep 2s ; clear ;login ;} || [ "${senhaLogin}" != "${senha}" ] && { printf  "Senha não corresponde!"; sleep 2s; clear ; login ;}
