#!/usr/bin/env bash

comando=("apt upgrade" "apt update")
comando2="apt list --upgradable"
comando3="apt autoremove"
(($UID>0)) && { echo "Precisa de root para funcionar!"; exit 1 ;}
for atualizar in "${comando[@]}"; do
    eval $atualizar -y

done

enviar=$(eval "$comando2" | tail -n5| cut -d'/' -f'1')
for atualizarRestantes in "$enviar" "$comando3"; do
    eval "${comando[0]}" "$enviar" "$comando3" 2>&- >&-
    [[ "$atualizarRestantes" = "$comando3" ]] && eval "$comando3" -y
done
