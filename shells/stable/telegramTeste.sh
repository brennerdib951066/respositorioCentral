#!/usr/bin/env bash

idChat="-986292697"
TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
# curl -X POST https://api.telegram.org/bot$TOKEN/sendPoll  -d "chat_id=$idChat&question=Qual é a sua cor favorita?&options=["Azul","Verde"]&type=regular"

curl -X POST -H "Content-Type: application/json" -d '{ "chat_id": "-986292697", "question": "testando apenas","options":[opcao1,opcao2]}' "https://api.telegram.org/bot5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc/sendPoll"
