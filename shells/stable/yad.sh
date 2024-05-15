#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
nomeUsuario="$(yad --entry --text Nome)"
senhaUsuario="$(yad --entry --text Senha)"


##########################################################
echo "${nomeUsuario}"
echo "${senhaUsuario}"

if [[ ! "${nomeUsuario}" != "${nome}" && ! "${senhaUsuario}" != "${senha}" ]]; then
         notify-send -u normal -t 7000 "Acesso Permitido!" "Bem vindo ${USER}"
else
         notify-send -u normal -t 7000 "Acesso Negado!" "Verificar Credênciais"
fi
