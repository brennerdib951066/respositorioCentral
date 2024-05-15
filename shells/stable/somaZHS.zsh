#!/usr/bin/env zsh

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
notas=("1" "10" "7.9" "7")
# nota1="1"
# nota2="10"
# nota3="7.9"
# nota4="6"
soma=$((notas[1]+notas[2]+notas[3]+notas[4]))
media=$((soma/4))
##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################
if  ((media>=7.5)) ; then
        printf '%s %.2f\n' "Parabens você passou com a nota" "${media}"
elif ((media>=6.5 && madia < 7.5)); then
        printf '%s %.2f\n%s\n' "Felizmente você tem a nota:" "${media}" "Pode fazer a recuperação!"
else
        printf '%s %.2f\n' "Recuperação na íntegra:" "${media}"
fi
