#!/usr/bin/env bash

vendas=("200" "550" "800" "599" "2000")
dados=("brenner" "denner" "brenda" "daniele" "danilo")
comecou=("10/10/2015" "15/02/2016" "05/12/2016" "15/05/2019" "16/06/2018")
meta="1000"

for i in "${!vendas[@]}" ;do # O for irá armazenar os indeces da variavel vendas, com isso, poderei usar os indeces tambem de outras lista
	if [[ "${vendas[i]}" -lt "${meta}" ]];then
		echo -e "\E[31;1m${dados[i]} Não bateu a meta ${vendas[i]}, começou em ${comecou[i]}\E[m"
		continue
	else
		echo -e "\E[32;1m${dados[i]} bateu a meta com ${vendas[i]}, começou em ${comecou[i]}\E[m"
	fi
done
