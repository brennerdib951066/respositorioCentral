#!/usr/bin/env bash

# VARIAVEIS DO PROGRAMA
icones="/usr/share/pixmaps"

# FIM


sair(){
	[[ "$?" -eq 1 ]] && exit 0
}

voltarSempre(){
	conteudo="Volte sempre que poder"

	notify-send -u normal -t 5000 "Obrigado" "Volte sempre que puder"
}

enviandoDados(){
	printf '%s\n' "ESTOU NO ENVIAR" ; sleep 0.5s
	readarray -d',' -t dados <<<"${@}"
		#dados=(${dados[@]})
		for ((i=0;i<2;i++)); do
			echo "VARIAVEL: ${i}"; sleep 0.5s
			((i==1)) && versao="version-test" || versao="version-live"
			if ! criandoDados="$(curl -X POST -H'Content-Type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a' -d "{\"Nome\":\"${dados[0]//,/}\",\"telefoneComercial\":\"${dados[1]//,/}\",\"email\":\"${dados[2]//,/}\",\"password\":\"${dados[3]//,/}\",\"tipoDeEquipe\":\"${entradaOperador3}\",\"periodoComercial\":\"${entradaOperador4}\",\"cargoComercial\":\"${cargoEmpresa}\"}" "https://www.sistemaviverbemseguros.com/${versao}/api/1.1/obj/User/" | grep -Eo '[0-9]+[x][0-9]+')"

			avisoDelete
			then
			echo "falhou"
			fi
		done
			voltarSempre
}

apagarDados(){
	#versao="version-live"
	echo "Você quer apagar dados..."; sleep 0.5s
	curl -X DELETE -H'Content-Type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a' "https://www.sistemaviverbemseguros.com/${versao}/api/1.1/obj/User/${criandoDados}"

}

avisoInicial(){
	titulo="aviso"
	texto="você terá 4 tentativas para realizar o login, caso ultrapasse o total de tentativas o programa irá fechar automaticamente"
		aviso=$(zenity --question --title="${titulo^^}" --text="${texto^}" --window-icon="${icones}/crisis.png" --ok-label="CIENTE" --cancel-label="Sair")
		[[ "${?}" -eq 1 ]] && exit 0

}

avisoDelete(){
	titulo="exclusao"
	texto="Deseja excluir o usuário que acabou de criar na versao ${versao}?"
		deletar="$(zenity --question --title="${titulo^^}" --text="${texto}" --ok-label="DELETAR" --cancel-label="CANCELAR!" --window-icon=${icones}/question.png)"
		[[ "${?}" -eq 1 ]] || apagarDados

}
avisoInicial # Chamando a função AVISOINICIAL
login(){
	#tentativas="3"
	titulo="login"
	texto="credênciais"
	nomeLabel="nome"
	nomeComparar="Brenner"
	senhaComparar="652516"
	senhaLabel="senha"
	tentativasLabe="tentativas"
	verificacaoLogin=$(zenity --title="${tentativas} ${tentativasLabe^^}" --text="${texto^^}" --window-icon="${icones}/user.png"  \
	--forms --add-entry="${nomeLabel^}"\
	--forms --add-password="${senhaLabel^}"\
	--separator=',')
	#[[ "${verificacaoLogin}" ]]
	#echo "${verificacaoLogin%,*}"
	#echo "${verificacaoLogin}"
	[[ "${?}" -eq 1 || "${tentativas}" -eq 3 ]] && exit 0
	[[ "${verificacaoLogin%,*}" = "${nomeComparar}" ]] && [[ "${verificacaoLogin#*,}" = "${senhaComparar}" ]] || { ((tentativas++)); echo "${tentativas}";  login ;}
}
login # Chamando a função login

operador(){
	printf '%s\n' "CHAMOU O OPERADOR"; sleep 0.5s
	titulo=("cadastro" "cargo" "tipo de equipe" "periodo")
	texto="operador"
	nomeOperadorLabel="nome"
	emailOperadorLabel="email"
	senhaOperadorLabel="senha"
	telefoneOperador="telefone"
		entradaOperador1="$(zenity --title="${titulo[0]^^}" --text="${texto^}" --forms --add-entry="${nomeOperadorLabel^}"\
		--forms --add-entry="${telefoneOperador^}"\
		--forms --add-entry="${emailOperadorLabel^}"\
		--forms --add-entry="${senhaOperadorLabel^}"\
		--forms --add-entry="VAZIO"\
		--separator=",")"
	sair # Chamando a função SAIR

	cargoOperadorLista=("CargoComercial" "CargoUserAdmin" "CargoUserFinanceiro" "cargoPosVenda")
		entradaOperador2=$(zenity --list --title="${titulo[1]^^}" --text="${texto^}" --column "OPÇÕES" "${cargoOperadorLista[0]}"\
		--ok-label="Continuar" --cancel-label="SAIR" --window-icon="${icones}/building.png")
	sair # Chamando a função SAIR

	tipoDeEquipeOperadorLista=("B8 (Taguantiga Tarde)" "B9 (Cidade Jardins Tarde)" "B10 (Cidade Jardins Tarde)" "B11 (Cidade Jardins Tarde)" "B12 (Cidade Jardins Manhã)" "B13 (Cidade Jardins Manhã)" "B14 (Jardim Oriente Manhã)" "B15 (Jardim Oriente Manhã)" "B16 (Jardim Oriente Tarde)" "B17 (Jardim Oriente Tarde)" "B18 (Taguatinga Manhã)" "M4  (Contagem Tarde)" "M3  (Minas Manhã)" "M6  (Minas Tarde)" "G1  (Goiânia Tarde)" "P2   (Calebe)" "Pos Vendas (Valparaiso))")
		entradaOperador3=$(zenity --list --title="${titulo[2]^^}" --text="${texto^}" --column "OPÇÕES" "${tipoDeEquipeOperadorLista[@]}" --window-icon="${icones}/team.png")
	sair # Chamando a função SAIR
		#echo "${entradaOperador1}"

	periodoOperadorLista=("manha" "tarde")
		entradaOperador4=$(zenity --list --title="${titulo[3]^^}" --text="${texto}" --column "OPÇÕES" "${periodoOperadorLista[@]}" --window-icon=${icones}/sun.png)

	cargoComercial=("Gerente" "Supervisor" "Colaborador" "Admin Geral" "cabecaCesar")
		cargoEmpresa="$(zenity --list --title="Cargo Na Empresa" --text="Cargo" --column "Opção:" "${cargoComercial[@]}"  --window-icon=${icones}/sun.png)"
	sair # Chamando a função SAIR

		#printf '%s\n' "${entradaOperador1}" "${entradaOperador2}" "${entradaOperador3}" "${entradaOperador4}"
		enviandoDados "${entradaOperador1[@]}"
}
administrativo(){
	printf '%s\n' "CHAMOU O ADMINISTRATIVO"; sleep 5s

}

financeiro(){
	printf '%s\n' "CHAMOU O FINANCEIRO"; sleep 5s


}

posVendas(){
	printf '%s\n' "CHAMOU O POSVENDAS"; sleep 5s


}

funcaoEmpresa(){
	funcaoEmpresaLista=("operador" "administrativo" "financeiro" "pos Vendas")
	titulo="setor"
	texto="Cadastro"
	funcaoEmpresa="$(zenity --list --title="${titulo^^}" --text="${texto^}" --column "OPÇÕES:" "${funcaoEmpresaLista[@]^}"\
	--window-icon=${icones}/'function.png')"
	sair # Chamando a função SAIR
# Verificando a escolha do usuário, e chamando a função corrêspondente a escolha
	[[ "${funcaoEmpresa}" = "${funcaoEmpresaLista[0]^}" ]] && operador
	[[ "${funcaoEmpresa}" = "${funcaoEmpresaLista[1]^}" ]] && administrativo
	[[ "${funcaoEmpresa}" = "${funcaoEmpresaLista[2]^}" ]] && financeiro
	[[ "${funcaoEmpresa}" = "${funcaoEmpresaLista[3]^}" ]] && posVendas
# FIM
}

funcaoEmpresa # Chmando a função funcaoEmpresa

# APAGAR DADOS QUE TENHAM UMA SEQUENCIA DE 13X18 numeros
