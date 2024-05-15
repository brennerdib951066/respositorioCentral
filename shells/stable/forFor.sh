#!/usr/bin/env bash

dolars=('200' '100' '400' '50' '25' '35')
vdd=('É o mais calado' 'É mais chato' 'É mais poderosa!bum...' 'É a mais cagona' 'É o mais limpo e organizado' 'É mais beneficiado, paparicado!')
nomes=('brenner' 'denner' 'brenda' 'daniele' 'denilson' 'danilo')
abrirCores=('\E[32;1m' '\E[31;1m' '\E[33;1m' '\E[34;1m' '\E[35;1m' '\E[36;1m')
fechar='\E[m'

until [[ "${c}" = "2" ]]; do
        for i in ${!dolars[@]}; do
        sleep 2s
        echo -e "${abrirCores[$i]}${nomes[$i]} ${vdd[$i]}${fechar}"
        #     if [[ "${dolars[$i]}" -lt "50" ]];then
        #     sleep 1.5s
        #         echo -e "\E[31;1m${nomes[$i]^} está pobre com: ${dolars[$i]} dolares\E[m"
        #     else
        #     sleep 1.5s
        #         echo -e "\E[34;1mOpahh! ${nomes[$i]^} está rico com: ${dolars[$i]} dólares\E[m"
        #     fi
        done
((c++))
clear
done
