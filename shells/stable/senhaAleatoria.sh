#!/usr/bin/env bash



# Define o tamanho padrão da senha
PASSWORD_LENGTH=10

# Gera uma senha aleatória usando a função 'openssl rand' e converte para base64
PASSWORD=$(openssl rand -base64 48 | tr -d '\n\r')

# Corta a senha para o tamanho desejado
PASSWORD=${PASSWORD:0:$PASSWORD_LENGTH}
#Começando o script




 echo -e " Escreva a senha enviada para o \033[31;1m arquivo responsavel \033[1m"
 read senhaAleatoria
 echo -e "Sua senha aleatória é : $senhaAleatoria"
# Exibe a senha gerada na tela Ou manda para o arquivo
echo "$PASSWORD" >> arquivoResponsavel.txt
