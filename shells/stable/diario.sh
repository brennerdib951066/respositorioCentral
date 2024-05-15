#!/usr/bin/env bash

###################################################HEAD#########################################################



################################################################################################################
######################################VARIAVEIS COMUNS DO PROGRAMA##############################################
arquivo="/home/brenner/append.txt"
textoListagem="listagem :"
textoExclusao="esclusão :"
textoPesquisar="pesquisar :"
textoAjuda="ajuda :"
arquivoDeAjuda="bibliotecas/ajuda"
textoVerificandoCredenciais="Verificando suas credenciais aguarde..."
################################################################################################################
#####################################VARIAVEIS ESPECIAIS DO PROGRAMA############################################
credenciais=('Nome :  ' 'Senha :   ')


################################################################################################################

#####################################VERIFICAÇÕES###############################################################
((UID==0)) && { printf "%s\n" "Esse programa não aceita root!";  exit 1  ;}

acesso()
{
                i=0
                for credencial in "${credenciais[@]}" ; do
                        echo -e "\E[37;1m${credencial}\E[m"
                        ((i==1)) && read -s acesso[i] || read acesso[i]
                        ((i++))
                        #echo "${acesso[i]}"
                done

                [[ "${acesso[0]}" != "${nome}" || "${acesso[1]}" != "${senha}" ]] && acesso || { printf "${textoVerificandoCredenciais}\n"; sleep 2s ; clear ;}
}
acesso # Chamando a função de verificação para ver as credenciais de acesso
################################################################################################################

#####################################FUNÇÕES DO PROGRAMA####################################################################

printar(){
                shopt -s checkwinsize
                (:)
                printf -v line "%${COLUMNS}s"
                echo "${line// /-}"
                printf '%-8s %s\n' "${1}" "${2}"
                echo "${line// /-}"
}

listar(){
                mapfile -t -c1 -C printar arquivoBase < "${arquivo}"
                #printf "%s\n" "${arquivoBase}\n"
}

deletar(){
                mapfile -t -c1 -C printar arquivoBase < "${arquivo}"
                #printf "%s\n" "${arquivoBase}\n"
}

pesquisar(){
                mapfile -t -c1 -C printar arquivoBase < "${arquivo}"
                #printf "%s\n" "${arquivoBase}\n"
}

ajuda(){
                echo -e "                              MANUAL DE AJUDA
 PROGRAMA DIARIO:
OPÇÕES:

 -l | --lista     = Listará o seu diário completamente

 -d | --deletar   = Deletará uma linha a qual você escolher em relação a numeração da linha correspondente

 -p | --pesquisar = Pesquisará a linha correspondente de acordo com as palavras que inserir na pesquisa

 -a | --ajuda     = Mostrará ajuda de acordo com essse manual

\E[31;4mSempre será mostrado esse manual se quando o programa for chamado e não haver nenhuma opção junto dele!\E[m
"
}
################################################################################################################


case $1 in
        -[lL] | --[lL]istar    ) { printf  "\E[37;1m${textoListagem^^}\E[m\n"    ;  listar     ;} ;;
        -[dD] | --[dD]eletar   ) { printf  "\E[37;1m${textoExclusao^^}\E[m\n"    ;  deletar    ;} ;;
        -[pP] | --[pP]esquisar ) { printf  "\E[37;1m${textoPesquisar^^}\E[m\n"   ;  pesquisar  ;} ;;
        -[aA] | --[aA]juda | * ) { printf  "\E[37;1m${textoAjuda^^}\E[m\n"       ;  ajuda      ;} ;;

esac

