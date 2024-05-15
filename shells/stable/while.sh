#!/usr/bin/env bash

#Criando as cores
abrirCorVD="\033[32;1m"
fecharCorVD="\033[m"
abrirCorVM="\033[31;1m"
fecharCorVM="\033[m"
abrirCorAM="\033[33;1m"
fecharCorAM="\033[m"

abrirCorRS="\033[35;1m"
fecharCorRS="\033[m"


#Criando um loop para verificar se não está vazia a variavel, caso queira o oposto colocar !

# loop="LUPANDO!"
#
# while [[ "$loop" ]]; do
#       echo -e "Epah está vazia a variavel $abrirCorVM $loop $fecharCorVM"
#
# done && echo -e "Agora sim\nEsta é a variavel: $abrirCorVD $loop $fecharCorVD"

#Criando o loop for bascar buscar uma lista

nomes=("nome" "telefone" "estado")
wi=1

for lista in "${nomes[@]}"; do
        while [[ ! "${lista[wi]}" ]]; do
        echo -e "Qual é seu $abrirCorVM ${lista} $fecharCorVM?"
        read lista[$wi]

        done
        ((wi++))

done &&
echo -e ""$abrirCorVD"_______________________________"$fecharCorVD""
echo -e ""$abrirCorVD"      Dados Recebidos: "$fecharCorVD""
echo -e ""$abrirCorVD"_______________________________"$fecharCorVD"
"$abrirCorAM""${nomes[0]^}": "${lista[1]}""$fecharCorAM"
"$abrirCorAM"${nomes[1]^}"':' ${lista[2]}""$fecharCorAM"
"$abrirCorAM"${nomes[2]^}"':'  ${lista[3]}""$fecharCorAM"
"$abrirCorRS"_______________________________"$fecharCorRS""
