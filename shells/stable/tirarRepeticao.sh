#!/usr/bin/env bash

#Variaveis

remover(){
while [[ -z "$removerDados" ]];do
        read -p $'Qual linhas/colunas deseja remover?   ' removerDados
done
echo -e "Realmente de seja remover a linha\033[31;1m $removerDados\033[m?"
while [[ -z "$confirmar" ]];do
        read -p "Confirme(S/n)  " confirmar
        [[ "$confirmar" = n ]] && { echo "Saí do programa!"; exit 1 ;}
done

while [[ -z "$arquivo" ]] || { [[ ! -e "$arquivo"  ]] && echo -e "\033[31;1mEsse arquivo nao existe\033[m" ;} ;do
        read -p "Qual é o arquivo para retirar esses dados?   " arquivo

done

while [[ -z "$arquivoSaida" ]];do
    read -p "Agora escolha o nome do arquivo que recerá esses dados   " arquivoSaida
done
sort -t',' -u -k"$removerDados","$removerDados" "$arquivo" > "$arquivoSaida" && echo -e "\033[32;1mRepetições retiradas com sucesso!\033[m"
}
remover
