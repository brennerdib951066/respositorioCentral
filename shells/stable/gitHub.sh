#!/usr/bin/env bash

pasta=".git"
abrirCorBranca="\E[37;1m"
fecharCor="\E[m"
chave="1" # 0 é desligado / 1 é ligado

[[ "${chave}" = "1" && -e "${pasta}" ]] && \
{ rm -rf "$HOME/Área de Trabalho/scripts/${pasta}"; echo -e "${abrirCorBranca}Pasta "$HOME/Área de Trabalho/scripts/${pasta}" excluida com sucesso${fecharCor}"; sleep 1s ;}
arquivoEntrada="bibliotecas/gitHub.txt"

#mapfile -t arquivoArray < "$arquivoEntrada"

#echo -e "\E[31;1mArquivo Array ${arquivoArray[0]}\E[m"

#i="0"
source "${arquivoEntrada}"

