#!/usr/bin/env bash

titulo="Criar Tópicos Telegram"
texto="Tópicos no mínimo 6 caracteres"
id="-1001858369092"
url="https://api.telegram.org/bot5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc/createForumTopic"

criandoTopico(){
	curl -s -F chat_id="${id}" -F name="${criarTopico}" "${url}" # Criando o tópico

}




until [[ "${criarTopico}" && "${#criarTopico}" -gt 5 ]]; do
	criarTopico=$(zenity --title="${titulo}" --text="${texto}" --forms --add-entry="Nome")
	[[ "${?}" -gt 0 ]] && exit 1
done

criandoTopico
