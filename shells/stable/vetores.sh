#!/usr/bin/env bash

idChatCanal="-1001847248984"



dados=("Sua " "Seu")
opcao=("vermelho" "cachorro")

i=1

for dadosLoop in "${dados[@]}" "${opcao[@]}"; do


    sleep 1s
       curl -X POST     -H "Content-Type: application/json"     -d '{
        "chat_id": "'"$idChatCanal"'",
        "question": "'"${dados[$dadosLoop]}"'",
        "options": ["'"Brenner"'", "'"denner"'"],
        "is_anonymous":true,
        "type":"quiz",
        "correct_option_id":0,
        "explanation":"Voce Escolheu errado seu burro!"

    }'     "https://api.telegram.org/bot$TOKEN/sendPoll"


done

