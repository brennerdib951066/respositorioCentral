#!/usr/bin/env bash

abrirCorVermelho="\E[31;5m"
abrirCorVerde="\E[32;1m"
fecharCor="\E[m"
arquivo="$HOME/Downloads/baixados"
listaDenner="denner@192.168.0.2:home/" ## Nao precisa de /(diretorio) no inicio depois dos 2dois pontos#

{ echo 'Enviando agora';sleep 2s ;}

! scp -r $arquivo $listaDenner && notify-send -t "1000" -u "critical" "ERRO" "Algo Deu Errado,Por Favor Verificar!" \
|| { exit 0 ; notify-send -i "face-cool" -t "3000" -u "normal" "Certinho" "Os Dados Foram Enviados Com sucesso!"; }
