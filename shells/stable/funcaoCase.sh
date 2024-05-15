#!/usr/bin/env bash

####################VARIAVEIS DO PROGRAMA##################



##########################################################

function casear(){
        case "${1}" in
        Conectar)    echo "Conectando"         ;;
        Desconectar) echo "Desconectando"      ;;
        *) echo "Sem opções"
        esac

}

[ "${USER}" = "brenner" ] && { casear $@ ;}

