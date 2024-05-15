#!/usr/bin/env bash

buracoNegro="/dev/null"
SortFiltrarColunns= -t',' -u -k1,3
linha="\n"
idChatDenner="739901623"
idChatCanal="-1001827855457"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
operacaoTestes="false"
#CutFiltrandoColunns= -d"," -f"1,2"
lista="$(ls *[^.sh,.csv])"

echo "$lista"
##########################################################
readarray -t listaNova <<<"$lista"

echo "${#listaNova[@]}"

function renomear(){
    rename 'y/A-Z/a-z/' *
}
renomear

formatos=("xlsx" "csv" "txt")
f="1"
function converterArquivos(){
until [[ "$f" = "${#formatos[@]}" || $1 ]]        ; do
if [[ -z $1 ]]; then
for converter in "${listaNova[@]}"          ; do
    echo "CONVERTER $converter"
    read "$formatos"<<<${formatos[$f]}
    ssconvert "$converter" "${converter%.${formatos[0]}}.${formatos[$f]}" 2>>"$buracoNegro"


    function filtrar(){

        echo "Aqui começa o filtro"
        sort -t',' -u -k1,3 "${converter%.$formatos}.${formatos[2]}" | sort -R >>"${converter%.${formatos}}Filtrada.${formatos[2]}"
        }
         [[ "${converter%.$formatos}.${formatos[2]}" = "${converter%.$formatos}.${formatos[2]}" && "$f" = "2" ]] && filtrar ####### Chamando a funcao filtrar



done
else
    for converter in "${listaFiltroNovo[@]}"          ; do
        ssconvert "$converter" "${converter%.${formatos[2]}}.${formatos[1]}" 2>>"$buracoNegro"
    done
fi

((f++))
done
}
converterArquivos; ((f--));listaFiltro=$(ls *Filtrada.txt); readarray -t listaFiltroNovo <<<"$listaFiltro" ;converterArquivos $1 ######################################Chamando a função converter arquivos
#{ echo "descrementando"; sleep 5s;((f--));converterArquivos ;}


# listaGlob=("df" "mg")
# function filtrando(){
# for sorteando in "${listaGlob[@]}"          ; do
#     sort $SortFiltrarColunns $sorteando*."${formatos[2]}" | cut -d"," -f"1,2" >"$sorteando"Filtrado."${formatos[2]}"
#
# done
# }
# filtrando           ######################################Chamando a função filtrando arquivos
#
# function removerNaoFiltrados(){
#     rm *.csv
# }
# removerNaoFiltrados ######################################Chamando a função filtrando arquivos
#
#  function removerTudo(){
#      rm *.txt *.csv
#  }

# listaFiltrados=(dfF*.txt mgF*.txt)
# listaIds=($idChatCanal $idChatDenner)
# for converterCsv in "${listaFiltrados[@]}"     ; do
#         ssconvert "$converterCsv" "${converterCsv%.${formatos[2]}}.${formatos[1]}"
#         echo "$converter"
#     for ids in "${listaIds[@]}"             ; do
#
#         for mandarArquivos in "${converterCsv}"; do
#             [[ $mandarArquivos = ${listaFiltrados[0]} ]] &&\
#         { filtroCountDf="$(wc -l $mandarArquivos | cut -d' ' -f'1')"; countDf="$(echo $(($filtroCountDf)))" ;} || { filtroCountMg="$(wc -l $mandarArquivos | cut -d' ' -f'1')"; countMg="$(echo $(($filtroCountMg)))" ;}
#
#
#               if [[ "$mandarArquivos" = "${listaFiltrados[0]}" ]]; then
#               sleep 2s
#               echo -e "\E[34;1mCalculo DF $calculoDf\E[m"
#                 curl -s -F chat_id="$ids" -F caption="DF limpo: $(($countDf-verCalculo)) DF Recebidos: $calculoDf" -F document=@$HOME/'Área de Trabalho'/cesar/comparar/${mandarArquivos} "https://api.telegram.org/bot$TOKEN/sendDocument"
#               else
#               sleep 2s
# #               echo -e "\E[34;1mCalculo MG $calculoMg\E[m"
# #                 curl -s -F chat_id="$ids" -F caption="MG limpo: $countMg MG Recebidos: $calculoMg" -F document=@$HOME/'Área de Trabalho'/cesar/comparar/${mandarArquivos} "https://api.telegram.org/bot$TOKEN/sendDocument"
#               fi
#
#         done
#     done
#
# done
[[ "$operacaoTestes" = "true" ]] && { sleep 1s; removerTudo ;}

