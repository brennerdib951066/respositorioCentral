#!/usr/bin/env bash

arquivo='/home/estudo/Área de Trabalho/scripts/betas/corrigidos.txt'
# Variaveis Telegram

idBrenner="-1001858369092"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"

# FIM

# Variavel do bot conversa
declare -A idsBot
chaveApi="bc4c4106-b876-4e28-b65e-5106e9431213"
contentType="content-type: application/json"
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/subscriber_id/send_message/"
idsBot=(["brenner"]="213289248" ["denner"]="193741501" ["SOS"]="375287843")
# FIM

# teste de notificação
    testar="nao"
# FIM

#enviandoNotificacao(){
    #curl -s -F"chat_id"="${idBrenner}" -F"text"="Enviado com sucesso ${@}" "https://api.telegram.org/bot${TOKEN}/sendMessage"
#}

    recarrregar(){
    curl -X POST -H"${contentType}" -H"API-KEY: ${chaveApi}" -d"{ \"type\": \"text\", \"value\": \"*Estou em 10, vou regarregar!*\"}" "${url/subscriber_id/${idsBot[brenner]}}"
    # Regarrega a pagina
    xdotool mousemove 1811 410 click 1 sleep 2s key F5; sleep 3s
    # Clica em Acessar
    xdotool mousemove 1103 548 click 1 sleep 2s
    # Clica em cadastros
    xdotool sleep 1 mousemove 1299 366 click 1
    # Clica em produtos e serviços
    xdotool sleep 1 mousemove 1298 597 click 1
    # Clica em novo item
    xdotool sleep 1 mousemove 1603 280 click 1; sleep 1s
}

notificarSos(){

    curl -X POST -H "API-KEY: ${chaveApi}" -H "Content-Type: application/json" -d "{ \"type\": \"text\", \"value\": \"*_SOS esses são os detalhes dos produtos cadastrados:_*\n\n*Código:* ${recebendoResultadoVariavel1[i]}\n*Nome e Do Produto:* ${recebendoResultadoVariavel2[i]}\n*Preço:* ${recebendoResultadoVariavel3[i]}\n*Quantidade:* ${recebendoResultadoVariavel4[i]} \n\n*Já cadastramos ou corrigimos:* ${i}\"}" "https://backend.botconversa.com.br/api/v1/webhook/subscriber/${idsBot[SOS]}/send_message/"
}


mapfile dados < "${arquivo}"
echo "${dados[0]}" #> teste.txt

echo "${dados[1]}"
echo "${dados[2]}"

i=${#dados[@]}
r=0
for ((i=0;i<${#dados[@]};i++)); do
    echo "${i}"
    ((r++))
    #echo "${dados[i]}"
    resultadoVariavel1=($(cut -d',' -f'1' <<< "${dados[i]}"))
    resultadoVariavel2=("$(cut -d',' -f'2' <<< "${dados[i]}")")
    resultadoVariavel3=("$(cut -d',' -f'3' <<< "${dados[i]}")")
    resultadoVariavel4=("$(cut -d',' -f'4' <<< "${dados[i]}")")
    #resultadoVariavel5=("$(cut -d',' -f'5' <<< "${dados[i]}")")

    read recebendoResultadoVariavel1[i] <<< "${resultadoVariavel1}"
    read recebendoResultadoVariavel2[i] <<< "${resultadoVariavel2}"
    recebendoResultadoVariavel2[i]="${recebendoResultadoVariavel2[i]//[()]/}"
    recebendoResultadoVariavel2="${recebendoResultadoVariavel2[i]//ã/a}"
    recebendoResultadoVariavel2="${recebendoResultadoVariavel2[i]//ó/o}"
    #echo "${resultadoVariavel2}"; sleep 5s
    read recebendoResultadoVariavel3[i] <<< "${resultadoVariavel3}"
    read recebendoResultadoVariavel4[i] <<< "${resultadoVariavel4}"
    read recebendoResultadoVariavel5[i] <<< "${resultadoVariavel5}"

    echo "RECEBI ${recebendoResultadoVariavel1[i]}: INCREMNTO ${i}"
    echo "RECEBI ${recebendoResultadoVariavel2[i]}"
    echo "RECEBI ${recebendoResultadoVariavel3[i]}"
    echo "RECEBI ${recebendoResultadoVariavel4[i]}"
    echo "RECEBI ${recebendoResultadoVariavel5[i]}"


[[ "${r}" -eq 10 || "${testar}" = "sim" ]] && { r=0; recarrregar ;}

    cadastrar(){
        # Clica em descrição e escreve Brenner
        xdotool mousemove 1811 410 click 1 sleep 2s type --delay 170 "${recebendoResultadoVariavel2[i]}"; sleep 3s # Nome Do Produto
        # Clica em NMC e escreve 32082019
        xdotool mousemove 2091 480 click 1 type "${recebendoResultadoVariavel1[i]}" ; sleep 1s # Codigo
        # Clica em P500reço de Venda e escreve 500
        if [[ "${recebendoResultadoVariavel3[i]}" =~ ^0 ]]; then
            echo -e "\E[31;1mCOMEÇA COM ZERO\E[m"
            xdotool mousemove 3051 550 click 1 key BackSpace click 1 type --delay 150 "${recebendoResultadoVariavel3[i]}"; sleep 1s # Preço da venda
        else
            echo -e "\E[34;1mSem ZERO\E[m"
            xdotool mousemove 3051 550 click 1 key BackSpace click 1 type --delay 150 "${resultadoVariavel3}00"; sleep 1s # Preço da venda
        fi
        # Clica em Padrão Para impostos
        xdotool mousemove 1843 323 click 1; sleep 1s
        # Clica em ICMS
        xdotool mousemove 1598 434 click 1; sleep 1s
        # Clica em CST click para selecionar
        xdotool mousemove 1604 517 click 1; sleep 1s
        # Clica em imput do CST digite sua busca e escreve 102
        xdotool mousemove 1238 342 click 1 type "102"; sleep 1s
        # Clica no texto que aparece do codigo 102
        xdotool mousemove 1312 511 click 1; sleep 1s
        # CLica em PIS
        xdotool mousemove 1917 434 click 1; sleep 1s
        # Clica em CST do PIS
        xdotool mousemove 1917 515 click 1 ; sleep 1s
        # Clica em imput do CST digite sua busca e escreve 07 no PIS
        xdotool mousemove 1913 665 click 1; sleep 1s
        # Clica em COFINS
        xdotool mousemove 2073 433 click 1 ; sleep 1s
        # Clica em CST do COFINS e escreve codigo 07
        xdotool mousemove 2065 513 click 1; sleep 1
        # Clicando no codigo 07
        xdotool mousemove 1997 664 click 1; sleep 1s
        # Clica em salvar o cadastro
        xdotool sleep 2 mousemove 3267 1008 click 1; sleep 1s
        # FINALIZEI O PRIMEIRO PASSO

        # Clica em Movimentações
        xdotool mousemove 1311 785 sleep 3 click 1; sleep 1s
        # Clica em Lançamento de estoque
        xdotool sleep 1 mousemove 1318 519 click 1; sleep 1s
        # Clica no botão novo Lançamento
        xdotool sleep 1 mousemove 1632 278 click 1; sleep 1s
        # Clica em Produto em Lançamento de estoque
        xdotool sleep 1 mousemove 2146 535 click 1
        # Clica em pesquisa de produtos ou serviços cadastrados e escreve Brenner
        xdotool sleep 1 mousemove 1399 304 click 1 sleep 1 type --delay 150 "${recebendoResultadoVariavel2[i]}"; sleep 4s # Nome Do Produto
        # Clica na imagem do produto pesquisado
        xdotool sleep 1 mousemove 1424 452 click 1; sleep 1s
        # Clica em  quantidade em Lançamento de estoque
        xdotool sleep 1 mousemove 2194 430 sleep 1 click 1 sleep 1 type "${recebendoResultadoVariavel4[i]}"; sleep 3s
        # Clica em Tipo em Lançamento de estoque
        xdotool sleep 1 mousemove 2152 647 click 1
        # Clica na Entrada
        xdotool sleep 1 mousemove 2059 676 click 1
        # Clica em realizar Lançamento
        xdotool sleep 1 mousemove 2177 830 click 1
        # Clica em cadastros
        xdotool sleep 1 mousemove 1299 366 click 1
        # Clica em produtos e serviços
        xdotool sleep 1 mousemove 1298 597 click 1
        # Clica em novo item
        xdotool sleep 1 mousemove 1603 280 click 1; sleep 1s

        # SLEEP
        echo "FINAlIZEI O PROCESSO"
        sleep 0.2s

}

    [[ "${resultadoVariavel4}" && "${#resultadoVariavel2}" -lt 80 && "${testar}" = "nao" ]] && cadastrar || echo "${recebendoResultadoVariavel1[i]} ${recebendoResultadoVariavel2[i]} ${recebendoResultadoVariavel3[i]} ${recebendoResultadoVariavel4[i]}" >> sos2.txt
    notificarSos

done
