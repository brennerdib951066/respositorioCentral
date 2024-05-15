#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
diretorio="/home/brenner/Downloads"
viverBem="$diretorio/viverBemPlanilhas"


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################

listar=$(ls ${viverBem})
readarray -t vetor <<<"${listar}"

echo "VETOR ${vetor[0]}"

for renomear in "${vetor[@]}" ;do
    #i="0"
    sleep 3s
    if [[ ! -e "${viverBem}/planilha${i}.csv" ]] ; then
        mv "${viverBem}/${renomear}" "${viverBem}/planilha${i}.csv"
    else
        printf "\E[31;1mO arquivo ${viverBem}/planilha${i}.csv ja existe\E[m"
    fi
    ((i++))
    echo "INCREMNTE ${i}"
done
