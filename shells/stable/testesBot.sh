#!/usr/bin/env bash

source bibliotecas/whatsApp.txt
#printf "ID EU ${idsBot[brenner]}\n"

#printf "URL ${url/subscriber_id/${idsBot[brenner]}}\n"

for ids in "${idsBot[@]}" ; do
    curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*${conteudo[4]^^}*\"}" "${url/subscriber_id/${ids}}"

done
