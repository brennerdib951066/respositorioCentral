#!/usr/bin/env bash

#Criando variaveis de cores

abrirCorVM="\033[31;1m"
fecharCorVM="\033[m"
abrirCorVD="\033[32;1m"
fecharCorVD="\033[m"

#Criando variavel para buscar uma lista de arquivos
buscarArquivos=( /home/brenner/'Área de Trabalho'/Backups/** )
filtro="filtro.txt"
descricao="Olá mundo"
CHAT_IDBackup="-1001831122226"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"


#Criando uma variavel para verificar se existe
#arquivoFiltro="filtroTelegram.txt"

#Criando teste para ver se o arquivo existe, caso nao exista cria-lo

[[ ! -e "$filtro" ]] && >> "$filtro" && echo "Arquivo $filtro criado!" || echo "O arquivo ${filtro^^} JA EXISTE"

for lista in "${buscarArquivos[@]}"; do
        if ! grep -iq "${lista[@]}" "$filtro"; then
               curl -s -F chat_id="$CHAT_IDBackup" -F caption="$descricao" -F document=@"$lista" https://api.telegram.org/bot$TOKEN/sendDocument
                          echo "${lista[@]}" >> "$filtro"
        else
                echo "Tudo repetido"
        fi

done

#Testando a busca pelo for



#Criando a variavel para retirar caracteres especiais, recebendo a lista do for
