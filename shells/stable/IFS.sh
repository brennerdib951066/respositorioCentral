#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
IFS=,
arquivo="/home/brenner/Área de Trabalho/dados"

##########################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA##################



##########################################################

####################VERIFICAÇÕES##########################


##########################################################

head -n1 "${arquivo}" | grep -iE '(nome,?|telefone?)'

