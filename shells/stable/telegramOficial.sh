#!/usr/bin/env bash

#variaves de cores

abrirCor="\033[31;1m"
fecharCor="\033[m"
abrirCorVm="\033[32;1m"
fecharCorVm="\033[m"

### Variaveis para ser usadas.
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
CHAT_IDFuncionalidade="-1001171658969"
CHAT_IDJeff="-1001858369092"
CHAT_IDViverBem="-1001712599470"
CHAT_IDBackup="-1001831122226"
CHAT_IDAmizades="-1001169987124"
FILES=( /home/brenner/'Área de Trabalho'/Backups/**/*)
enviados=/home/brenner/'Área de Trabalho'/enviadosTelegram.txt


[[ ! -e "$enviados" ]] && > "$enviados"

# while [[ -z "$descricao" ]]; do
# read -p "Deseja por alguma descricao nos arquivos? escreva aqui...    " descricao
# done &&
#
# while [[ -z "$apagarTexto" ]]; do
# read -p "Quer apagar o texto do arquivo de verificação[S/n]?" apagarTexto
# if [[ "$apagarTexto" = "S" ]]; then
# > "$enviados"
# else
# echo "Opah Prosseguindo"
# fi
# done

>>funcionou.txt
menu=("slackjeff" "funcionalidade" "viver bem seguros" "Backup" "Amizades")
 echo "Escolha onde deseja enviar seus arquivo"

 select enviarArquivos in "${menu[@]}"; do
     case "${enviarArquivos[@]}" in
        slackjeff) for file in "${FILES[@]}"; do

                   if ! grep -iq "${file}" "$enviados"; then
                   sleep 3s
                         curl -s -F chat_id="$CHAT_IDJeff" -F caption="$descricao" -F document=@"$file" https://api.telegram.org/bot$TOKEN/sendDocument
                         echo -e "$abrirCor $file $fecharCor Criando com sucesso!"
                         echo "${file}" >> "$enviados"
                   else
                         echo -e "$abrirCorVm $file $fecharCorVm Ja existe $abrirCor"${file##*/}"$fecharCor" #Adicionando cor vermelha e eliminando o padrao de / para aparecer apenas o o nome do arquivos em vez de ser todo o caminho
                   fi

                   done && break                                        ;; # Parando loop inteiro
        funcionalidade) for file in "${FILES[@]}"; do
                   if ! grep -iq "${file[@]}" "$enviados"; then
                   sleep 3s
                         curl -s -F chat_id="$CHAT_IDFuncionalidade" -F caption="$descricao" -F document=@"${file##*/}" https://api.telegram.org/bot$TOKEN/sendDocument
                         echo "${file[@]}" >> enviadosTelegram.txt

                   else
                         echo -e "Ja existe um $abrirCorVm arquivo $fecharCorVm com esse nome: $abrirCor"${file##*/}"$fecharCor" #Adicionando cor vermelha e eliminando o padrao de / para aparecer apenas o o nome do arquivos em vez de ser todo o caminho
                   fi

                   done && break                                         ;; # Parando loop inteiro

        "viver bem seguros") for file in "${FILES[@]}"; do
                   if ! grep -iq "${file[@]}" "$enviados"; then
                         sleep 3s
                         curl -s -F chat_id="$CHAT_IDViverBem" -F caption="$descricao" -F document=@"$file" https://api.telegram.org/bot$TOKEN/sendDocument
                         echo "${file[@]}" >> enviadosTelegram.txt
                   else
                         echo -e "Ja existe um $abrirCorVm arquivo $fecharCorVm com esse nome: $abrirCor"${file##*/}"$fecharCor" #Adicionando cor vermelha e eliminando o padrao de / para aparecer apenas o o nome do arquivos em vez de ser todo o caminho
                   fi

                   done && break                                         ;;

        Backup)  for file in "${FILES[@]}"; do
                   if ! grep -iq "${file[@]}" "$enviados"; then
                   sleep 3s
                         curl -s -F chat_id="$CHAT_IDBackup" -F caption="$descricao" -F document=@"$file" https://api.telegram.org/bot$TOKEN/sendDocument
                         echo "${file[@]}" >> enviadosTelegram.txt
                   else
                         echo -e "Ja existe um $abrirCorVm arquivo $fecharCorVmcom esse nome: $abrirCor"${file##*/}"$fecharCor" #Adicionando cor vermelha e eliminando o padrao de / para aparecer apenas o o nome do arquivos em vez de ser todo o caminho
                   fi

                   done && break                                         ;;

        Amizades)  for file in "${FILES[@]}"; do
                   if ! grep -iq "${file[@]}" "$enviados"; then
                   sleep 3s
                         curl -s -F chat_id="$CHAT_IDAmizades" -F caption="$descricao" -F document=@"${file##*/}" https://api.telegram.org/bot$TOKEN/sendDocument
                         echo "${file[@]}" >> enviadosTelegram.txt
                   else
                         echo -e "Ja existe um $abrirCorVm arquivo $fecharCorVm com esse nome: $abrirCor"${file##*/}"$fecharCor" #Adicionando cor vermelha e eliminando o padrao de / para aparecer apenas o o nome do arquivos em vez de ser todo o caminho
                   fi

                   done && break                                        ;;

              *) echo "Não encontramos essa opção!"                     ;;
     esac

 done
