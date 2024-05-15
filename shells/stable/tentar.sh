#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS DO PROGRAMA##################
corBranca="\E[37;1m"
fecharCor="\E[m"

##########################################################
(($UID==0)) && { printf '\E[37;1mRoot não!\E[m\n'; exit 1 ;}

login() {
    printf '\E[37;1m Será apenas aceitos 3(três) tentativas\E[m\n'
until false; do
    [[ "${t}" -eq 3 ]] && { printf '\E[37;1m Tentaivas Esgotadas!\E[m\n'; exit 1 ;}
    ((t++))
    printf "\E[37;1m Tentivas ${t}(3)\E[m\n"
    credenciais=$(zenity --title="Login" --text="Insira suas credênciais" --forms --add-entry="nome"\
    --forms --add-password="Senha"\
    --separator=",")
    [[ "${credenciais%,*}" = "brenner" && "${credenciais#*,}" -eq "${senha}" ]] && break
done

}
login #################Chamando a função Login para as credênciais#######################
