#!/usr/bin/env bash

#Começar Algoritimo
# horaDofilme=""
# horaDaAtual=""
#
# if   [[ "$horaDaAtual" -ge "$horaDofilme" ]]; then
#     echo -e "Bem Vindo! Pode entrar no cinema!"
#
# else
#     echo "Opah! Por favor espere a hora chegar!"
# fi


#Finalizar Algoritimo

#----------------------------------------------
#Começar Algoritimo
horaDofilme="7"
read -p $'\E[31;1mQual é a hora que deseja entrar no cinema?\E[m   ' horaDaAtual

if   [[ "$horaDaAtual" -ge "$horaDofilme" && "$horaDaAtual" -le "$((horaDofilme+2))" ]]; then
    echo  $'\E[32;1mBem Vindo! Pode entrar no cinema!\E[m'

else
    echo $'\E[31;1mOpah! Por favor espere a hora chegar!\E[m'
fi


#Finalizar Algoritimo
