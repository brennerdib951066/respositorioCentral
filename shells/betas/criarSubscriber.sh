#!/usr/bin/env bash

apiKey=("bc4c4106-b876-4e28-b65e-5106e9431213" "91b381b2-97c7-4fb1-998b-de3ff0d50d72")
contentType='Content-Type:application/json'
titulo=("Escolha a campanha" "cadastro subscriber bot conversa")
texto=("Campanha:" "Dados Requeridos:")
listaEscolha=("viver bem" "DBS")
primeiroNomeLabel='Primeiro nome'
segundoNomeLabel='Sobre Nome'
telefoneLabel='Telefone'


# FUNÇÕES

cadastrando(){
# Requisição API
	if [[ "${escolhendo}" = "${listaEscolha[1]}" ]]; then

		curl -X POST -H"${contentType}" -H"API-KEY: ${apiKey[0]} " -d "{ \"phone\": \"${dado[2]}\", \"first_name\": \"${dado[0]}\", \"last_name\": \"${dado[1]}\"}" "https://backend.botconversa.com.br/api/v1/webhook/subscriber/"
	else
		curl -X POST -H"${contentType}" -H"API-KEY: ${apiKey[1]} " -d "{ \"phone\": \"${dado[2]}\", \"first_name\": \"${dado[0]}\", \"last_name\": \"${dado[1]}\"}" "https://backend.botconversa.com.br/api/v1/webhook/subscriber/"
	fi
}

escolhaCampanha(){
escolhendo="$(zenity --title="${titulo[0]}" --text="${texto[0]}"\
				--list --column="Opções:" "${listaEscolha[@]}")"
}

escolhaCampanha # Chamdno a função escolhaCampanha
until [[ "${dados}" ]]; do
dados="$( zenity --title="${titulo[1]}" --text="${texto[1]}"\
			--forms --add-entry="${primeiroNomeLabel}"\
			--forms --add-entry="${segundoNomeLabel}"\
			--forms --add-entry="${telefoneLabel}"\
			--separator=",")"
		[[ "${?}" -eq 1 ]] && exit


		readarray -d',' -t dado <<<"${dados}"
		dado[2]=$(echo -n "${dado[2]}") # Para não pular la no curl na hora do cadastro o telefone do usuário, isso é obrigatório!
		# Se for apenas um unico dado recebido por via entrada pode ser feito assim com readarray
done

cadastrando "${dado[@]}"

