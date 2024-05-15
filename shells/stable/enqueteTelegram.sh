#!/usr/bin/env bash

idChat="-1001704817999"
idChatCanal="-1001847248984"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"

# read -p $'\E[31;1mDescrição da enquete?\E[m' descricaoEnquete
# opcao1="To vendo"
# opcao2="Nem percebi"
# opcao3="To nem ligando"
# curl -X POST \
#     -H "Content-Type: application/json" \
#     -d '{
#         "chat_id": "'"$idChat"'",
#         "question": "'"$descricaoEnquete"'",
#         "options": ["'"$opcao1"'", "'"$opcao2"'", "'"$opcao3"'"],
#         "is_anonymous":false
#     }' \
#     "https://api.telegram.org/bot$TOKEN/sendPoll"
# mensagem="Fazendo tudo isso pelo terminal!\nSó alegria"
# curl -X POST -H "Content-Type: application/json" -d '{"chat_id":"'"$idChat"'","text":"'"$mensagem"'"}' "https://api.telegram.org/bot$TOKEN/sendMessage"

# enquete=("suponha que meu usuario seja naruto!\nQuando inicialmente aberto meu terminal qual seria sequencia de pastas eu visualizaria?" "Se eu estivesse dentro da minha pasta de usuario\nQual destas pasta estaria por lá?")
# opcao1=("home/naruto" "naruto")
# opcao2=("home/Naruto" "rosa")
# opcao3=("/home/naruto" "imagens")

i="1"
while [[ -z "$enquete" ]]; do
    read -p $'Forme a sua pergunta   ' enquete
done
for enqueteLoop in "${enquete[@]}"; do
    while [[ "$i" != "4" ]]; do
    read -p "Qual é a opcao?    " opcao[i]
    ((i++))
    echo "${opcao[@]}"
    done


curl -X POST \
    -H "Content-Type: application/json" \
    -d '{
        "chat_id": "'"$idChat"'",
        "question": "'"$enqueteLoop"'",
        "options": ["'"${opcao[1]}"'", "'"${opcao[2]}"'", "'"${opcao[3]}"'"],
        "is_anonymous":false
    }' \
    "https://api.telegram.org/bot$TOKEN/sendPoll"

done

# , "'"${opcao2[@]}"'", "'"${opcao3[@]}"'"
