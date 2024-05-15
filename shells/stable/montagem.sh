#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################



##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################
disco="$(lsblk | grep -i "pendriver")"
montagemLocal="/mnt/backups"
arquivoCopy="/home/brenner/Área de Trabalho"
data=$(date +%d-%m-%Y)
arquivoFinal="backup-${data}.tar.gz"
avisoRoot="Só vou com root!"
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
idChat="213289248"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/"${idChat}"/send_message/"
conteudo=("Backup Realizado com sucesso" "Houve algum problema com seu backup de hoje" "Arquivos deletados com sucesso"  "Falha ao deletar")
chaveDelete="1" # 0 É desligado(off) e 1 é ligado(on)
##########################################################

####################VERIFICAÇÕES##########################
((UID>0)) && { printf "\E[31;1m${avisoRoot^^}\E[m\n"; exit 1 ;}

##########################################################
#Limpeza para pegar apenas o disco
disco="${disco%% *}"
disco="${disco//[^A-Za-z0-9]/}"
discoLimpo="/dev/$disco"
printf "${disco}\n"
##########################################################
backup(){
if ! tar -czSPpf "${montagemLocal}/${arquivoFinal}" "${arquivoCopy}"; then
    curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[1]^^}*\"}" "${url}"
else
    curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[0]^^}*\"}" "${url}"
fi

} # funcão de fazer o backup

apagarDados(){
find "${montagemLocal}" -mtime +1 -delete && curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[2]^^}*\"}" "${url}" || curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[3]^^}*\"}" "${url}"

}

if ! mountpoint "${montagemLocal}" ; then
    printf "Nada montado em ${montagemLocal}\n"
    mount -v "${discoLimpo}" "${montagemLocal}"
    backup # Chamando a função de fazer o backup
else
    printf "montado em ${montagemLocal}\n"
    backup # Chamando a função de fazer o backup
fi
[ "${chaveDelete}" = "1" ] && apagarDados

