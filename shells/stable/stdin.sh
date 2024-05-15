#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################



##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################

# if [[ -p  "/dev/stdin" ]]; then
#     echo "Recebi pelo pipe: $(cat -)"
# else
#     echo "Não recebi nada ainda"
# fi

# if [[ -s  "/dev/stdin" ]]; then
#     echo "Recebi pelo stdin: $(cat -)"
# else
#     echo "Não recebi nada ainda pelo [[ -s  /dev/stdin ]]"
# fi

if [[ ! -t  0 ]]; then
    echo "Recebi pelo stdin: $(cat -)"
else
    echo "Dados so se for parametros"
fi
##########################################################
