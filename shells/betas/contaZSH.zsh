#!/usr/bin/env zsh


####################### VARIAVEIS COMUNS DO PROGRAMA ############################################################
notas=(10 5 "9.67" 7)
soma=$((notas[0]+notas[1]+notas[2]+notas[3]))
media=$((soma/4))
#################################################################################################################


if ((media>7.5)) ; then
    printf '%s\n' "Parabens aluno você obteve a media de: $media Por isso passou"
elif ((media>6&&media<7.5)) ; then
    printf '%s\n' "Aluno infezlimente você está de recuperação, sua media $media"
else
    printf '%s\n' "Aluno você reprovou direto, sua media $media"
fi
