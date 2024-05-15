#!/usr/bin/env bash

# VARIAVEIS DO PROGRAMA

arquivoBase='/home/estudo/Área de Trabalho/sos.txt'
mapfile -t dados <"${arquivoBase}"
declare -A idsBot # Declarando a variavel idsBot para ser uma array assosiativa

idsBot=(["brenner"]="213289248"\
        ["denner"]="193741501"\
        ["SOS"]="9375287843") # Aqui finaçiza o processo de receber os dados a array assosiativa
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213" # Chave API do bot conversa
contentType="content-type: application/json" # Dizendo para a requisição que será metodo JSON
zenity="nao"
pastaZenity="/usr/bin/zenity"
icone="/usr/share/pixmaps/sosImagem.png"
# FIM

# VERIFICAÇÕES

type -P "${pastaZenity}" && zenity="sim"
#FIM

if [[ "${zenity}" = "sim" ]];then
    comecar(){
                local tituloLabel="sos bot"
                local textoLabel="programa sos cadastro"
                comecar="$( zenity --info \
                                   --title="${tituloLabel^^}"\
                                   --text="${textoLabel^}"\
                                   --ok-label="COMEÇAR"\
                                   --window-icon="${icone}")" # Aqui termina a resposta da variavel começar

}
comecar # Chamando a função começar
echo "TERMINEI"
    movendo(){
    x=("1842" "1839" "1835" "1873" "2181")
    y=("379" "442" "497" "562" "621")
    ((i++))
    echo "O valor de 0 é "${armazem[0]}""
     echo "O valor de 1 é "${armazem[1]}""
        for i in "${!x[@]}";do
            if [[ "${armazem[i+1]}" ]]; then
                xdotool mousemove ${x[i]} ${y[i]} click 1 type --delay 150 "${armazem[i+1]}" # somando a variavel array para o mesmo i do armazem do for abaixo
                sleep 1s
                #((sair++))
                #((sair==8)) && exit
            else
                continue
            fi
        done
                #exit
}


for dado in "${dados[@]}";do
    for ((i=1;i<=4;i++)) ;do
        v=0
        cortando=$(cut -d',' -f"${i}" <<<"${dado}")
        echo "${cortando}"
        armazem[i]="${cortando}"
        #sleep 3s
    done # segundo for
    #((v++))
    #echo "Vetor dados ${v}"
    movendo "${armazem[i]}"
    #((qtds++))
    #echo "${qtds}"
    #((qtds==11)) && exit

done # primeiro for

else
    notify-send -u normal -t 5000 "Erro" "Sem zenity\nInstale para melhor atende-lo"
fi
