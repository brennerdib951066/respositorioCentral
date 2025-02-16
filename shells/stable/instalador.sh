#!/usr/bin/env bash

#########################HEAD########################################################



#####################################################################################

####################VARIAVEIS COMUNS DO PROGRAMA#####################################
visualCode="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
firefox="https://www.mozilla.org/pt-BR/firefox/download/thanks/"
mysql="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.34-1ubuntu22.04_amd64.deb"
googleChrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
diretoriosInstalacoes=("/tmp/code" "/tmp/firefox" "/tmp/mysql" "/tmp/googleChrome")
#####################################################################################

####################VARIAVEIS ESPECIAIS DO PROGRAMA##################################
listaMenu=('visual code' 'firefox' 'mysql' 'google-chrome' 'Sair')


#####################################################################################

###########################VERIFICAÇÕES###############################################
for diretorio in "${diretoriosInstalacoes[@]}"; do
	[[ ! -e "${diretorio}" ]] && { mkdir "${diretorio}"; echo "\E[31;1mO ${diretorio} Criado com sucesso!\E[m" ;}
done


#####################################################################################

PS3="Opção :   "
select menu in "${listaMenu[@]}"; do
	case $REPLY in
				1) if ! wget "${visualCode}" -O "${diretoriosInstalacoes[0]}/${visualCode##*/}"; then
									echo "A instalação de Visual Studio falhou" 
					 fi
					 if ! dpkg -i "${diretoriosInstalacoes[0]}/${visualCode##*/}"; then
										echo "Falhou a sua instalção de visual!"
					 fi  
				   ;;
				2) if ! snap install "${listaMenu[1]}"; then
									echo "A instalação de firefox falhou"
					 fi
				   ;;
				3) if ! dpkg -i "${diretoriosInstalacoes[2]}/${mysql##*/}"; then
									echo "Falhou a instalação de mysql"
					 fi
					 ;;
				4) if ! wget "${googleChrome}" -O "${diretoriosInstalacoes[3]}/${googleChrome##*/}"; then
									echo "Sua instalação do chrome falhou"
					fi
					if ! dpkg -i "${diretoriosInstalacoes[3]}/${googleChrome##*/}"; then
									echo "Google iinstalado com sucesso!" ;
					fi
					;;
					5) { echo "Saindo..."; sleep 2s; break ;}
					;;
					*) echo "Não encontrei essa opção!"
					;;
	esac

done
