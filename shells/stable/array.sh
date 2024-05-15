#!/usr/bin/env bash

#Criando a array para receber os valores dos nomes da familia

#nome[0]="Brenner"
#nome[1]="Denner"
#nome[2]="Brenda"
#nome[3]="Daniele"
#nome[4]="Danilo"
#nome[5]="Nanderson"
#nome[6]="Denilson"
arquivo="lupando.txt"
nome=("nome" "telefone")
i=1

for listaNomes in ${nome[@]}; do
        while [[ -z ${listaNomes[i]} ]]; do
        read -p "Qual é seu $listaNomes?" listaNomes[$i]
        done
        ((i++))
done 


[[ ! -e "$arquivo" ]] && > "$arquivo" || if ! grep -i "${nome,[*]}" "$arquivo"; then
        echo -e "${nome[0]}, ${nome[1]}\n${listaNomes[1]^}" , "${listaNomes[2]^}" >> "$arquivo"

else
        echo -e "${listaNomes[1]^^}" , "${listaNomes[2]^^}" >> "$arquivo"
fi


