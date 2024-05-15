#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
urls=("https://bubble.io/page?name=index&id=viverbemseguroscrm&tab=tabs-1" "https://www.sistemaviverbemseguros.com/version-test" "https://bubble.io/page?type=page&name=index&id=viverbemseguroscrm&tab=tabs-3&subtab=Data+Types&type_id=avisosdeatualizacao")
chaveApi="API-KEY:bc4c4106-b876-4e28-b65e-5106e9431213"
idChat="213289248"
#fluxo="2521075"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/"${idChat}"/send_message/"
conteudo="Bubble Aberto"

##########################################################
    DISPLAY=:0 google-chrome-stable --profile-directory="Profile 2" "${urls[@]}" &>- && curl -X POST -H"${contentType}" -H"${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}" ||
    { conteudo="Bubble Falhou ao abrir" ; curl -X POST -H"${contentType}" -H"${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"${conteudo}\"}" "${url}"
}
