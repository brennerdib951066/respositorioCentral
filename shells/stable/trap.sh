#!/usr/bin/env bash


# Define a função a ser executada quando o sinal SIGINT (interrupção) for recebido
int_handler() {
  echo -e "\E[41;1mRecebido o sinal de interrupção (Ctrl+C)\E[m"
  sleep 5s
  exit 1
}

# Configura o tratamento do sinal SIGINT para chamar a função int_handler


# Mensagem de aguardo


# Loop infinito para manter o script em execução
#while true
#do
# continue
#  sleep 5s
#done

while trap int_handler SIGINT; do

    echo "Pressione Ctrl+C para testar o tratamento do sinal de interrupção"
    sleep 5s

done
