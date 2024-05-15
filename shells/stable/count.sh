#!/usr/bin/env bash

#########################HEAD#####################################################################################
# AUTOR: Brenner Santos
# DATA BETA: 29/11/2023
# VERSÃO : 1.0.0.0.1
#                       PROGRAMA :
# DESCRIÇÃO:
# Programa ainda está em fase beta.
# Tem como objetivo acrecentar o nono digito em numeros telefonicos
# Para funcionar corretamente tenha pelo menos 12 digitos nos numeros as quais queira modificar
# Com o nono digito os numeros telefonicos passarão a ter os 13 digitos convêncionais
##################################################################################################################

####################VARIAVEIS COMUNS DO PROGRAMA##################################################################
buscandoFora="/home/brenner/Área de Trabalho/scripts/bibliotecas/whatsApp.txt"
arquivo="/home/brenner/Downloads/viverBemPlanilhas/txts/goFiltrados.txt"
saidaArquivo="/home/brenner/Downloads/viverBemPlanilhas/txts/login.txt"

##################################################################################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA###############################################################



##################################################################################################################

####################VERIFICAÇÕES##################################################################################
((UID==0)) && { printf "Sem ROOT por favor..."; clear ; exit 1; }
[ ! -e "${arquivo}" ] && { printf "Não encontrei o arquivo ${arquivo}...\nSaindo do programa!"; clear ; exit 1;}

##################################################################################################################

if ! saida=$(grep --color -Ewo '[0-9]{12}' "${arquivo}"); then
    printf "\E[37;1m Falhou seu grep!!!! \E[m\n"
else
    i=0
    readarray -t digitos <<<"${saida}"
    #echo ${digitos[0]}
    for digito in ${digitos[@]} ;do
        #sleep 2s
            read digito[$i] <<<${digito}
            printf "DIGITO ${digito[i]}\n"
            quatroDigitos="${digito[i]:0:4}"
            nonoDigito=${quatroDigitos/$quatroDigitos/${quatroDigitos}9${digito[i]:4}}
            sed -Ei "s/(${digito[i]})/${nonoDigito}/" "${arquivo}"
            ((i++))
    done

    source "${buscandoFora}"
fi
