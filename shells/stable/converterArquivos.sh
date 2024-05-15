#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
diretorio="/home/brenner/Downloads"
viverBem="$diretorio/viverBemPlanilhas/csvs"


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################
shopt -s extglob
qualDiretorio()
{
            read -p $'\E[31;1mDiretorio:\E[m   ' respostaEscolhendoDiretorio
            [ "$respostaEscolhendoDiretorio" ] || qualDiretorio
}

qualArquivo()
{
            read -p $'\E[31;1mEspecifique o caminho absoluto do arquivo:\E[m   ' respostaEscolhendoArquivo
            [ "$respostaEscolhendoArquivo" ] || qualArquivo
}

until [ "$respostaDiretorio" ]; do
    read -p $'\E[37;1mDeseja converter um diretorio completo[S/n]\E[m   ' respostaDiretorio
    [ ! "${respostaDiretorio}" ] && respostaDiretorio="s"
    [[ "${respostaDiretorio^^}" = "S" ]] && qualDiretorio
    [[ "${respostaDiretorio^^}" = "N" ]] && qualArquivo || break

done

if [ ! "${respostaEscolhendoDiretorio}" ] ; then
    if [[ "${respostaEscolhendoArquivo}" = *.txt ]]; then
            ssconvert "${respostaEscolhendoArquivo}" "${respostaEscolhendoArquivo%.txt}.csv"  &&\
            notify-send -u normal -t 5000 "Sucesso" "A conversão foi bem sucedida!" ||\
            notify-send -u critical -t 5000 "Erro" "Erro ao fazer a conversão"
    else
            ssconvert "${respostaEscolhendoArquivo}" "${respostaEscolhendoArquivo%.csv}.txt"  &&\
            notify-send -u normal -t 5000 "Sucesso" "A conversão foi bem sucedida!" ||\
            notify-send -u critical -t 5000 "Erro" "Erro ao fazer a conversão"
    fi

else
        for converter in ${respostaEscolhendoDiretorio}/* ; do
            ssconvert "${converter}" "${converter%.txt}.csv" &>- &&\
            notify-send -u normal -t 5000 "Sucesso" "A conversão foi bem sucedida!" ||\
            notify-send -u critical -t 5000 "Erro" "Erro ao fazer a conversão"
        done
fi
# for converter in ${viverBem}/*.csv ;do
#     ssconvert "${converter}" "${converter%.csv}.txt"
# done

# printf "SO VENDO MESMO ${respostaEscolhendoDiretorio}\n"
# printf "SO VENDO MESMO ${respostaEscolhendoArquivo}\n"
