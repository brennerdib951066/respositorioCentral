#!/usr/bin/env bash

#########################HEAD#############################
# Não precisa adicionar aspas para criar seus diretorios


##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
corVermelha="\E[31;1m"
fecharCor="\E[m"
binBaixadorDeVideo="/usr/bin/yt"

##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################


##########################################################

####################VERIFICAÇÕES##########################
((UID==0)) && { printf "Root não!\n"; exit 1 ;}
: "${1?$'\E[31;1mOpa! Mande suas URLS como parâmetros\E[m'}"

! type -P "${binBaixadorDeVideo}" && { echo "Opah! Baixe o yt -dlp"; exit 1 ;}
##########################################################

until [ "${diretorio}" ] ; do
    read -p $'\E[37;1mPasta:\E[m   ' diretorio
done
    read -p $'\E[37;1mDeseja converter? [S/n]\E[m   ' converter
    [[ "${converter^^}" = "S" || -z "${converter}" ]] && tipoExtracao="-x --audio-format mp3" || tipoExtracao="-f mp4"

while [ "${1}" ]; do
    #$1="${1%%&*}"
    printf "${1}"
    yt-dlp "${tipoExtracao}" -o "${diretorio}/%(title)s.%(ext)s" "${1}"
    shift
done

#notify-send -u low -t 5000 "Seus Vídeos" "Sua lista foi de vidoes foi baixadas com sucesso!"
