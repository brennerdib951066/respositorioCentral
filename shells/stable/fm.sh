#!/usr/bin/env bash

#########################HEAD#############################



##########################################################
####################VARIAVEIS DO PROGRAMA##################
declare -A strean
strean=(["Jovem Pan"]="http://142.4.217.133:8047")


##########################################################


select radio in "${strean[@]}"; do
        title="${radio}"
        ip="${strean[$radio]}"
        ffplay -window_title "${title}" "$ip"
done
