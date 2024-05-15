#!/usr/bin/env bash

#####################################################VARIAVEIS ESPECIAIS DO PROGRAMA######################################################################################
discos="$(lsblk | grep -i "pendriver")"
montagemLocal="/mnt/backups"
arquivoCopy="/home/brenner/Área de Trabalho"
data=$(date +%d-%m-%Y)
dataAnterior=$(date +%d-%m-%Y -d -1 days)
arquivoFinal="backup-${data}.tar.gz"
arquivo="/home/brenner/Downloads/123Japao.pdf"
avisoRoot="Só vou com root!"
bibliotecas="bibliotecas/whatsApp.txt"

declare -A idsBot
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/subscriber_id/send_message/"
conteudo=("Seu Backup de hoje sendo iniciado" "Sua COPYA -u foi efetuada com sucesso!" "Falha ao comprimir seu backup" "Sua compreensaão foi bem sucedida" "O diretorio apagado com sucesso!")
idsBot=(["brenner"]="213289248" ["denner"]="193741501")
chaveDelete="1" # 0 É desligado(off) e 1 é ligado(on)
##########################################################################################################################################################################

((UID>0)) && { printf "Funciono apenas com root!" ; clear ; exit 1 ;}

discos="${discos%% *}"
discos="${discos//[^A-Za-z0-9]/}"
discoPronto="/dev/${discos}"
#echo "${discos}"

###################################################################FUNÇÕES DO PROGRAMA####################################################################################
backup()
{
            { echo "Verificando se é betas"; sleep 5s ;}
            [[ "$PWD" = "/home/brenner/Área de Trabalho/betas" ]] && bibliotecas=../scripts/${bibliotecas}; arquivoCopy="/home/brenner/Área de Trabalho/testeCp" # Feito somente se estiver no diretorio BETAS
                curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[0]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"
            if ! cp -rvup "${arquivoCopy}" "${montagemLocal}/${arquivoFinal//tar.gz/}" ; then
                        ls
            fi
                sleep 10s
                curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[1]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"
            comprimir # Chamando a função comprimir
}

comprimir()
{
            if ! tar -cvzpPSf "${montagemLocal}/${arquivoFinal}" "${arquivoCopy}"; then
                sleep 5s
                curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[2]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"
            else
                sleep 5s
                curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[3]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"
            fi
            [[ ! -d "${montagemLocal}/${arquivoFinal//.tar.gz/}" ]] || remocao
}

remocao()
{
            rm -r "${montagemLocal}/${arquivoFinal//.tar.gz/}" &&\
            sleep 5s ; curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[3]}*\"}" "${url/subscriber_id/${idsBot[brenner]}}"

}
##################################################################FIM DAS FUNÇÕES DO PROGRAMA#############################################################################

if ! mountpoint "${montagemLocal}"; then
            echo -e "\E[31;1mNão está nada montado em ${montagemLocal}\E[m"
            mount "${discoPronto}" "${montagemLocal}"
            backup
            #lsblk
else
            echo -e "\E[32;1mJá montado ${montagemLocal}\E[m"
fi
