#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################



##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################
shopt -s extglob

perguntas()
{
			local i="0"
			while :; do
				read -p 'Escreva sequencia de 5 numeros de 0/10:  ' resposta[i]
					[ ! "${resposta}" ] && { echo "Escreva algum numero!!!"; sleep 2 ; continue  ;}
					[ "${resposta[i]}" -gt "10" ] && { echo "Aceito apenas numero de 0/10..."; sleep 2s; continue ;}
					((i++))
					[ "${i}" -eq "5" ] && break
				echo "O valor de I é de: ${i}"
			done
}
perguntas

adivinhei()
{
	printf '%s\n%s\n' "1 posição: ${resposta[0]}" "2 posição: ${resposta[1]}" "3 Posição: ${resposta[2]}" "4 Posição: ${resposta[3]}" "5 Posição: ${resposta[4]}"
}

{ echo "Vendo as posições de seus numeros"; sleep 5s ;} && adivinhei "${@}"

printf '%s\n'  "Aposto que acertei né???"
read -p $'Vamos brincar novamente? [S/n]  ' brincar
[[ ! "${brincar}" || "${brincar}" = @(s|S) ]] && perguntas || printf '%s\n%s\n' "Legal! Obrigado por me usar!" "Até Mais"
