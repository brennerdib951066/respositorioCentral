#!/usr/bin/env bash

enviarParaDiretorio="Área de Trabalho/cesar/comparar"
arquivoCompararDf="$HOME/Área de Trabalho/cesar/listaConctenadas/dfConcatenadaOficialFiltrada.txt"
arquivoCompararMg="$HOME/Área de Trabalho/cesar/listaConctenadas/mgConcatenadaOficialFiltrada.txt"
buracoNegro="/dev/null"
dfs=df*.txt
mgs=mg*.txt


listagem="$(ls *[^.csv,.sh])"
idChatCanal="-1001847248984"
dennerId="739901623"
danieleChat="193744989"
brennerChat="213289248"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
keyBotConversa="bc4c4106-b876-4e28-b65e-5106e9431213"

readarray -t lista <<< "$listagem" #Fazendo a listagem ser interpretada como vetore
#echo "ECHOOO2 ${lista[2]}"


function renomear(){
    rename 'y/A-Z/a-z/' *[.txt,.csv,.xlsx]
}
renomear


formatos=("xlsx" "csv" "txt")
dfsLimpos="dfFiltrados.${formatos[1]}"
mgsLimpos="mgsFiltrados.${formatos[1]}"
f="1"
i="1"
function converterArquivos(){
if [[ "$enviando" != "converter" ]]; then
until [[ "${i}" = "${#lista[@]}" && "$f" = "2" ]]  ; do
    for converter in "${lista[@]}" ; do
        read <<<${converter[$i]}
        ssconvert "${converter}" "${converter%.${formatos[0]}}.${formatos[f]}" 2>"$buracoNegro"
        echo "FFF ${f}"
    done
    ((f++))
    ((i++))
    sleep 5s
done
else
    f="2"
    for converter in "$dfsLimpos" "$mgsLimpos"; do
    ssconvert "${converter}" "${converter%.${formatos[1]}}.${formatos[$f]}" 2>"$buracoNegro"
        echo "${f}"
        if [[ "${converter//.csv/.txt}" = "${dfsLimpos//.csv/}.${formatos[2]}" ]];   then
            cut -d',' -f'1,3' "${converter//.csv/.txt}">> "$arquivoCompararDf"
            sleep 10s
        elif [[ "${converter//.csv/.txt}" = "${mgsLimpos//.csv/}.${formatos[2]}" ]]; then
            cut -d',' -f'1,3' "${converter//.csv/.txt}">> "$arquivoCompararMg"
            sleep 10s
        else
        echo "Cara nao é nada aqui!!!"
        fi

    done && rm *.txt *.csv

fi
}
converterArquivos #&& rm *.csv

# function filtrar(){
#     sort -t',' -u -k1,3 ${dfs,,} | sort -R | cut -d',' -f'1,2,3,7' >>"$dfsLimpos"
#     sort -t',' -u -k1,3 ${mgs}   | sort -R | cut -d',' -f'1,2,3,7' >>"$mgsLimpos"
# }
# filtrar ###Chamando a funcao filtrar
#
# dadosLimposDf=$(cat $dfsLimpos   | wc -l)
# dadosSujoDf=" $(cat ${dfs,,}     | wc -l)"
# dadosLimposMg=$(cat "$mgsLimpos" | wc -l)
# dadosSujoMg=" $(cat ${mgs,,}     | wc -l)"
#
#
# countRepetidosDF="$(echo -e "*Lista repetida DF: $((dadosSujoDf-dadosLimposDf))*")"
# countRepetidosMG="$(echo -e "*Lista repetida MG: $((dadosSujoMg-dadosLimposMg))*")"
#
# ids=("converter")
#
# echo "Chamando for case"
# sleep 7
# for enviando in "${ids[@]}"; do
#     case "$enviando" in
#     converter) { converterArquivos ;}
#
#     esac
#
# done


