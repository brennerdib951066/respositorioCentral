#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################
arquivo1="$HOME/Área de Trabalho/estudar.txt"
arquivo2="$HOME/Área de Trabalho/estudar2.txt"
qtd1=$(wc -l <"${arquivo1}")
qtd2=$(wc -l <"${arquivo2}")
abrirCorVermelha="\E[31;2m"
abrirCorVerde="\E[32;2m"
abrirCorAmarela="\E[33;4m"
fecharCor="\E[m"
prints=("É Diferente" "\1" "\2")
##########################################################

if [[ "${qtd1}" != "${qtd2}" ]]; then
    for listaPrints in "${prints[@]}"; do
        echo -e "${abrirCorAmarela}${listaPrints}${fecharCor}"
    done
    verlinhas(){
   { echo -e "${abrirCorVerde}\1 As 10 Primeiras:${fecharCor}"; head "${arquivo1}" ; echo -e "${abrirCorVermelha}\1 As 10 Ultimas:${fecharCor}"; tail "${arquivo1}" ;}

   }
   verlinhas ### Chamando a funcao VERLINHAS
else
    echo "É igual"
    echo "\1 ${qtd1}"
    echo "\2 ${qtd2}"
fi
#headar=$(head -n 1)
while IFS= read arquivinho; do
        echo -e "ARQUIVINHO\n"
        echo "${arquivinho}" | head -n1 "${arquivinho}"
done <"${arquivo1}"
