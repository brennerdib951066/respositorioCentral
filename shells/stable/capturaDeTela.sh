#!/usr/bin/env bash

#Variaveis do programa
caminhoCapturaDeTela="$HOME"
nomePrograma="DIBTela"

####################
echo -e $"\E[31;5mBem vindo ao programa $nomePrograma\E[m"
read -p $'\E[33;1mOnde deseja salvar sua captura de tela?\E[m  ' diretorio
read -p $'\E[33;1mEscreva o nome do arquivo que deseja\E[m   ' nomeArquivo

/usr/bin/flameshot gui -s -p $caminhoCapturaDeTela/"$diretorio"/$nomeArquivo >&- &&\
echo -e "\E[31;1mO arquivo \E[32;1m$nomeArquivo\E[m foi salvo com sucesso\E[m"
