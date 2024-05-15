#!/usr/bin/env bash

#Variaveis de cores
abrirCorVM="\033[31;1m"
fecharCorVM="\033[m"

abrirCorVD="\033[32;1m"
fecharCorVD="\033[m"
#Criando arquivo com variavel
arquivo="psIDS.txt"



#Criando Variavel de ps ID
ID="$(ps -e | grep -i "telegram")"
fechar1="$ID"
echo "$fechar1" | cut -d " " -f"4" >> "$arquivo"

#Criando uma variavel para ler o arquivo para buscar o ID para o KILL

killar="$(cat $arquivo)" && kill "$killar"

# #Criando Variavel para criar um arquivo para receber os dados
# arquivoDados="psIDS.txt"
#
# until [[ "$ID" = 0 ]]; do
#         sleep 2s
#         echo -e "Está em execução com ID: $abrirCorVD "$ID"  $fecharCorVD" >> "$arquivoDados"
#         fechar="$(cut -d " " -f"8" "$arquivoDados")"
#         sleep 2s
#         kill $fechar
#
#
# done
