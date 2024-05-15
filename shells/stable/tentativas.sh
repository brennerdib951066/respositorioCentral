#!/usr/bin/env bash

senhaOficial="6525"

until [[ ${senhaDigitada} = "${senhaOficial}" ]] ; do
    #i=0
    m=3
    ((i++))
    echo "$i"
    read -p "Tentivas já usadas ${i} de ${m}  " senhaDigitada
    ((i<m)) && continue || break

done

[[ "${senhaDigitada}" = "${senhaOficial}" ]] && echo "Senha ${senhaDigitada} Está correta!" || echo "Numero exessivo de tentativas!"
