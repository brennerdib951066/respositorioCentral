#!/usr/bin/env bash

cor="\E[033;5m"
cor2="\E[34;4m"
fecharCor="\E[m"
buracoNegro="/dev/null"
url="www.google.com"
senhaOficial="652516"
m=3
#################TESTES DO PROGRAMA#####################################################################
if ! wget -q --spider ${url} ;then
    echo -e "${cor}Sem Internet No momento${fecharCor}"
    exit 1
fi

(($UID==0)) && { echo -e "${cor2}Deixa de ser esperto!${fecharCor}"; exit 1 ;}

until [[ "${senhaDigitada}" = "${senha}" ]]; do
    ((t++))
    #echo "$t" verificando a qtds de tentivas
    echo -e "$t TENTATIVA\n"
    read -p 'SENHA:   ' senhaDigitada
    ((t<m)) && continue || break
    { echo -e "${cor}Numero excessivo de tentivas${fecharCor}"; exit 1; }
done
##########################################################################################################

{ echo -e "Crendenciais Digitadas Corretamente\n"; sleep 2s ;}
# PS3="Escolha Alguma Opção   " #PS3 PARA O SELECT
# select menu in "Abrir Gedit" "Abrir Chrome" "Abrir Barrier" "Abrir Calendário"; do
#             case "$REPLY" in
#                         "1") echo "$REPLY"             ;;
#                         "2") google-chrome --profile-directory="Profile 2" "https://bubble.io/page?name=index&id=viverbemseguroscrm&tab=tabs-1" "https://www.sistemaviverbemseguros.com/version-test" "https://bubble.io/page?type=page&name=index&id=viverbemseguroscrm&tab=tabs-3&subtab=Data+Types&type_id=avisosdeatualizacao" 2>"$buracoNegro" >"$buracoNegro"                    & ;;
#                         "3") barrier 2>"$buracoNegro" >"$buracoNegro"                                                                                                &  ;;
#                         "4") gnome-calendar %U                                                                                                                    &  ;;
#                         *) echo "Opah! Opção não existe!"             ;;
#             esac
#             break
# done





