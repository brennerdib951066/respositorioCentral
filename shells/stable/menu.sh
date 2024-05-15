#!/usr/bin/env bash

#Criando a variavel de teste
#Para testar no select
#Ela será de lista

menuLista=("Brenner" "Denner" "Brenda"  "Daniele")

#Iniciando o programa de menu com select

PS3="Escolha uma das opções "
select menu in ${menuLista[@]}; do
        case $REPLY in
            1) echo -e "$menu é o nome mais bonito\n"                                 ;;
            2) echo -e "$menu é o cara\n"                                             ;;
            3) echo -e "$menu é a bruxa da familia\n"                                 ;;
            4) echo -e "$menu é a burra do cherek\n"                                  ;;
            *) echo -e "\033[31;1mPresta Atenção!\033[m Não existe essa opção\n"      ;;

        esac


done