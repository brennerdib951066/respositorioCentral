#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
url="https://portalhashtag.com/login?next=https%3A%2F%2Fportalhashtag.com%2Faulas%2F1661224506387x352945069456750200"


##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################
mkdir '/home/brenner/Área de Trabalho/criei'
sleep 5s
rm -rf '/home/brenner/Área de Trabalho/criei'
DISPLAY=:0 google-chrome-stable --profile-directory='Default' "${url}"
