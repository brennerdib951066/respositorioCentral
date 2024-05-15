#!/usr/bin/env bash

#excluir="
#--exclude=/home/estudar/Telegram Desktop"
read -p $'\E[31;1mQual pasta deseja fazer backup?\E[1m  ' pastaBackup
read -p $'\E[31;1m Qual Sera o nome do arquivo?\E[m  ' nomeArquivo

tar cvfJ "$nomeArquivo.tar.gz" "$pastaBackup"
