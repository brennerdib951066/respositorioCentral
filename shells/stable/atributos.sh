#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
baseDiretorio="/home/brenner/Área de Trabalho"
arquivo=("$baseDiretorio/apagar" "$baseDiretorio/atributos" "$baseDiretorio/aula03" "$baseDiretorio/chaveAPI" "$baseDiretorio/inicio" "$baseDiretorio/linuxVideos" "$baseDiretorio/maisa" "$baseDiretorio/pythons" "$baseDiretorio/videos" "${baseDiretorio}/scripts")
hora="$(date +%H:%M)"

chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/subscriber_id/send_message/"
conteudo=("Backup Realizado com sucesso" "Houve algum problema com seu backup de hoje" "Arquivos deletados com sucesso"  "Falha ao deletar" "Aqui é um teste de shell script" "Atributos modificados com sucesso!")


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################
#source "bibliotecas/whatsApp.txt"
declare -A idsBot
idsBot=(["brenner"]="213289248" ["denner"]="193741501")
##########################################################

####################VERIFICAÇÕES##########################
((UID>0)) && { printf "Precisa de do chefe!"; clear ; sleep 1s; exit 1;}

##########################################################
case "${hora}" in
    "09:00") chattr -R -a "${arquivo[@]}"          ;;
    "12:00"|"19:00") chattr -R +a "${arquivo[@]}"  ;;
    *) chattr -R +a "${arquivo[@]}"                ;;
esac

curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[5]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"

#mkdir '/home/brenner/Área de Trabalho/crontabb'
