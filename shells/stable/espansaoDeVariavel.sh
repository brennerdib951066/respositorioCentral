#!/usr/bin/env bash

# Se a variavel não tiver conteúdo/Nula
# Defina com que passar no argumento!

#read -p "Deseja sair[S/N]" opcao

#echo "${opcao:=S}"                                        # Definindo a variavel para S caso ela estaja nula!

#[[ "$opcao" = "S" ]] && echo "Obrigado pela confirmação!"


# Se a variavel estiver nula
# Mostre/imprima uma mensagem de erro!

#read -p "Qual seu nome?" nome
#echo "${nome:?Opah erro otario\!}"

# Se a variavel estiver definida retorne o argumento
# Se não deixe nula!

read -p "Qual seu animal favorito?" animal
echo "${animal:+"$animal" é um animal bem legal!}"
