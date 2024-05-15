#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################



##########################################################
#######Retornado o valor de uma variavel caso esteja nula
until [ "${dadinho}" ]; do
    read -p 'nome:  ' dadinho
    echo -e "${dadinho:-Sua variavel está vazia}\n"
done
#######Defina/Salve o valor de uma variavel caso esteja nula
echo -e "${outros:=dados}\n"
echo -e "Chamando a variavel \$outros ${outros}\n"

#####Retorne o valor de texto caso a variavel nao exista ou esteja vazia

echo -e "${variavel:?'Entre com dado(s)!'}\n"

#######Retornaero valor de uma variavel caso esteja com conteudo
varzinha="sou"
echo -e "${varzinha:+'itsumojo'}\n"
