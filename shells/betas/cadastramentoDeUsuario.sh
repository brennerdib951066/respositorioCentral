#!/usr/bin/env bash

# variaveis do programa
texto=("O que deseja fazer?" "Qual usuário deseja criar?" "Qual usuário deseja remover?" "Qual usuário deseja adicionar a senha?" "Qual usuário será removido a senha?")
titulo=("menu principal" "criar usuário" "Remover Usuário" "Adicionar Senha" "Remover Senha")
okLabel=("continuar")
cancelLabel=("sair")
nomeLabel=("Nome Usuário")
senhaLabel="Senha"
diretorioZenity="/usr/bin/zenity"
# FIM


[[ ! -e "${diretorioZenity}" ]] && ((UID>0)) && { echo -e "\E[31;1mPrecisa de permissão root para prosseguir...\E[m" ; sleep 2s; exit 1; }


printf '%s\n' "Bem vindo ${USER}"; sleep 1s

avisos(){
	entradaAviso="$(zenity --info --text="${@}" --title="Aviso")"
}

adicionarUser(){

	until false ; do
		nomeUsuario="$(zenity --text="${texto[1]^^}" --title="${titulo[1]^^}" --forms --add-entry="${nomeLabel}")"

		[[ -z "${nomeUsuario}" && ${?} -eq 0 ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
		[[ ${#nomeUsuario} -lt 4 ]] && { avisoUsuario="O usuário deve conter no mínimo 5 caracteres"; avisos "${avisoUsuario}"; sleep 2; continue ;  }
			nomeUsuario="${nomeUsuario,,}" # Transformando a variavel em minuscula
		break
	done
	pkexec useradd -m -c "${nomeUsuario}" -s /usr/bin/bash "${nomeUsuario}" &>- && { avisoUsuario="Usuário ${nomeUsuario} criado com sucesso"; avisos "${avisoUsuario}" ; sleep 2s; }
	menuInicial
}

removerUser(){
	until false; do
		entradaRemoverUsuario="$(zenity --text="${texto[2]^^}" --title="${titulo[2]^^}" --forms --add-entry="${nomeLabel}")"
		[[ -z "${entradaRemoverUsuario}" ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
		[[ ${#entradaRemoverUsuario} -lt 4 ]] && { avisoUsuario="O usuário deve conter no mínimo 5 caracteres"; avisos "${avisoUsuario}"; sleep 2; continue ;  }
			entradaRemoverUsuario="${entradaRemoverUsuario,,}" # Transformando a variavel em minuscula
		break
	done

	pkexec userdel -r "${entradaRemoverUsuario}" && { avisoUsuario="Usuário ${nomeUsuario} foi removido com sucesso"; avisos "${avisoUsuario}" ; sleep 2s; } || { avisoUsuario="Usuário ${nomeUsuario} não foi encontrado ou está em processo no shell"; avisos "${avisoUsuario}" ; sleep 2s; }
	menuInicial
}

adicionarSenha(){
	until false; do
	entradaSenhaUsuario="$(zenity --text="${texto[3]^^}" --title="${titulo[3]^^}" --forms --add-entry="${nomeLabel}"\
	--forms --add-password="${senhaLabel}"\
	--separator=',')"
		[[ -z "${entradaSenhaUsuario}" ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
			[[ ${#entradaSenhaUsuario} -lt 4 ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
			entradaSenhaUsuario="${entradaSenhaUsuario,,}"  # Transformando a variavel em minuscula
			break
	done
			readarray -d',' -t SENHA <<< ${entradaSenhaUsuario}
			echo "${SENHA[@]}"

			SENHA[1]="$(echo -e "${SENHA[1]}\n${SENHA[1]}")"
			echo "${SENHA[1]}"

			pkexec chpasswd <<<"${SENHA[0]}:${SENHA[1]}" &>- || { avisoUsuario="Senha Adicionada com sucesso!"; avisos "${avisoUsuario}" ; sleep 2 ;}

	#passwd "${SENHA[0]}" <<< "${SENHA[1]}"

	#{ avisoUsuario="A senha foi adicionada! para ${nomeUsuario}"; avisos "${avisoUsuario}" ; sleep 2s; } || { avisoUsuario="Usuário ${nomeUsuario} não foi encontrado"; avisos "${avisoUsuario}" ; sleep 2s; }
	menuInicial

}

RemoverSenha(){
	until false; do
	entradaRemoverSenhaUsuario="$(zenity --text="${texto[4]^^}" --title="${titulo[4]^^}" --forms --add-entry="${nomeLabel}"\
	--separator=',')"
		[[ -z "${entradaRemoverSenhaUsuario}" ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
			[[ ${#entradaRemoverSenhaUsuario} -lt 4 ]] && { avisoUsuario="Sua resposta não pode ser vazia"; avisos "${avisoUsuario}" ; sleep 2; continue ;  }
			entradaRemoverSenhaUsuario="${entradaRemoverSenhaUsuario,,}"  # Transformando a variavel em minuscula
			break
	done

			pkexec passwd -d "${entradaRemoverSenhaUsuario}" &>- && { avisoUsuario="Senha Removida com sucesso!"; avisos "${avisoUsuario}" ; sleep 2 ;}

	#passwd "${SENHA[0]}" <<< "${SENHA[1]}"

	#{ avisoUsuario="A senha foi adicionada! para ${nomeUsuario}"; avisos "${avisoUsuario}" ; sleep 2s; } || { avisoUsuario="Usuário ${nomeUsuario} não foi encontrado"; avisos "${avisoUsuario}" ; sleep 2s; }
	menuInicial

}

type -P "${diretorioZenity}" || { avisoUsuario="Para utilizar esse programa instale o zenity"; avisos "${avisoUsuario}"; exit 1 ;}  # Verificando se o usuário contem o zenity intalado!
menuInicial(){
	local listaMenu=("Adicionar Usuário" "Remover Usuário" "Adicionar Senha Ao Usuário" "Remover Senha Do Usuário")
	entradaMenuInicial="$(zenity --list --text="<b>${texto[0]^^}</b>" --title="${titulo[0]^^}" --column "Opções:" "${listaMenu[@]}" --ok-label="${okLabel[0]^^}" --cancel-label="${cancelLabel[0]^}")"

	chamarFuncaos

}

menuInicial # Chamando a função de MENUINICIAL

chamarFuncaos(){
		{ echo "ESTOU PARA CHAMAR AS FUNCOES"; sleep 2s ;}
		case ${entradaMenuInicial} in
			"Adicionar Usuário")                    echo "ADICIONAR"      ; adicionarUser                  ;;
			"Remover Usuário")                      echo "REMOVER"        ; removerUser                    ;;
			"Adicionar Senha Ao Usuário")           echo "ADICIONAR SENHA"; adicionarSenha                 ;;
			"Remover Senha Do Usuário")           	echo "REMOVER SENHA"  ; RemoverSenha                   ;;
			*) exit 0
		esac
}
chamarFuncaos
#menuPrincipal # Chamando a função MENUPRINCIPAL para chmar outras funções
