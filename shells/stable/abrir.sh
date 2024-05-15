#!/usr/bin/env bash

#Trabalhando com numero
 PS3="Onde deseja ir?  "
#Criando a variavel de para receber lista
menuLista=( "Bubble" "CRM LIVE" "https://www.youtube.com" "https://translate.google.com.br" )
usuarioGoogle="Profile 1"

 select menu in "${menuLista[@]}"; do
#         echo "Escolha onde deseja navegar"
         echo "${menu[@]}"
   case "$REPLY" in
       1) google-chrome --profile-directory="$usuarioGoogle" https://bubble.io/home/apps? mode=login&authuser=0&prompt=consent&scope=email%20profile%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20openid &                                   ;;
       2) google-chrome --profile-directory="$usuarioGoogle" https://www.sistemaviverbemseguros.com                       ;;
       3) google-chrome https://www.youtube.com             &           ;;
       4) google-chrome https://translate.google.com.br     &           ;;
       *) echo "Nao existe essa opção maluco!!!"
   esac

 done

# arquivosLista=( /home/brenner/'Área de Trabalho'/Backups/** )
#
# for listar in "${!arquivosLista[@]}"; do
#        echo "O vetor é "$listar" ${arquivosLista[$listar]}"
# done
