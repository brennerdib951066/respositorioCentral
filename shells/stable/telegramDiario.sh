#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS COMUNS DO PROGRAMA##################
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
urlTelegram="https://api.telegram.org/bot${TOKEN}/sendDocument"
CHAT_IDBackup="-1001831122226"
##################################################################

curl -s -F chat_id="${CHAT_IDBackup}" -F document="@${arquivo}" "${urlTelegram}" # Enviando para o telegram o backup

# printf "${urlTelegram}\n"
# printf "${arquivoFinal}\n"
