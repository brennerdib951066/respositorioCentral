#!/usr/bin/env bash

######################### HEAD #############################################
                                                                           #
# Programa : Baixado De Vídeos                                             #
# Autor    : Brenner Santos                                                #
# Data     : 10/02/2024                                                    #
# Versão   : 1.0.0.0.0 Beta                                                #
                                                                           #
############################################################################

###################### COMENTÁRIOS #########################################
                                                                           #
# O paramentro -x --audio-format mp3 se for resultado de uma variável não  #
# deve conter aspas, se não ocorrerá erros!                                #
                                                                           #
# De ter o yt-dlp instalado no seu pc                                      #
############################################################################


binYt='/usr/bin/yt'
arquivoBase='/home/estudo/Área de Trabalho/scripts/stable/bibliotecas/requisicao.txt'
notificacao=("falhou o  download")
api='bc4c4106-b876-4e28-b65e-5106e9431213'
subscriber="385910829"


! type -P "${binYt}" && { echo -e "\E[36;1mInstale o yt-dlp para usar o programa!\nContate seu administratdor\E[m"; sleep 2s ; exit 1 ;}


bubbleGet(){
                get="$(curl -X GET -H'Content-Type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a' "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/linksDaMaisa" | grep -Eio "\"https.*" > "${arquivoBase}")"

}
bubbleGet
notificar(){
                curl -X POST -H'Content-Type: application/json' -H"API-KEY: ${api}" -d"{ \"type\": \"text\", \"value\": \"*${notificacao[0]} com o endereço de:*\n*_${dado}_*\"}" "https://backend.botconversa.com.br/api/v1/webhook/subscriber/${subscriber}/send_message/"

}


mapfile -t dados < "${arquivoBase}"
formato='-x --audio-format mp3'
read -p $'\E[36;1mDiretorio para os downloads:\E[m\n' diretorio
for dado in "${dados[@]}"; do
        dado="${dado//,/}"
        dado="${dado//\"/}"
        echo "Reci isso ${dado}"
        ! yt-dlp ${formato} -o "/home/estudo/Área de Trabalho/${diretorio}/%(title)s.%(ext)s" "${dado}" &&\
        notificar "${notificacao[0]}" "${dado}" ; sleep 10s

done
