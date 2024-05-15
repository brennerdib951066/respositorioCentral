#!/usr/bin/env bash

(($UID==0)) && { echo "Opah deixa de ser otario, aqui não!" ; exit 1 ;}
lista=("google" "telegram" "code" "sair")

function boasVindas(){
	echo $'\E[37;1mEsse programa é para seber onde fica o binário do programa em questão\E[m\nCaso o binário nao esteja no diretorio padrão do sistema, será mostrado se é Flatpak, snap ou apt'
	read -p 'Deseja continbuar? [S/n]   ' continuar
	[ -z ${contiuar} ] && continuar="${continuar,,}"
	[[ ${continuar} =~ [nN] ]] && exit 1
	sleep 1.5s
	

}
boasVindas

echo $'\E[31;2mQual app deseja saber?\E[m'
PS3=$'\nEscolha uma das opções:   '
select menu in "${lista[@]}"; do
	case $REPLY in
		1) if ! type -P "${lista[0]}";then
		   		echo "Não encontramos o ${lista[0]} no diretorio padrao"
		   	if ! flatpak list | grep -iq "${lista[0]}"; then
		   		echo "Infelizmente seu ${lista[0]} tambem não é FLATPAK"
		   	   else
		   	      { echo $'\E[31;2mOpah achamos seu app google no flatpak\E[m\nTire suas conclusões em: \E[32;5mflatpak list\E[m'; exit 1 ;}
		   	fi
		   		if snap list | grep -iq "${lista[0]}"; then
		   			echo "O ${lista[0]} é snap"
		   		    else
		   		    	echo "O ${lista[0]} deve ser o APT"
		   		fi
		   else
		   		echo "O ${lista[0]} contem no diretorio padrao"
		   fi;;
		2) if ! type -P "${lista[1]}";then
		   		echo "Não encontramos o ${lista[1]} no diretorio padrao"
		   	if ! flatpak list | grep -iq "${lista[1]}"; then
		   		echo "Infelizmente seu ${lista[1]} tambem não é FLATPAK"
		   	   else
		   	      { echo $'\E[31;2mOpah achamos seu app telegram no flatpak\E[m\nTire suas conclusões em: \E[32;5mflatpak list\E[m'; exit 1 ;}
		   	fi
		   		if snap list | grep -iq "${lista[1]}"; then
		   			echo "O ${lista[1]} é snap"
		   		    else
		   		    	echo "O ${lista[1]} deve ser o APT"
		   		fi
		   else
		   		echo "O ${lista[1]} contem no diretorio padrao"
		   fi;;
		   
		   3) if ! type -P "${lista[2]}";then
		   		echo "Não encontramos o ${lista[2]} no diretorio padrao"
		   	if ! flatpak list | grep -iq "${lista[2]}"; then
		   		echo "Infelizmente seu ${lista[2]} tambem não é FLATPAK"
		   	   else
		   	      { echo $'\E[31;2mOpah achamos seu app VsCode no flatpak\E[m\nTire suas conclusões em: \E[32;5mflatpak list\E[m'; exit 1 ;}
		   	fi
		   		if snap list | grep -iq "${lista[2]}"; then
		   			echo "O ${lista[2]} é snap"
		   		    else
		   		    	echo "O ${lista[2]} deve ser o APT"
		   		fi
		   	else
		   		echo "O ${lista[2]} contem no diretorio padrao"
		   	fi;;
		   	
		   4) exit 0 ;;
		   
		   *) echo "Opção não exite!"
	
	
	esac
done

