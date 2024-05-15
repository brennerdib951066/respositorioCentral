#!/usr/bin/env bash

read -p $'\E[34;1mQual será o telefone?\E[m   ' telefone
read -p $'\E[31;1mQual será o primeiro nome\E[m?   ' primeiroNome
read -p $'O Sobre Nome?   ' segundoNome
 curl -X POST "https://backend.botconversa.com.br/api/v1/webhook/subscriber/" -H "accept: application/json" -H "API-KEY: bc4c4106-b876-4e28-b65e-5106e9431213" -H "Content-Type: application/json" -d "{\"phone\": \"$telefone\", \"first_name\": \"$primeiroNome\", \"last_name\": \"$segundoNome\"}"
