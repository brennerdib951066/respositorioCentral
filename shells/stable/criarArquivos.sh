#!/usr/bin/env bash

##############variaveis do programa###############
pastaScripts="$HOME/Área de Trabalho/scripts"
pastaPython="$HOME/Área de Trabalho/pythons"
abrirCorVermelhar="\E[31;1m"
fecharCor="\E[m"
chave=1 ##### 0 é desligdo 1 é ligado
erro='chave desativada no momento'
nomeDoArquivo="Nome do Arquivo:"
PS3=("Escolha uma das opções:   " "Arquivo será salvo em:   ")
#################################################

###############Verificacoes###########################################
(($UID==0)) && { echo 'Tu é besta é? Saindo...'; sleep 1s ; exit 1 ;}

#######################################################################

criarPasta(){
	mkdir "${@#*=}" && echo -e "\E[31;3mPasta ${@} criada com sucesso!\E[m" || echo -e "\E[31;1mAlgo deu errado\E[m"

}



if ((chave==1)); then
function menuPrincipal(){
PS3="${PS3[0]}"
select menu in "SH" "Python"; do
    case $REPLY in
        1) escolhi="shell"; echo -e "\n";\
         break;;
        2) escolhi="python"; echo -e "\n";\
         break;;
    esac
done
if [[ $REPLY -eq 1 ]]; then
PS3="${PS3[1]}"
	select pastaDesejaCriar in "Stable" "Betas" "praticas"; do
			case $REPLY in
					1) [[ ! -d "${pastaScripts}/stable"  ]] && criarPasta pastaScripts="${pastaScripts}/stable" || pastaScripts="${pastaScripts}/stable"; break ; ;;
					2) [[ ! -d "${pastaScripts}/betas"  ]] && criarPasta pastaScripts="${pastaScripts}/betas" || pastaScripts="${pastaScripts}/betas" ; break ; ;;
					3) [[ ! -d "${pastaScripts}/praticas"  ]] && criarPasta pastaScripts="${pastaScripts}/praticas" || pastaScripts="${pastaScripts}/praticas"; break ;;
					* ) printf '%s\n' "Opção não existe!"           ;;
			esac

	done
elif [[ $REPLY -eq 2 ]]; then
PS3="${PS3[1]}"
	select pastaDesejaCriar in "bubble" "estruturaDeDecisao" "exerciciosLira" "praticas" ; do
	      case $REPLY in 
	          1) { pastaPython="${pastaPython}/bubble"             ; break  ;} ;;
	          2) { pastaPython="${pastaPython}/estruturaDeDecisao" ; break  ;} ;;
						3) { pastaPython="${pastaPython}/exerciciosLira"     ; break  ;} ;;
						4) { pastaPython="${pastaPython}/praticas"           ; break  ;} ;;
	          * ) printf '%s\n' "Opção não existe!"
	      esac

	done
else
				printf '%s\n' "Opção invalida!"
fi
}
menuPrincipal                                     #Chamando a função menuPrincipal
function criarArquivosScripts(){
    until false; do
        read -p $'\E[31;1mNome do arquivo:\E[m   ' nomeArquivoSH
        [[ "$nomeArquivoSH" ]] && break || continue
    done
        >"${pastaScripts}/$nomeArquivoSH.sh" && chmod +x "${pastaScripts}/$nomeArquivoSH.sh"\
        &&\
        cat>>"${pastaScripts#*=}/$nomeArquivoSH.sh"<<EOF
#!/usr/bin/env bash

											  # HEAD
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

								# VARIAVEIS DO PROGRAMA
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

					# VARIAVEIS ESPECIAIS DO PROGRAMA
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

										# VERIFICAÇÕES
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################
EOF
        kate "${pastaScripts}/$nomeArquivoSH.sh" &>- &
        clear

}
[[ "${escolhi}" = "shell" ]] && criarArquivosScripts                      #Chamando a função criarArquivosScripts

function criarArquivosPython3(){
    until false; do
    read -p $'\E[31;1mNome do arquivo:\E[m   ' nomeArquivoPY
        [[ "$nomeArquivoPY" ]] && break || continue
    done
        >"${pastaPython}/$nomeArquivoPY.py" && chmod +x "${pastaPython}/$nomeArquivoPY.py"\
        &&\
        cat>>"${pastaPython}/$nomeArquivoPY.py"<<EOF
#!/usr/bin/env python3

									# VARIAVEIS DO PROGRAMA
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################
EOF
        kate "${pastaPython}/$nomeArquivoPY.py" &>- &
        clear
}
[[ "${escolhi}" = "python" ]] && criarArquivosPython3                   #Chamando a função criarArquivosPython3
else
    #echo "A chave está desligada no momento"
    notify-send -u 'normal' -t '7000' 'ERRO DE CHAVE' "${erro^}"
fi





