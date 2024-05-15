#!/usr/bin/env bash

abrirCorVermelho="\E[31;1m"
fecharCor="\E[m"
mapfile -t linha <"bibliotecas/hostIds.txt"


function entrada(){
    read -p 'Qual arquivo deseja enviar?   ' enviar
    read -p 'Nome da maquina que irá receber  ?'           receptor
    [[ "$USER" = "brenner" ]] && diretorioReceptor="/home/denner" || diretorioReceptor="/home/brenner"
    [[ -z "${enviar}" || -z ${receptor} ]] && entrada
}
entrada

i=0
for linhas in "${linha[@]}"; do
    #echo "${linha[@]}"
    ((i++))
    read receberLinha[$i] <<<"${linhas}"
    [[ "$i" = "1" && "${receptor}" = "brenner" ]] && { echo -e "${abrirCorVermelho}É o parametro \1 ${receberLinha[i]}${fecharCor}"; scp "${enviar}" "${receptor}@"${linhas%%#*}":${diretorioReceptor}" ;}
    [[ "$i" = "2" && "${receptor}" = "denner" ]] && { echo -e "${abrirCorVermelho} o parametro  \2 ${receberLinha[i]}${fecharCor}"; scp -r "${enviar}" "${receptor}@"${linhas%%#*}":${diretorioReceptor}" ;}

done
