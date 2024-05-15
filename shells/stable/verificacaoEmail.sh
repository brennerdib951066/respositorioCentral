#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
abrirCorVermelha="\E[31;1m"
abrirCorVerde="\E[32;1m"
abrirCorBranco="\E[37;1m"
fecharCor="\E[m"
email="akeboshi@email.com"
arquivo="emailUsuario.txt"
##########################################################

# shopt -u extglob # Ativando o extglob para retirar qualquer espaço inicial e final do email recebido do usuario
# shopt extglob
###################Retirando qualquer espaço do email do usuario ##############
read -p $'\E[31;2mEmail\E[m:   ' emailUsuario
# emailUsuario="${emailUsuario//(^ )/}"
# emailUsuario="${emailUsuario//( )$/}"
##############################################################################~
printf "${emailUsuario}" >> "${arquivo}"
{ printf "${abrirCorBranco}Verificando seu email${fecharCor}\nAguarde..." ;}
if [[ ! "${emailUsuario}" =~ [@](gmail|hotmail|email)+[0-9]+?(.com)(.br)? ]]; then
        printf  "${abrirCorVermelha}Ops parece que email digitado está errado${fecharCor}\n"
else
        printf "${abrirCorVerde}Email válido! ${emailUsuario}${fecharCor}\n"
fi

printf "logado com sucesso\n"
